import 'package:vibed/core/data/api/http_client.dart';
import 'package:vibed/core/data/models/user.dart';
import 'package:vibed/core/data/repositories/user_repository.dart';
import 'package:vibed/core/states/user_state_notifier.dart';
import 'package:vibed/modules/authentication/repositories/authentication_repository.dart';
import 'package:vibed/modules/notifications/repositories/device_repository.dart';
import 'package:vibed/modules/subscription/repositories/subscription_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/authentication/data/api/auth_api_fake.dart';
import '../../modules/authentication/data/api/user_api_fake.dart';
import '../../modules/notifications/data/device_api_fake.dart';
import '../../modules/subscription/api/fake_inapp_subscription_api.dart';
import '../../modules/subscription/api/fake_subscription_api.dart';
import '../data/api/storage_api_fake.dart';
import '../security/secured_storage_fake.dart';

void main() {
  group('authRequired AuthenticationMode', () {
    final authRepository = HttpAuthenticationRepository(
      logger: Logger(),
      authenticationApi: FakeAuthenticationApi(),
      storage: FakeAuthSecuredStorage.empty(),
      userApi: FakeUserApi(storageApi: FakeStorageApi()),
      httpClient: HttpClient(baseUrl: ''),
    );

    final fakeStorageApi = FakeStorageApi();

    Future<UserStateNotifier> beforeTest() async {
      SharedPreferences.setMockInitialValues({});
      final sharedPrefs = await SharedPreferences.getInstance();
      final deviceRepository = DeviceRepository(
        deviceApi: FakeDeviceApi(),
        prefs: sharedPrefs,
      );
      final subscriptionRepository = SubscriptionRepository(
        subscriptionApi: SubscriptionApiFake(),
        inAppSubscriptionApi: InAppSubscriptionApiFake(),
        prefs: sharedPrefs,
      );
      final userRepository = UserRepository(
        userApi: FakeUserApi(storageApi: fakeStorageApi),
        subscriptionRepository: subscriptionRepository,
      );

      return UserStateNotifier(
        authenticationRepository: authRepository,
        userRepository: userRepository,
        deviceRepository: deviceRepository,
        mode: AuthenticationMode.authRequired,
      );
    }

    test(
      'Should load user at startup, user is not connected => user should be in unauth state',
      () async {
        final userStateNotifier = await beforeTest();
        expect(
          userStateNotifier.state.user,
          isA<LoadingUserData>(),
          reason: 'user should be in loading state at the beginning',
        );
        await userStateNotifier.init();
        expect(
          userStateNotifier.state.user,
          isA<AnonymousUserData>(),
          reason: 'user should be in unauthenticated state',
        );
      },
    );

    test(
      'Should load user at startup, user signin => state user is connected',
      () async {
        final userStateNotifier = await beforeTest();
        await userStateNotifier.init();

        await authRepository.signup('email', 'password');
        await userStateNotifier.onSignin();
        expect(
          userStateNotifier.state.user,
          isA<AuthenticatedUserData>(),
          reason: 'user should be authenticated',
        );
      },
    );

    test(
      'on logout -> user state is anonymous',
      () async {
        final userStateNotifier = await beforeTest();
        await userStateNotifier.init();
        await authRepository.signup('email', 'password');
        await userStateNotifier.onSignin();
        await authRepository.logout();
        await userStateNotifier.onLogout();

        expect(
          userStateNotifier.state.user,
          isA<AnonymousUserData>(),
          reason: 'user should be anonymous',
        );
      },
    );
  });

  group('authRequired anonymous', () {
    final authRepository = HttpAuthenticationRepository(
      logger: Logger(),
      authenticationApi: FakeAuthenticationApi(),
      storage: FakeAuthSecuredStorage.empty(),
      userApi: FakeUserApi(storageApi: FakeStorageApi()),
      httpClient: HttpClient(baseUrl: ''),
    );

    final fakeStorageApi = FakeStorageApi();

    Future<UserStateNotifier> beforeTest() async {
      SharedPreferences.setMockInitialValues({});
      final sharedPrefs = await SharedPreferences.getInstance();
      final deviceRepository = DeviceRepository(
        deviceApi: FakeDeviceApi(),
        prefs: sharedPrefs,
      );
      final subscriptionRepository = SubscriptionRepository(
        subscriptionApi: SubscriptionApiFake(),
        inAppSubscriptionApi: InAppSubscriptionApiFake(),
        prefs: sharedPrefs,
      );
      final userRepository = UserRepository(
        userApi: FakeUserApi(storageApi: fakeStorageApi),
        subscriptionRepository: subscriptionRepository,
      );

      return UserStateNotifier(
        authenticationRepository: authRepository,
        userRepository: userRepository,
        deviceRepository: deviceRepository,
        // ignore: avoid_redundant_argument_values
        mode: AuthenticationMode.anonymous,
      );
    }

    test(
      'Should load user at startup, user is not connected => login user anonymously with id',
      () async {
        final userStateNotifier = await beforeTest();
        expect(
          userStateNotifier.state.user,
          isA<LoadingUserData>(),
          reason: 'user should be in loading state at the beginning',
        );
        await userStateNotifier.init();
        expect(
          userStateNotifier.state.user,
          isA<AnonymousUserData>(),
          reason: 'user should be in unauthenticated state',
        );
        expect(
          userStateNotifier.state.user.idOrThrow,
          'fake-user-id-anonymous',
        );
      },
    );

    test(
      'Should load user at startup, user signin => state user is connected',
      () async {
        final userStateNotifier = await beforeTest();
        await userStateNotifier.init();

        await authRepository.signup('email', 'password');
        await userStateNotifier.onSignin();
        expect(
          userStateNotifier.state.user,
          isA<AuthenticatedUserData>(),
          reason: 'user should be authenticated',
        );
      },
    );

    test(
      'on logout -> user state is anonymous with id',
      () async {
        final userStateNotifier = await beforeTest();
        await userStateNotifier.init();
        await authRepository.signup('email', 'password');
        await userStateNotifier.onSignin();
        await authRepository.logout();
        await userStateNotifier.onLogout();

        expect(
          userStateNotifier.state.user,
          isA<AnonymousUserData>(),
          reason: 'user should be anonymous',
        );
        expect(
          userStateNotifier.state.user.idOrThrow,
          'fake-user-id-anonymous',
        );
      },
    );
  });
}
