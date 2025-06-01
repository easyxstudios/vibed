import 'package:vibed/core/initializer/onstart_service.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final remoteConfigApiProvider = Provider<RemoteConfigApi>(
  (ref) {
    final remoteConfigWrapper = RemoteConfigWrapper(
      remoteConfig: FirebaseRemoteConfig.instance,
    );
    return RemoteConfigApi(
      remoteConfig: FirebaseRemoteConfig.instance,
      subscription: SubscriptionConfigs(
        title: FirebaseRemoteConfigData<String>(
          key: 'subscription_title',
          api: remoteConfigWrapper,
        ),
      ),
    );
  },
);

/// RemoteConfigApi
/// Firebase Remote Config is a cloud service that lets push configuration keys
/// and values to your app for runtime parameterization
/// It also provides
/// - a web console to manage your keys and values
/// - A/B testing (So you can test different values for a key)
///
/// Here it's abstracted to be able switching to another provider
/// Also I don't like using directly String keys in the code
/// So you create a class with all the keys you need and you can fetch them
/// Instead of writing
/// ```dart
/// final title = _remoteConfig.getString('title');
/// ```
/// You write
/// ```dart
/// final title = remoteConfigApi.title.value;
/// ```
/// Also if you try to get a key that doesn't exist and have installed Sentry
/// It will send an error to Sentry
///
/// Also you can use the default value if the key doesn't exist
/// This force you to have a default value for each key
/// And so a your app will not crash if you forget to add a key in the web console
class RemoteConfigApi implements OnStartService {
  final FirebaseRemoteConfig _remoteConfig;
  final SubscriptionConfigs subscription; // this is an example of group of keys

  RemoteConfigApi({
    required FirebaseRemoteConfig remoteConfig,
    required this.subscription,
  }) : _remoteConfig = remoteConfig;

  @override
  Future<void> init() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 60),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await _remoteConfig.fetchAndActivate();
  }

  Stream<OnKeyChanged> onKeyChanged() {
    return _remoteConfig.onConfigUpdated.map((_) => () {});
  }
}

/// this will be used to notify the app that a key has changed
/// So you can update the UI
typedef OnKeyChanged = void Function();

/// This is a wrapper around FirebaseRemoteConfig
/// It's used to be able to change this with another provider
class RemoteConfigWrapper {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigWrapper({
    required FirebaseRemoteConfig remoteConfig,
  }) : _remoteConfig = remoteConfig;

  String getString(String key) {
    return _remoteConfig.getString(key);
  }

  int getInt(String key) {
    return _remoteConfig.getInt(key);
  }

  double getDouble(String key) {
    return _remoteConfig.getDouble(key);
  }

  bool getBool(String key) {
    return _remoteConfig.getBool(key);
  }

  bool containsKey(String key) {
    return _remoteConfig.getAll().containsKey(key);
  }
}

abstract class RemoteConfigData<T> {
  final String key;

  RemoteConfigData({
    required this.key,
  });

  T get value;

  bool get exists;
}

/// This is the base of all our config items (title, description, etc...)
class FirebaseRemoteConfigData<T> implements RemoteConfigData<T> {
  final RemoteConfigWrapper _api;
  final T? defaultValue;

  @override
  final String key;

  FirebaseRemoteConfigData({
    required this.key,
    required RemoteConfigWrapper api,
    this.defaultValue,
  }) : _api = api;

  @override
  T get value {
    
    if (defaultValue != null && !exists) {
      return defaultValue!;
    }
    if (T == String) {
      return _api.getString(key) as T;
    } else if (T == int) {
      return _api.getInt(key) as T;
    } else if (T == double) {
      return _api.getDouble(key) as T;
    } else if (T == bool) {
      return _api.getBool(key) as T;
    }
    throw Exception('Type not supported');
  }

  @override
  bool get exists => _api.containsKey(key);
}

/// this is an example of a group of keys
/// I like to group them by feature
/// So I can easily find them in the code
class SubscriptionConfigs {
  final RemoteConfigData<String> title;

  SubscriptionConfigs({
    required this.title,
  });
}

