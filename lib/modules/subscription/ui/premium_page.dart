import 'package:vibed/core/data/api/analytics_api.dart';
import 'package:vibed/core/widgets/toast.dart';
import 'package:vibed/modules/subscription/providers/models/premium_state.dart';
import 'package:vibed/modules/subscription/providers/premium_page_provider.dart';
import 'package:vibed/modules/subscription/ui/component/active_premium_content.dart';
import 'package:vibed/modules/subscription/ui/component/premium_page_factory.dart';
import 'package:vibed/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PremiumPageArgs {
  final String? redirect;

  const PremiumPageArgs({this.redirect});
}

/// The premium page is the page where the user can subscribe to the premium offer
/// It's also named as Paywall
///
/// - This page is responsible for displaying the offers or the active subscription
/// - It also handles the purchase and restore of the subscription
/// - It also handles the redirection after the purchase see [PremiumPageArgs]
class PremiumPage extends ConsumerWidget {
  final PremiumPageArgs? args;

  const PremiumPage({super.key, this.args});

  bool get hasRedirect => args?.redirect != null;

  void _handleRedirection(BuildContext context) {
    if (hasRedirect) {
      context.go(args!.redirect!);
    }
  }

  PremiumStateNotifier getNotifier(WidgetRef ref) =>
      ref.read(premiumStateNotifierProvider.notifier);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final premiumState = ref.watch(premiumStateNotifierProvider);

    /// ===============================================
    /// This is an example of how to get the paywall from the remote config
    /// You can use this to test different paywalls
    /// ===============================================
    // final configuredPaywall = ref
    //     .read(remoteConfigApiProvider) //
    //     .subscription
    //     .paywall;

    // final paywallFactory = switch (configuredPaywall) {
    //   'withSwitch' => PaywallFactory.withSwitch,
    //   _ => PaywallFactory.basic,
    // };

    const paywallFactory = PaywallFactory.basic;

    return switch (premiumState) {
      AsyncError() => const Center(
        child: Text("Error while loading the offers"),
      ),
      AsyncLoading() => const Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
      AsyncData(:final value) => switch (value) {
        final PremiumStateActive data => ActivePremiumContent(
          offer: data.activeOffer,
          onTap: () => getNotifier(ref).unsubscribe(),
        ),
        final PremiumStateSending data => paywallFactory.buildSending(
          offers: data.offers,
          selectedOffer: data.selectedOffer,
          onSelectItem: (data) => getNotifier(ref).selectOffer(data),
        ),
        final PremiumStateData data => paywallFactory.build(
          offers: data.offers,
          selectedOffer: data.selectedOffer,
          onSelectItem: (data) => getNotifier(ref).selectOffer(data),
          onSkip: () {
            final analyticsApi = ref.read(analyticsApiProvider);
            analyticsApi.logEvent('premium_exit', {});
            if (hasRedirect) {
              _handleRedirection(context);
            } else {
              context.pop();
            }
          },
          // This is the restore action
          onTapRestore:
              () => getNotifier(ref).restore().then(
                (value) {
                  showSuccessToast(
                    context: navigatorKey.currentContext!,
                    title: "Subscription restored",
                    text: "Thank you for your trust",
                  );
                  Future.delayed(const Duration(seconds: 2), () {
                    _handleRedirection(context);
                  });
                },
                onError:
                    (err) => showErrorToast(
                      context: context,
                      title: "Error",
                      text: "We saved your error",
                      reason: "We were unable to restore your subscription",
                    ),
              ),
          // This is the purchase action
          onTap:
              () => getNotifier(ref)
                  .purchase(paywall: paywallFactory.name) //
                  .then(
                    (value) {
                      showSuccessToast(
                        context: navigatorKey.currentContext!,
                        title: "Subscription successful",
                        text: "Thank you for your trust",
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        _handleRedirection(context);
                      });
                    },
                    onError:
                        (err) => showErrorToast(
                          context: context,
                          title: "Error",
                          text: "We saved your error",
                          reason: "We were unable to process your subscription",
                        ),
                  ),
        ),
      },
      _ => const Center(child: Text("")),
    };
  }
}
