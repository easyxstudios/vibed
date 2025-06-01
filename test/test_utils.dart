import 'package:vibed/core/data/api/analytics_api.dart';
import 'package:vibed/core/data/api/remote_config_api.dart';
import 'package:vibed/core/data/api/user_api.dart';
import 'package:vibed/core/data/entities/user_entity.dart';
import 'package:vibed/core/data/models/subscription.dart';
import 'package:vibed/core/data/models/user.dart';
import 'package:vibed/core/initializer/models/run_state.dart';
import 'package:vibed/core/initializer/onstart_service.dart';
import 'package:vibed/core/initializer/onstart_widget.dart';
import 'package:vibed/core/rating/api/rating_api.dart';
import 'package:vibed/core/security/secured_storage.dart';
import 'package:vibed/core/shared_preferences/shared_preferences.dart';
import 'package:vibed/core/states/models/user_state.dart';
import 'package:vibed/core/states/user_state_notifier.dart';
import 'package:vibed/core/theme/colors.dart';
import 'package:vibed/core/theme/providers/theme_provider.dart';
import 'package:vibed/core/theme/texts.dart';
import 'package:vibed/core/theme/universal_theme.dart';
import 'package:vibed/modules/authentication/api/authentication_api.dart';
import 'package:vibed/modules/authentication/api/authentication_api_interface.dart';
import 'package:vibed/modules/notifications/api/device_api.dart';
import 'package:vibed/modules/notifications/api/local_notifier.dart';
import 'package:vibed/modules/notifications/api/notifications_api.dart';
import 'package:vibed/modules/notifications/repositories/notifications_repository.dart';
import 'package:vibed/modules/subscription/api/entities/subscription_entity.dart';
import 'package:vibed/modules/subscription/api/inapp_subscription_api.dart';
import 'package:vibed/modules/subscription/providers/models/premium_state.dart';
import 'package:vibed/modules/subscription/api/subscription_api.dart';
import 'package:vibed/modules/subscription/repositories/subscription_repository.dart';
import 'package:vibed/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/data/api/analytics_api_fake.dart';
import 'core/data/api/fake_remote_config_api.dart';
import 'core/data/api/storage_api_fake.dart';
import 'core/rating/rating_api_fake.dart';
import 'core/security/secured_storage_fake.dart';
import 'firebase_test_utils.dart';
import 'modules/authentication/data/api/auth_api_fake.dart';
import 'modules/authentication/data/api/user_api_fake.dart';
import 'modules/notifications/data/device_api_fake.dart';
import 'modules/notifications/data/local_notifier_fake.dart';
import 'modules/notifications/data/notifications_api_fake.dart';
import 'modules/notifications/data/notifications_settings_fake.dart';
import 'modules/subscription/api/fake_inapp_subscription_api.dart';
import 'modules/subscription/api/fake_subscription_api.dart';

/// Use this page to show a fake page within a test
class PageFake extends StatelessWidget {
  final Color color;

