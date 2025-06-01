import 'package:vibed/core/data/models/subscription.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'premium_state.freezed.dart';

@freezed
sealed class PremiumState with _$PremiumState {
  const factory PremiumState({
    required List<SubscriptionProduct> offers,
    SubscriptionProduct? selectedOffer,
  }) = PremiumStateData;

  const factory PremiumState.active({SubscriptionProduct? activeOffer}) =
      PremiumStateActive;

  const factory PremiumState.sending({
    required List<SubscriptionProduct> offers,
    required bool isPremium,
    SubscriptionProduct? selectedOffer,
  }) = PremiumStateSending;

  const PremiumState._();

  List<SubscriptionProduct> get offers => switch(this) {
    PremiumStateData(:final offers) => offers,
    PremiumStateSending(:final offers) => offers,
    _ => throw "cannot purchase without offers",
  };

  SubscriptionProduct? get selectedOffer => switch (this) {
    PremiumStateData(:final selectedOffer) => selectedOffer,
    PremiumStateSending(:final selectedOffer) => selectedOffer,
    _ => throw "cannot purchase without selected offer",
  };
}
