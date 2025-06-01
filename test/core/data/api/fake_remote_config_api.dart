import 'package:vibed/core/data/api/remote_config_api.dart';

/// This is a fake implementation of RemoteConfigApi
/// It's used in tests to avoid using the real FirebaseRemoteConfig
/// With that all your tests can run without having to mock FirebaseRemoteConfig
/// And you can test different scenarios
/// If you want to test a specific scenario you can create a new FakeRemoteConfigApi for each scenario
class FakeRemoteConfigApi implements RemoteConfigApi {
  @override
  Future<void> init() async {}

  @override
  Stream<OnKeyChanged> onKeyChanged() {
    // TODO: implement onKeyChanged
    throw UnimplementedError();
  }

  @override
  SubscriptionConfigs get subscription => SubscriptionConfigs(
        title: FakeRemoteConfigData<String>(
          key: 'subscription_title',
          exists: true,
          value: 'Lorem ipsum dolor sit amet',
        ),
      );
}

/// This is a fake implementation of RemoteConfigData
/// Instead of using [FirebaseRemoteConfigData] use this one in tests
class FakeRemoteConfigData<T> implements RemoteConfigData<T> {
  @override
  final bool exists;

  @override
  final String key;

  @override
  final T value;

  FakeRemoteConfigData({
    required this.exists,
    required this.key,
    required this.value,
  });
}
