import 'package:vibed/i18n/translations.g.dart';
import 'package:vibed/modules/subscription/api/entities/subscription_entity.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

part 'subscription.freezed.dart';

abstract class SubscriptionProduct {
  /// Unique identifier of the product in the store
  String get skuId;

  /// Unique identifier
  String get id;

  /// Description of the subscription from your app
  String get description;

  /// Label of the subscription from the package in revenue cat
  String get label;

  /// Price of the subscription
  double get price;

  /// Duration of the subscription
  Duration get duration;

  /// Promotion of the subscription (configure it in the revenue cat offering json)
  /// Ex:
  /// {
  ///   "promotions": {
  ///     "year": "50% OFF"
  ///   }
  ///}
  String? get promotion;

  /// Formatted price with duration from the user locale
  String formattedPrice(BuildContext context);

  /// Duration type of the subscription (week, month, year, ...)
  DurationType get durationType;

  /// Title of the offer
  String? get title;

  /// Trial days of the offer
  int? get trialDays;

  /// Features textes of the offer
  List<String>? get features;

  /// Shows the price per month (only if the duration is not monthly)
  String pricePerMonth(BuildContext context);

  /// Shows the price per year (only if the duration is not yearly)
  String? pricePerYear(BuildContext context);
}

class RevenueCatProduct implements SubscriptionProduct {
  final Offering revenueCatOffer;
  final Package revenueCatPackage;

  RevenueCatProduct({
    required this.revenueCatOffer,
    required this.revenueCatPackage,
  });

  @override
  String get skuId => revenueCatPackage.identifier;

  @override
  String get id => revenueCatOffer.identifier;

  @override
  String get description => revenueCatOffer.serverDescription;

  @override
  String get label => revenueCatPackage.presentedOfferingContext.offeringIdentifier;

  @override
  double get price => revenueCatPackage.storeProduct.price;

  @override
  int? get trialDays {
    final introductory = revenueCatPackage.storeProduct.introductoryPrice;
    if (introductory == null) {
      return null;
    }
    if (introductory.price == 0) {
      final unit = introductory.periodUnit;
      switch (unit) {
        case PeriodUnit.day:
          return introductory.periodNumberOfUnits;
        case PeriodUnit.week:
          return introductory.periodNumberOfUnits * 7;
        case PeriodUnit.month:
          return introductory.periodNumberOfUnits * 30;
        case PeriodUnit.year:
          return introductory.periodNumberOfUnits * 365;
        default:
          return null;
      }
    }
    return null;
  }

  @override
  String? get promotion {
    if (revenueCatOffer.metadata["promotions"] == null) {
      return null;
    }
    final data =
        revenueCatOffer.metadata["promotions"]! as Map<Object?, Object?>;
    final locale = LocaleSettings.currentLocale.languageCode;
    final id = skuId;
    if (data.containsKey(id)) {
      final promotion = data[id]! as Map<Object?, Object?>;
      return promotion[locale]! as String;
    }
    return null;
  }

  @override
  String? get title {
    final locale = LocaleSettings.currentLocale.languageCode;
    if (revenueCatOffer.metadata[locale] == null) {
      return null;
    }
    final data = revenueCatOffer.metadata[locale]! as Map<Object?, Object?>;
    return data["title"]! as String;
  }

  @override
  List<String>? get features {
    final locale = LocaleSettings.currentLocale.languageCode;
    if (revenueCatOffer.metadata[locale] == null) {
      return null;
    }
    final data = revenueCatOffer.metadata[locale]! as Map<Object?, Object?>;
    final featuerObj = data["features"]! as List<Object?>;
    return featuerObj.map((e) => e! as String).toList();
  }

  @override
  Duration get duration =>
      switch (revenueCatPackage.storeProduct.subscriptionPeriod) {
        'P1W' => const Duration(days: 7),
        'P1M' => const Duration(days: 30),
        'P3M' => const Duration(days: 90),
        'P6M' => const Duration(days: 180),
        'P1Y' => const Duration(days: 365),
        _ => Duration.zero,
      };

  @override
  DurationType get durationType {
    final durationCpy = duration;
    if (durationCpy.inDays == 7) {
      return DurationType.week;
    } else if (durationCpy.inDays == 30) {
      return DurationType.month;
    } else if (durationCpy.inDays == 90) {
      return DurationType.threeMonth;
    } else if (durationCpy.inDays == 180) {
      return DurationType.sixMonth;
    } else if (durationCpy.inDays == 365) {
      return DurationType.year;
    }
    return DurationType.lifetime;
  }

  @override
  String formattedPrice(BuildContext context) {
    final translatedDuration = switch (durationType) {
      DurationType.year => Translations.of(context).premium.duration_annual,
      DurationType.month => Translations.of(context).premium.duration_monthly,
      DurationType.lifetime =>
        Translations.of(context).premium.duration_lifetime,
      _ => "",
    };
    return "${revenueCatPackage.storeProduct.priceString} $translatedDuration";
  }

