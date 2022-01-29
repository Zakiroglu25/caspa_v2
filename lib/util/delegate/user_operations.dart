import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/data_source/account_provider.dart';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/services/config_service.dart';
import 'package:caspa_v2/infrastructure/services/firestore_service.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import '../../locator.dart';

class UserOperations {
  static HiveService get _prefs => locator<HiveService>();
  static ConfigService get _configs => locator<ConfigService>();

  static Future<void> configureUserData(
      //MyUser user,
      {required String fcmToken,
      required String accessToken,
      required String? path}) async {
    //llll("configureUserData result result: " + user.toString());
    try {
      await _prefs.persistAccessToken(accessToken: accessToken);
      await _prefs.persistIsGuest(false);
      await _prefs.persistPath(path!);
      await _prefs.persistIsLoggedIn(true);
      await _prefs.persistFcmToken(fcmToken: fcmToken);
      final result = await AccountProvider.fetchUserInfo(token: accessToken);
      MyUser user = (result!.data as MyUser);
      await _prefs.persistUser(user: user);
      await _configs.persistEmail(email: user.email);
      // locator.resetLazySingleton(instance: DioAuth.instance);
      locator.registerSingleton(DioAuth.instance);
      await FirestoreDBService.readConfig();
      await FirestoreDBService.saveUserPath(user, path, fcmToken, accessToken);
    } catch (e, s) {
      bbbb("configureUserData e: $e => s: $s");
      Recorder.recordCatchError(e, s);
    }
  }
}
