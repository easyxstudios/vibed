import 'package:vibed/core/data/entities/upload_result.dart';
import 'package:vibed/core/data/repositories/user_repository.dart';
import 'package:vibed/modules/subscription/repositories/subscription_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../modules/authentication/data/api/user_api_fake.dart';
import '../../../modules/subscription/api/fake_inapp_subscription_api.dart';
import '../../../modules/subscription/api/fake_subscription_api.dart';
import '../api/storage_api_fake.dart';

void main() {
  Future<UserRepository> init() async {
    final fakeStorageApi = FakeStorageApi();
    SharedPreferences.setMockInitialValues({});
    final sharedPrefs = await SharedPreferences.getInstance();

    return UserRepository(
      userApi: FakeUserApi(storageApi: fakeStorageApi),
      subscriptionRepository: SubscriptionRepository(
        subscriptionApi: SubscriptionApiFake(),
        prefs: sharedPrefs,
        inAppSubscriptionApi: InAppSubscriptionApiFake(),
      ),
    );
  }

  testWidgets('upload file and save avatar', (tester) async {
    await tester.runAsync(() async {
      final userRepository = await init();

      final file = await rootBundle.load('assets/images/splashscreen.png');
      final bytes = file.buffer.asUint8List();
      // if you want to create an XFile from bytes
      // final xfile = XFile.fromData(bytes);

      final resultTask = userRepository.saveAvatar(
        userId: 'fake_user_id',
        data: bytes,
      );

      expect(
          resultTask,
          emitsAnyOf([
            UploadResultProgress(0.0),
            UploadResultCompleted(
              imagePath: 'imagePath',
              imagePublicUrl: 'imagePublicUrl',
            ),
          ]));
      await tester.pump();
      await tester.pumpAndSettle();
    });
  });
}
