import 'package:vibed/core/data/models/subscription.dart';
import 'package:flutter/widgets.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// Fake implementation of [RevenueCatProduct]
/// This helps us to test the UI without having to rely on the real RevenueCat API
class FakeRevenueCatProduct implements RevenueCatProduct {
  @override
  final String skuId;

  @override
  final String id;

  @override
  final String description;

  @override
  final String label;

  @override
  final double price;

  @override
  final Duration duration;

  @override
  final DurationType durationType;

  @override
  final String? promotion;

  @override
  final int? trialDays;

  FakeRevenueCatProduct({
    required this.skuId,
    required this.id,
    required this.description,
    required this.label,
    required this.price,
    required this.duration,
    required this.durationType,
    this.promotion,
    this.trialDays,
  });

  factory FakeRevenueCatProduct.month() => FakeRevenueCatProduct(
    skuId: 'premium-sku-month',
    id: 'premium',
    description: 'Premium subscription',
    label: 'GOLD',
    price: 10,
    duration: const Duration(days: 30),
    durationType: DurationType.month,
  );

  factory FakeRevenueCatProduct.year() => FakeRevenueCatProduct(
    skuId: 'premium-sku-year',
    id: 'premium',
    description: 'Premium subscription',
    label: 'GOLD',
    price: 100,
    duration: const Duration(days: 365),
    durationType: DurationType.year,
  );

  @override
  String formattedPrice(BuildContext context) {
    return "$price€/$durationType";
  }

  @override
  Offering get revenueCatOffer => FakeOffering();

  @override
  Package get revenueCatPackage => FakePackage();

  @override
  List<String>? get features => ["Feature 1", "Feature 2", "Feature 3"];

  @override
  String pricePerMonth(BuildContext context) {
    return "$price€/$durationType";
  }

  @override
  String? pricePerYear(BuildContext context) {
    return "$price€/$durationType";
  }

  @override
  String? get title => "Premium subscription";
}

/// This is a fake implementation of [Package]
/// Just for test purposes
class FakePackage implements Package {
  @override
  $PackageCopyWith<Package> get copyWith => throw UnimplementedError();

  @override
  String get identifier => throw UnimplementedError();

  @override
  PackageType get packageType => throw UnimplementedError();

  @override
  StoreProduct get storeProduct => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  PresentedOfferingContext get presentedOfferingContext =>
      throw UnimplementedError();
}

/// This is a fake implementation of [Offering]
/// Just for test purposes
class FakeOffering implements Offering {
  @override
  Package? get annual => throw UnimplementedError();

  @override
  List<Package> get availablePackages => throw UnimplementedError();

  @override
  $OfferingCopyWith<Offering> get copyWith => throw UnimplementedError();

  @override
  Package? getPackage(String identifier) {
    throw UnimplementedError();
  }

  @override
  String get identifier => throw UnimplementedError();

  @override
  Package? get lifetime => throw UnimplementedError();

  @override
  Map<String, Object> get metadata => throw UnimplementedError();

  @override
  Package? get monthly => throw UnimplementedError();

  @override
  String get serverDescription => throw UnimplementedError();

  @override
  Package? get sixMonth => throw UnimplementedError();

  @override
  Package? get threeMonth => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  Package? get twoMonth => throw UnimplementedError();

  @override
  Package? get weekly => throw UnimplementedError();
}
