import 'package:vibed/core/data/models/subscription.dart';
import 'package:vibed/environnements.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher.dart';

final inAppSubscriptionApiProvider = Provider(
  (ref) => RevenueCatPaymentApi(
    environment: ref.read(environmentProvider),
  ),
);

// We chose to use RevenueCat for in-app subscription
// but you can use any other provider (RevenueCat, ...)
// ---
// We wrap the RevenueCat API to be able to fake it properly (Glassfy use static methods which are hard for tests)
class RevenueCatPaymentApi {
  bool _hasInit = false;
  final Environment _environment;

  RevenueCatPaymentApi({
    required Environment environment,
  }) : _environment = environment;

  Future<void> init() async {
    await Purchases.setLogLevel(LogLevel.debug);
    PurchasesConfiguration configuration;
    if (Platform.isAndroid) {
      configuration = PurchasesConfiguration(
        _environment.revenueCatAndroidApiKey!,
      );
    } else if (Platform.isIOS) {
      configuration = PurchasesConfiguration(
        _environment.revenueCatIOSApiKey!,
      );
    } else {
      throw Exception("Unsupported platform");
    }
    await Purchases.configure(configuration);
    _hasInit = true;
  }

  // We use a custom subscriber id to be able to identify the user
  Future<void> initUser(String userId) async {
    if (!_hasInit) {
      throw Exception('RevenueCat is not initialized');
    }
    
    await Purchases.logIn(userId);
  }

  

  // We can dissociate the user from the subscription
  Future<void> disconnectUser() async {
    await Purchases.logOut();
  }

  Future<List<SubscriptionProduct>> getOffers(String? offerId) async {
    if (!_hasInit) {
      throw Exception('RevenueCat is not initialized');
    }
    final offers = await Purchases.getOfferings();
    var offer = offers.current;
    if (offerId != null) {
      offer = offers.getOffering(offerId);
    }
    return SubscriptionProductAdapter(
      offering: offer,
    ).transform();
  }

  Future<void> purchase(StoreProduct storeProduct) async {
    await Purchases.purchaseStoreProduct(storeProduct);
  }

  Future<void> purchasePackage(Package package) async {
    await Purchases.purchasePackage(package);
  }

  Future<void> presentCodeRedemptionSheet() async {
    if (TargetPlatform.iOS != defaultTargetPlatform) {
      throw "Only available on iOS";
    }
    await Purchases.presentCodeRedemptionSheet();
  }

  Future<void> unsubscribe() async {
    if (Platform.isAndroid) {
      launchUrl(
        Uri.parse("https://play.google.com/store/account/subscriptions"),
      );
    } else if (Platform.isIOS) {
      launchUrl(
        Uri.parse("https://apps.apple.com/account/subscriptions"),
        mode: LaunchMode.externalApplication,
      );
      // launchUrl(Uri.parse('https://play.google.com/store/account/subscriptions?sku=pro.monthly.testsku&package=io.mcflydev.bdtek'));
    } else {
      throw Exception("Unsupported platform");
    }
  }

  Future<List<Package>> getLastPurchase() async {
    final customerInfo = await Purchases.getCustomerInfo();
    final purchases = customerInfo.allPurchasedProductIdentifiers;

    if (purchases.isEmpty) {
      return [];
    }
    final List<Package> result = [];
    final offers = await Purchases.getOfferings();
    for (final offerKey in offers.all.keys) {
      if (offers.all[offerKey]?.availablePackages == null) {
        continue;
      }
      for (final element in offers.all[offerKey]!.availablePackages) {
        if (purchases.contains(element.storeProduct.identifier)) {
          result.add(element);
        }
      }
    }
    return result;
  }

  Future<SubscriptionProduct?> getFromProductId(String productId) async {
    final offers = await Purchases.getOfferings();
    for (final offerKey in offers.all.keys) {
      if (offers.all[offerKey]?.availablePackages == null) {
        continue;
      }
      for (final element in offers.all[offerKey]!.availablePackages) {
        if (element.storeProduct.identifier == productId) {
          return RevenueCatProduct(
            revenueCatOffer: offers.all[offerKey]!,
            revenueCatPackage: element,
          );
        }
      }
    }
    return null;
  }

  Future<List<SubscriptionProduct>> getActiveSubscription() async {
    final List<SubscriptionProduct> products = [];

    final customerInfo = await Purchases.getCustomerInfo();
    final subscriptions = customerInfo.activeSubscriptions;
    if (subscriptions.isEmpty) {
      return [];
    }
    final List<(Offering, Package)> result = [];
    final offers = await Purchases.getOfferings();
    for (final offerKey in offers.all.keys) {
      if (offers.all[offerKey]?.availablePackages == null) {
        continue;
      }
      final offer = offers.all[offerKey]!;
      for (final element in offer.availablePackages) {
        if (subscriptions.contains(element.storeProduct.identifier)) {
          result.add((offer, element));
        }
      }
    }

    for (final element in result) {
      products.add(RevenueCatProduct(
        revenueCatOffer: element.$1,
        revenueCatPackage: element.$2,
      ));
    }
    return products;
  }

  Future<void> restorePurchase() async {
    final restoredInfo = await Purchases.restorePurchases();
    if (restoredInfo.entitlements.all.isEmpty) {
      throw Exception("No purchase to restore");
    }
  }

  Future<List<EntitlementInfo>> getPermissions() async {
    final customerInfo = await Purchases.getCustomerInfo();
    return customerInfo.entitlements.active.values.toList();
  }

  Future<List<EntitlementInfo>?> getEntitlements() async {
    final customerInfo = await Purchases.getCustomerInfo();
    return customerInfo.entitlements.active.values.toList();
  }
}

class SubscriptionProductAdapter {
  final Offering? _offering;

  SubscriptionProductAdapter({
    required Offering? offering,
  }) : _offering = offering;

  List<SubscriptionProduct> transform() {
    try {
      final List<SubscriptionProduct> products = [];
      // final offer = _offerings.current;
      if (_offering == null) {
        throw Exception('No offer found');
      }
      for (final package in _offering.availablePackages) {
        products.add(RevenueCatProduct(
          revenueCatOffer: _offering,
          revenueCatPackage: package,
        ));
      }
      return products;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      rethrow;
    }
  }
}
