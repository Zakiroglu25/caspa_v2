import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/data_source/account_provider.dart';
import 'package:caspa_v2/infrastructure/models/local/app_member.dart';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/services/config_service.dart';
import 'package:caspa_v2/infrastructure/services/firestore_service.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/preferences_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../infrastructure/services/app_members_service.dart';
import '../../locator.dart';

class UserOperations {
  static HiveService get _prefs => locator<HiveService>();

  static ConfigService get _configs => locator<ConfigService>();
  static final remoteConfig = FirebaseRemoteConfig.instance;

  static AppMembersService get _memS => locator<AppMembersService>();

  static Future<void> configureUserDataWhenLogin(
      //MyUser user,
      {required String fcmToken,
      required String accessToken,
      required String? path}) async {
    //llll("configureUserData result result: " + user.toString());
    try {
      // await _prefs.persistIsLoggedIn(true);
      // await _prefs.persistIsGuest(false);
      await _prefs.persistAccessToken(accessToken: accessToken);
      await _prefs.persistPath(path!);

      // await _prefs.persistFcmToken(fcmToken: fcmToken);
      final dioAuth = await DioAuth.instance;
      if (locator.isRegistered(instance: dioAuth)) {
        locator.unregister(instance: dioAuth);
        locator.registerSingleton(dioAuth);
      }

      await configUserDataWhenOpenApp(
          fcm: fcmToken, path: path, accessToken: accessToken);
      // final result = await AccountProvider.fetchUserInfo(token: accessToken);
      // MyUser user = (result!.data as MyUser);
      // await _prefs.persistUser(user: user);
      // await _configs.persistEmail(email: user.email);
      // locator.resetLazySingleton(instance: DioAuth.instance);

    } catch (e, s) {
      bbbb("configureUserData e: $e => s: $s");
      Recorder.recordCatchError(e, s);
    }
  }

  static Future<bool> configUserDataWhenOpenApp(
      {required accessToken, required fcm, String? path}) async {
    try {
      await _prefs.persistAccessToken(accessToken: accessToken);
      final result = await AccountProvider.fetchUserInfo(token: accessToken);
      final deleteAccount =
          await remoteConfig.getBool(SharedKeys.deleteAccount);
      if (isSuccess(result!.statusCode)) {
        final MyUser user = result.data;
        //userData.cargoBalance = "0.55";
        //sorgu gonderilir ,xeta yaranarsa ve ya serverle bagli sehvlik olarsa
        //server error sehifesini goterir
        await _prefs.persistUser(user: user);
        Recorder.setUser(user); //crashlyticse user melumatlarini gonderir
        Recorder.setId(user.id); //crashlyticse id setted
        Recorder.setUserFCMtoken(fcm); //fcm token setted
        checkAndAddAppMember(token: accessToken, user: user);

        await _prefs.persistFcmToken(fcmToken: fcm);
        await _prefs.persistIsGuest(false);
        await _prefs.persistIsLoggedIn(true);
        await _prefs.persistDeleteAccount(deleteAccount);

        await FirestoreDBService.readConfig();
        if (path != null) {
          await FirestoreDBService.saveUserPath(user, path, fcm, accessToken);
        }
        return true;
      } else
        return false;
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      return false;
    }
    // print("token: " + accessToken.toString());

    //FirestoreDBService.saveUser(userData!);
  }

  static Future<void> checkAndAddAppMember(
      {required MyUser user, required String token}) async {
    final currentAppMember = AppMember(token: token, user: user);
    final List<AppMember> appMembers = _memS.appMembers;
    final membersWithId =
        appMembers.where((element) => element.user?.id == user.id);
    if (membersWithId.isNotEmpty) return;
    await _memS.addAppMember(currentAppMember);
  }
}
