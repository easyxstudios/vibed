import 'package:vibed/core/data/api/image.dart';
import 'package:vibed/core/data/api/user_api.dart';
import 'package:vibed/core/data/entities/upload_result.dart';
import 'package:vibed/core/data/models/user.dart';
import 'package:vibed/modules/subscription/repositories/subscription_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepository(
    userApi: ref.read(userApiProvider),
    subscriptionRepository: ref.read(subscriptionRepositoryProvider),
  ),
);

class UserRepository {
  final UserApi _userApi;
  final SubscriptionRepository _subscriptionRepository;


  UserRepository({
    required UserApi userApi,
    required SubscriptionRepository subscriptionRepository,
  }) : _subscriptionRepository = subscriptionRepository, _userApi = userApi;

  Future<User?> get(String id) async {
    final userEntity = await _userApi.get(id);
    if (userEntity == null) {
      return null;
    }
    try {
      // We get the subscription of the user and return it with the user
      final subscription = await _subscriptionRepository.get(id);
      // We set the user id to RevenueCat
      await _subscriptionRepository.initUser(id);
      // We return the user with the subscription
      final user = User.fromEntity(userEntity);
      return switch (user) {
        final AuthenticatedUserData value => value.copyWith(
          subscription: subscription,
        ),
        final AnonymousUserData value => value.copyWith(
          subscription: subscription,
        ),
        _ => null,
      };
    } catch (e) {
      // We catch the error to avoid blocking the user if the subscription is not available
      // On most case it's because you didn't yet setup the RevenueCat api key
      Logger().e('Error while getting subscription');
      // We return the user without the subscription
      return User.fromEntity(userEntity);
    }
  }

  /// We updates the user avatar
  /// We convert the image to jpeg and resize it to 300px width
  /// and 80% quality to reduce the size of the image
  /// Most of the current phones makes pictures with a width of 3000px.
  /// That can take a lot of time and bandwidth to upload.
  /// We then upload the image
  Stream<UploadResult> saveAvatar({
    required String userId,
    required Uint8List data,
  }) async* {
    final jpgData = await compute(
      imgToJpeg,
      JpegParams(data: data, maxWidth: 450, quality: 80),
    );
    yield* _userApi.updateAvatar(
      userId,
      jpgData,
    );
  }

  Future<User> setOnboarded(User user) async {
    final userCpy = switch(user) {
      final AuthenticatedUserData value => value.copyWith(onboarded: true),
      final AnonymousUserData value => value.copyWith(onboarded: true),
      _ => throw Exception('User not found'),
    };

    await _userApi.update(userCpy.toEntity());
    return userCpy;
  }

  /// Apple store and Google play stores requires you to be able to delete a user account on demand
  /// Here is the function to do it.
  Future<void> delete() async {
    await _userApi.deleteMe();
  }
}
