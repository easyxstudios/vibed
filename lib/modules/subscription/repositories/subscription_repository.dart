import 'package:vibed/core/data/models/subscription.dart';
import 'package:vibed/core/initializer/onstart_service.dart';
import 'package:vibed/core/shared_preferences/shared_preferences.dart';
import 'package:vibed/modules/subscription/api/inapp_subscription_api.dart';
import 'package:vibed/modules/subscription/api/subscription_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:purchases_flutter/models/entitlement_info_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

final subscriptionRepositoryProvider = Provider(
  (ref) => SubscriptionRepository(
    subscriptionApi: ref.watch(subscriptionApiProvider),
    inAppSubscriptionApi: ref.watch(inAppSubscriptionApiProvider),
    prefs: ref.watch(sharedPreferencesProvider).prefs,
    // remoteConfig: ref.watch(remoteConfigApiProvider),
  ),
);

const _lastAskKey = 'subscription_last_asking_date';

/// This class is responsible for managing the subscription of the user
/// It will be used to know if the user is subscribed or not and to get the subscription
/// A fake implementation of the revenue cat is used for units test see: [InAppSubscriptionApiFake]
class SubscriptionRepository implements OnStartService {
  final SubscriptionApi _subscriptionApi;

  final RevenueCatPaymentApi _inAppSubscriptionApi;

  final SharedPreferences? _prefs;

  final Logger _logger;

  /// You can use the remote config to configure the subscription module
  /// For example, you can set the number of hours between two requests to the API
  // final RemoteConfigApi? _remoteConfig;

  SubscriptionRepository({
    required SubscriptionApi subscriptionApi,
    required RevenueCatPaymentApi inAppSubscriptionApi,
    required SharedPreferences? prefs,
    // RemoteConfigApi? remoteConfig,
    Logger? logger,
  })  : _subscriptionApi = subscriptionApi,
        _logger = logger ?? Logger(),
        _prefs = prefs,
        // _remoteConfig = remoteConfig,
        _inAppSubscriptionApi = inAppSubscriptionApi;

  @override
  Future<void> init() async {
    try {
      // We must init the subscription API
      await _inAppSubscriptionApi.init();
    } catch (e) {
      _logger.w('''
        Revenuecat seems not to be initialized. 
        👉 Please check that you have setup your account on https://revenuecat.com
        And that you have added your token in the environment file or variable (see lib/environnements.dart)
        or
        👉 Remove completely the subscription module if you don't need it
      ''');
    }
  }

  // We use a custom subscriber id to be able to identify the user
  Future<void> initUser(String userId) async {
    await _inAppSubscriptionApi.initUser(userId);
    
  }

  /// We get the subscription of the user
  /// We fetch the subscription from our own API and not directly from RevenueCat
  /// So we can grant some free subscription to users easily
  /// Either you can uncomment the code to directly check from RevenueCat
  Future<Subscription> get(String userId) async {
    final entity = await _subscriptionApi.get(userId);
    final subscription = Subscription.fromEntity(
      entity,
      lastAskingDate,
    );
    if (subscription.isActive) {
      final entitlements = await _inAppSubscriptionApi.getEntitlements();
      final product = await _inAppSubscriptionApi.getFromProductId(
        entity!.skuId,
      );
      
      return switch(subscription) {
        final SubscriptionStateData active => active.copyWith(
          activeOffer: product,
          entitlements: entitlements,
        ),
        _ => subscription,
      };
    }
    return subscription;

    /// Use this if you want to directly check user subscription from RevenueCat
    // return _inAppSubscriptionApi.getActiveSubscription().then(
    //   (activeOffer) {
    //     if (activeOffer.isEmpty) {
    //       return Subscription.inactive(
    //         lastAskingDate: lastAskingDate,
    //         hoursBetweenTwoRequests:
    //             _remoteConfig?.subscription.hoursBetweenTwoRequests.value ?? 24,
    //       );
    //     }
    //     return Subscription.active(
    //       activeOffer: activeOffer.first,
    //     );
    //   },
    // );
  }

  // We can have multiple offers (BASIC MONTH, BASIC YEAR, GOLD MONTH, GOLD YEAR, ...)
  Future<List<SubscriptionProduct>> getOffers({String? offerId}) async {
    return _inAppSubscriptionApi.getOffers(offerId);
  }

  // We check if the user has a permission
  // This allows us to add multiple permissions within subscription
  // If you want only have a single premium subscription, you can create a single permission 'premium'
  Future<bool> checkPermission(String permissionToCheck) async {
    final permissions = await _inAppSubscriptionApi.getPermissions();
    if (permissions.isEmpty) {
      throw Exception("Permission denied");
    }
    return permissions.isNotEmpty;
  }

  /// The purchase method is used to buy a subscription or a product
  Future<List<EntitlementInfo>?> purchase(SubscriptionProduct product) async {
    if (product is RevenueCatProduct) {
      await _inAppSubscriptionApi.purchasePackage(product.revenueCatPackage);
      return _inAppSubscriptionApi.getEntitlements();
    }
    throw Exception('Invalid product');
  }

  /// Unsubscribe the user
  /// This will route the user to the subscription management page
  /// This is handled by the Play Store or the App Store
  Future<void> unsubscribe() async {
    await _inAppSubscriptionApi.unsubscribe();
  }

  /// Restore a previous purchase
  /// For ex if the user has changed his phone
  /// he can restore his previous purchase
  Future<void> restorePurchase() async {
    await _inAppSubscriptionApi.restorePurchase();
  }

  /// Save the last time we showed the subscription paywall
  Future<void> saveLastAskingDate() async {
    final now = DateTime.now();
    await _prefs!.setInt(_lastAskKey, now.millisecondsSinceEpoch);
  }

  /// Get the last time we showed the subscription paywall
  DateTime? get lastAskingDate {
    final lastAsk = _prefs?.getInt(_lastAskKey);
    if (lastAsk == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(lastAsk);
  }
}
