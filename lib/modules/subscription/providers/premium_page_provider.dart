import 'package:vibed/core/data/api/analytics_api.dart';
import 'package:vibed/core/data/models/subscription.dart';
import 'package:vibed/core/states/models/user_state.dart';
import 'package:vibed/core/states/user_state_notifier.dart';
import 'package:vibed/modules/subscription/providers/models/premium_state.dart';
import 'package:vibed/modules/subscription/repositories/subscription_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'premium_page_provider.g.dart';

@Riverpod(keepAlive: false)
class PremiumStateNotifier extends _$PremiumStateNotifier {
  final Logger _logger = Logger();

  UserState get _userState => ref.read(userStateNotifierProvider);

  SubscriptionRepository get _subscriptionRepository =>
      ref.read(subscriptionRepositoryProvider);

  AnalyticsApi? get _analyticsApi => ref.read(analyticsApiProvider);

  @override
  Future<PremiumState> build() async {
    try {
      // If you have installed the remote config brick
      // you can use it like this
      // RemoteConfig is amazing to manage and test different settings for paywalls
      // ex: you can test different title and texts
      // final remoteConfigApi = ref.watch(remoteConfigApiProvider);
      // print(remoteConfigApi.subscription.title.value);
      final offers = await _subscriptionRepository.getOffers();

      return switch(_userState.subscription) {
        SubscriptionStateData(:final activeOffer) => PremiumState.active(
          activeOffer: offers.firstWhere(
            (element) => element.skuId == activeOffer?.skuId,
            orElse: () => offers.first,
          ),
        ),
        SubscriptionInactiveStateData() => PremiumState(
          offers: offers,
          selectedOffer: offers.first,
        ),
        _ => const PremiumState(
          offers: [],
        ),
      };
    } catch (err, stack) {
      await Sentry.captureException(err, stackTrace: stack);
      _logger.e('''
          ...PremiumStateNotifier: init failed, 
          👉 Make sure you have properly setup subscription 
          following our guide (https://apparencekit.dev/docs/monetize/subscription-template/) 
          $err --> $stack
      ''', stackTrace: stack);
      return const PremiumStateData(offers: []);
    }
  }

  Future<void> startCoupon() async {
    if (TargetPlatform.iOS != defaultTargetPlatform) {
      return;
    }
    await Purchases.presentCodeRedemptionSheet();
  }

  void selectOffer(SubscriptionProduct offer) {
    if (state.value == null) {
      throw "cannot select offer";
    }
    final newState = switch (state.value!) {
      final PremiumStateData el => el.copyWith(selectedOffer: offer),
      final PremiumStateActive el => el.copyWith(activeOffer: offer),
      _ => null,
    };
    if (newState == null) {
      throw "cannot select offer";
    }
    state = AsyncValue.data(newState);
  }

  Future<void> purchase({String? paywall}) async {
    if (state.value is! PremiumStateData) {
      throw "cannot purchase without offers";
    }
    final offer = state.value?.selectedOffer;
    if (offer == null) {
      throw "cannot purchase without selected offer";
    }
    await purchaseOffer(offer, paywall: paywall);
  }

  Future<void> purchaseOffer(
    SubscriptionProduct offer, {
    String? paywall,
  }) async {
    state = switch (state.value) {
      PremiumStateData(:final offers) => AsyncData(
        PremiumState.sending(
          isPremium: false,
          offers: offers,
          selectedOffer: offer,
        ),
      ),
      _ => throw "cannot purchase while active",
    };
    try {
      final entitlements = await _subscriptionRepository.purchase(offer);
      state = AsyncData(PremiumState.active(activeOffer: offer));
      await _analyticsApi?.logEvent("purchase", {
        "skuId": offer.skuId,
        "price": offer.price,
        // "promotion": offer.promotion,
        "duration": offer.duration,
        "paywall": paywall,
      });
      // let's refresh the user state
      await ref
          .read(userStateNotifierProvider.notifier)
          .refreshSubscription(product: offer, entitlements: entitlements);
    } catch (err, stackTrace) {
      await Sentry.captureException(err, stackTrace: stackTrace);
      state = switch (state.value) {
        PremiumStateData(:final offers) => AsyncData(
          PremiumState(offers: offers, selectedOffer: offer),
        ),
        _ => throw "cannot purchase while active",
      };
      _logger.e("...PremiumStateNotifier: purchase failed $err : $stackTrace");
      throw SubscriptionException(err.toString());
    }
  }

  Future<void> unsubscribe() async {
    // _analytics.logPageOpened("launch_unsubscribe_page");
    await _subscriptionRepository.unsubscribe();
  }

  Future<void> restore() async {
    state = switch (state.value) {
      PremiumStateData(:final offers, :final selectedOffer) => AsyncData(
        PremiumState.sending(
          isPremium: false,
          offers: offers,
          selectedOffer: selectedOffer,
        ),
      ),
      _ => throw "cannot restore while active",
    };
    try {
      await _subscriptionRepository.restorePurchase();
    } catch (err, trace) {
      _logger.e("Error while restoring purchase: $err : $trace");
      state = AsyncData(
        PremiumStateData(
          offers: state.value!.offers,
          selectedOffer: state.value!.selectedOffer,
        ),
      );
      throw SubscriptionException(err.toString());
    }
  }
}

class SubscriptionException implements Exception {
  final String message;

  SubscriptionException(this.message);
}