  @override
  String pricePerMonth(BuildContext context) {
    final translatedDuration =
        Translations.of(context).premium.duration_monthly;
    if (durationType == DurationType.lifetime) {
      return revenueCatPackage.storeProduct.priceString;
    }
    final pricePerMonth = switch (durationType) {
      DurationType.year => price / 12,
      DurationType.threeMonth => price / 3,
      DurationType.sixMonth => price / 6,
      DurationType.week => (price * 4) / 12,
      _ => 1,
    };
    final pricePerMonthString = pricePerMonth.toStringAsFixed(2);
    final money = revenueCatPackage.storeProduct.currencyCode;
    if (money == "USD") {
      return "\$$pricePerMonthString/$translatedDuration";
    } else if (money == "EUR") {
      return "$pricePerMonthString/$translatedDuration";
    }
    return "$pricePerMonthString $money/$translatedDuration";
  }

  @override
  String? pricePerYear(BuildContext context) {
    final translatedDuration =
        Translations.of(context).premium.duration_monthly;
    if (durationType == DurationType.lifetime) {
      return revenueCatPackage.storeProduct.priceString;
    }
    final pricePerMonth = switch (durationType) {
      DurationType.year => price,
      DurationType.threeMonth => price * 4,
      DurationType.sixMonth => price * 2,
      DurationType.week => (price * 4) * 12,
      _ => 1,
    };
    final pricePerMonthString = pricePerMonth.toStringAsFixed(2);
    final money = revenueCatPackage.storeProduct.currencyCode;
    if (money == "USD") {
      return "\$$pricePerMonthString/$translatedDuration";
    } else if (money == "EUR") {
      return "$pricePerMonthString/$translatedDuration";
    }
    return "$pricePerMonthString $money/$translatedDuration";
  }
}

enum DurationType { week, month, threeMonth, sixMonth, year, lifetime }

@freezed
sealed class Subscription with _$Subscription {
  const factory Subscription.active({
    SubscriptionProduct? activeOffer,
    List<EntitlementInfo>? entitlements,
  }) = SubscriptionStateData;

  const factory Subscription.inactive({
    required int hoursBetweenTwoRequests,
    DateTime? lastAskingDate,
  }) = SubscriptionInactiveStateData;

  const factory Subscription.loading() = SubscriptionStateLoading;

  const Subscription._();

  factory Subscription.fromEntity(
    SubscriptionEntity? entity,
    DateTime? lastAskingDate, {
    int hoursBetweenTwoRequests = 24,
  }) {
    if (entity == null ||
        (entity.periodEndDate != null &&
            entity.periodEndDate!.isBefore(DateTime.now()))) {
      return Subscription.inactive(
        hoursBetweenTwoRequests: hoursBetweenTwoRequests,
        lastAskingDate: lastAskingDate,
      );
    }
    return const Subscription.active();
  }

  bool get canPurchase => switch(this) {
    SubscriptionStateData() => false,
    SubscriptionInactiveStateData() => true,
    SubscriptionStateLoading() => false,
  };

  bool get isActive => switch (this) {
    SubscriptionStateData() => true,
    SubscriptionInactiveStateData() => false,
    SubscriptionStateLoading() => false,
  };

  bool get isInTrial => switch (this) {
    SubscriptionStateData(:final entitlements) =>
      entitlements?.firstOrNull?.periodType == PeriodType.trial,
    SubscriptionInactiveStateData() => false,
    SubscriptionStateLoading() => false,
  };

  bool get hasRenewal => switch (this) {
    SubscriptionStateData(:final entitlements) =>
      entitlements?.firstOrNull?.willRenew == true,
    SubscriptionInactiveStateData() => false,
    SubscriptionStateLoading() => false,
  };

  bool get isLifetime => switch (this) {
    SubscriptionStateData(:final activeOffer) =>
      activeOffer?.durationType == DurationType.lifetime,
    SubscriptionInactiveStateData() => false,
    SubscriptionStateLoading() => false,
  };

  bool get shouldAskForSubscription {
    final now = DateTime.now();
    final (lastAskingDate, hoursBetweenTwoRequests) = switch (this) {
      SubscriptionStateData() => (null, null),
      SubscriptionInactiveStateData(
        :final lastAskingDate,
        :final hoursBetweenTwoRequests,
      ) =>
        (lastAskingDate, hoursBetweenTwoRequests),
      SubscriptionStateLoading() => (null, null),
    };
    if (lastAskingDate == null) {
      return true;
    }
    final diff = now.difference(lastAskingDate);
    return diff.inHours >= hoursBetweenTwoRequests!;
  }
}
