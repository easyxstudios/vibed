import 'package:vibed/core/data/models/subscription.dart';
import 'package:vibed/modules/subscription/ui/component/paywall_with_switch.dart';
import 'package:vibed/modules/subscription/ui/component/premium_content.dart';
import 'package:vibed/modules/subscription/ui/widgets/selectable_row.dart';
import 'package:flutter/material.dart';

typedef OnTapSubscription = void Function();

typedef OnTap = void Function();

/// this is the factory to create a paywall
/// You can test different paywalls by changing the factory
/// ex: PaywallFactory.withSwitch
/// - this is useful to A/B test different paywalls and see which one converts the best
abstract class PaywallFactory {
  final String name;

  const PaywallFactory(this.name);

  @factory
  Widget build({
    required List<SubscriptionProduct> offers,
    required SubscriptionProduct? selectedOffer,
    required OnSelectItem<SubscriptionProduct> onSelectItem,
    required OnTapSubscription? onTap,
    required OnTap? onTapRestore,
    required OnTap? onSkip,
  });

  Widget buildSending({
    required List<SubscriptionProduct> offers,
    required SubscriptionProduct? selectedOffer,
    required OnSelectItem<SubscriptionProduct> onSelectItem,
  }) {
    return build(
      offers: offers,
      selectedOffer: selectedOffer,
      onSelectItem: onSelectItem,
      onTap: null,
      onTapRestore: null,
      onSkip: null,
    );
  }

  /// The paywall with switch is a paywall with a switch to toggle the trial offer
  /// (You have to have 1 offer with a trial period and 1 offer without a trial period)
  static const withSwitch = _PaywallWithSwitchFactory();

  /// The basic paywall is a simple paywall with a list of offers
  static const basic = _BasicPaywallFactory();
}

/// Factory to create a paywall with a switch
/// The paywall with switch is a paywall with a switch to toggle the trial offer
class _PaywallWithSwitchFactory extends PaywallFactory {
  const _PaywallWithSwitchFactory() : super('withSwitch');

  @override
  Widget build({
    required List<SubscriptionProduct> offers,
    required SubscriptionProduct? selectedOffer,
    required OnSelectItem<SubscriptionProduct> onSelectItem,
    required OnTapSubscription? onTap,
    required OnTap? onTapRestore,
    required OnTap? onSkip,
  }) {
    return PaywallWithSwitch(
      offers: offers,
      selectedOffer: selectedOffer,
      onSelectItem: onSelectItem,
      onTap: onTap,
      onTapRestore: onTapRestore,
      onSkip: onSkip,
    );
  }
}

/// Factory to create a basic paywall
class _BasicPaywallFactory extends PaywallFactory {
  const _BasicPaywallFactory() : super('basic');

  @override
  Widget build({
    required List<SubscriptionProduct> offers,
    required SubscriptionProduct? selectedOffer,
    required OnSelectItem<SubscriptionProduct> onSelectItem,
    required OnTapSubscription? onTap,
    required OnTap? onTapRestore,
    required OnTap? onSkip,
  }) {
    return BasicPaywall(
      offers: offers,
      selectedOffer: selectedOffer,
      onSelectItem: onSelectItem,
      onTap: onTap,
      onTapRestore: onTapRestore,
      onSkip: onSkip,
    );
  }
}