  const PageFake(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

extension AppWidgetTester on WidgetTester {
  /// Pump the given widget into an app with all our default fake APIs
  /// provided or override them with the given overrides
  /// this is useful to test a page and not rewrite all the providers
  /// Only APIs should be faked, not the repositories
  ///
  /// We will wait that all the providers are ready before pumping the page
  /// if that takes more than 10 pump, we will throw an exception
  ///
  /// If you want your test to use your app navigation, you can pass the routerConfig
  /// and the initialRoute from the routerGenerator function (lib/router.dart)
  /// For ex to test the signup page:
  /// ```generateRouter(initialLocation: '/signup')```
  Future<void> pumpPage({
    UserState? userState,
    AuthenticationApi? authApiFakeOverride,
    SubscriptionApiFake? subscriptionApiFakeOverride,
    InAppSubscriptionApiFake? inAppSubscriptionApiFakeOverride,
    AuthSecuredStorage? authSecuredStorageFakeOverride,
    DeviceApi? deviceApiFakeOverride,
    UserApi? userApiFakeOverride,
    LocalNotifier? localNotifierFakeOverride,
    NotificationSettings? notificationsSettingsFakeOverride,
    NotificationsApi? notificationsApiFakeOverride,
    RatingApiFake? ratingApiFakeOverride,
    RemoteConfigApi? remoteConfigApiFakeOverride,
    AnalyticsApi? analyticsApiFakeOverride,
    Widget? home,
    RouterConfig<Object>? routerConfig,
    String? initialRoute,
  }) async {
    // await initFirebaseForTest();
    SharedPreferences.setMockInitialValues({});
    final sharedPrefs = await SharedPreferences.getInstance();
    late WidgetRef refCopie;
    await pumpWidget(
      ProviderScope(
        overrides: [
          authenticationApiProvider.overrideWithValue(
            authApiFakeOverride ?? FakeAuthenticationApi(),
          ),
          authSecuredStorageProvider.overrideWithValue(
            authSecuredStorageFakeOverride ?? FakeAuthSecuredStorage.empty(),
          ),
          subscriptionApiProvider.overrideWithValue(
            subscriptionApiFakeOverride ?? SubscriptionApiFake(),
          ),
          inAppSubscriptionApiProvider.overrideWithValue(
            inAppSubscriptionApiFakeOverride ?? InAppSubscriptionApiFake(),
          ),
          deviceApiProvider.overrideWithValue(
            deviceApiFakeOverride ?? FakeDeviceApi(),
          ),
          userApiProvider.overrideWithValue(
            userApiFakeOverride ?? FakeUserApi(storageApi: FakeStorageApi()),
          ),
          localNotifierProvider.overrideWithValue(
            localNotifierFakeOverride ?? FakeLocalNotifier(),
          ),
          notificationsApiProvider.overrideWithValue(
            notificationsApiFakeOverride ?? FakeNotificationsApi(),
          ),
          notificationsSettingsProvider.overrideWithValue(
            notificationsSettingsFakeOverride ?? NotificationsSettingsFake(),
          ),
          ratingApiProvider.overrideWithValue(
            ratingApiFakeOverride ?? RatingApiFake(),
          ),
          remoteConfigApiProvider.overrideWithValue(
            remoteConfigApiFakeOverride ?? FakeRemoteConfigApi(),
          ),
          analyticsApiProvider.overrideWithValue(
            analyticsApiFakeOverride ?? AnalyticsApiFake(),
          ),
        ],
        child: Consumer(builder: (context, ref, child) {
          refCopie = ref;

          // We setup the test with the default USER STATE
          final subscriptionApi = ref.read(
            subscriptionApiProvider,
          ) as SubscriptionApiFake;

          final authStorageApi = ref.read(
            authSecuredStorageProvider,
          ) as FakeAuthSecuredStorage;

          final authApi = ref.read(
            authenticationApiProvider,
          ) as FakeAuthenticationApi;

          final userApi = ref.read(userApiProvider) as FakeUserApi;

          subscriptionApi.currentFake = null;
          authStorageApi.credentials = null;
          authApi.current = null;
          userApi.getUserResult = null;

          // if the test include a user state (anonymous or authenticated) we setup with it
          if (userState != null) {
            debugPrint("✅- Test user provided");

            authStorageApi.credentials = Credentials(
              id: userState.user.idOrThrow,
              token: 'fake-user-token-1234567890',
            );
            authApi.current = authStorageApi.credentials;

            userApi.getUserResult = switch (userState.user) {
              AuthenticatedUserData() => userState.user.toEntity(),
              AnonymousUserData() => userState.user.toEntity(),
              LoadingUserData() => null,
            };
          }
          
          // if the test include an active subscription state
          if (userState != null &&
              userState.subscription != null &&
              userState.subscription is SubscriptionStateData) {
            subscriptionApi.currentFake = switch (userState.subscription) {
              SubscriptionStateData(:final activeOffer) => SubscriptionEntity(
                skuId: activeOffer!.skuId,
                status: SubscriptionStatus.ACTIVE,
                creationDate: DateTime.now().add(const Duration(days: -30)),
                periodEndDate: DateTime.now().add(const Duration(days: 30)),
                offerId: activeOffer.id,
              ),
              _ => null,
            };
          }
          // We now run the app like we do on the main function
          return ThemeProvider(
            notifier: AppTheme.uniform(
              sharedPreferences: sharedPrefs,
              themeFactory: const UniversalThemeFactory(),
              lightColors: ApparenceKitColors.light(),
              darkColors: ApparenceKitColors.dark(),
              textTheme: ApparenceKitTextTheme.build(),
              defaultMode: ThemeMode.light,
            ),
            child: Builder(builder: (context) {
              return MaterialApp.router(
                theme: ThemeProvider.of(context).light,
                darkTheme: ThemeProvider.of(context).dark,
                themeMode: ThemeProvider.of(context).mode,
                builder: (context, child) => Initializer(
                  services: [
                    // shared preferences must be loaded
                    sharedPreferencesProvider,
                    // remote config api
                    remoteConfigApiProvider,
                    // user state
                    userStateNotifierProvider.notifier,
                    // notifications
                    notificationsSettingsProvider,
                    notificationRepositoryProvider,
                    // subscriptions
                    subscriptionRepositoryProvider,
                  ],
                  onReady: child!,
                  onLoading: const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                routerConfig: routerConfig ??
                    GoRouter(
                      navigatorKey: navigatorKey,
                      initialLocation: initialRoute ?? '/',
                      routes: [
                        GoRoute(
                          path: '/',
                          builder: (context, state) =>
                              home ?? const PageFake(Colors.red),
                        ),
                      ],
                    ),
              );
            }),
          );
        }),
      ),
    );
    // We wait that the app is ready before continuing
    final startHandlerNotifier = refCopie.read(onStartProvider.notifier);
    const maxWait = 100;
    var wait = 0;
    while (startHandlerNotifier.state is AppLoadingState) {
      await pump(const Duration(milliseconds: 100));
      wait++;
      if (wait > maxWait) {
        startHandlerNotifier.printDebugState();
        throw Exception('Timeout waiting for app to be ready');
      }
    }
    await pumpAndSettle();
  }
}
