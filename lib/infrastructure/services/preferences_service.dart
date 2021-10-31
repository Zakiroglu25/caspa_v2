// // Dart imports:
// import 'dart:convert';
//
// // Package imports:
// import 'package:caspa_v2/util/constants/preferences_keys.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// // Project imports:
//
// class PreferencesService {
//   static PreferencesService? _instance;
//   // static SharedPreferences? _preferences;
//
//   PreferencesService._internal();
//
//   static Future<PreferencesService> get instance async {
//     if (_instance == null) {
//       _instance = PreferencesService._internal();
//     }
//
//     // _preferences = await SharedPreferences.getInstance();
//     // if (_preferences == null) {}
//
//     return _instance!;
//   }
//
//   Future<bool> clear() async {
//     // return await _preferences!.clear();
//   }
//
//   // refresh token
//   Future<void> persistRefreshToken({String? refreshToken}) async {
//     if (refreshToken == null) {
//        // await _preferences!.remove(SharedKeys.refreshToken);
//     } else {
//       // await _preferences!.setString(SharedKeys.refreshToken, refreshToken);
//     }
//   }
//
//   // String get refreshToken => _preferences!.getString(SharedKeys.refreshToken)!;
//   //
//   // bool get hasRefreshToken => _preferences?.containsKey(SharedKeys.refreshToken) ?? false;
//
//
//   //access token
//   Future<void> persistAccessToken({String? accessToken}) async {
//     if (accessToken == null) {
//        await _preferences!.remove(SharedKeys.accessToken);
//     } else
//        await _preferences!.setString(SharedKeys.accessToken, accessToken);
//   }
//
//   String get accessToken => _preferences!.getString(SharedKeys.accessToken)!;
//
//   bool get hasAccessToken => (_preferences?.containsKey(SharedKeys.accessToken)) ??false;
//
//
//   //language
//   Future<void> persistLanguage({String? language}) async {
//      await _preferences!.setString(SharedKeys.language, language!);
//   }
//
//   String get language => _preferences!.getString(SharedKeys.language) ?? "az";
//
//   //user
//   // Future<void> persistUser({MyUser? user}) async {
//   //   if (user == null) {
//   //      await _preferences.remove(SharedKeys.user);
//   //   } else
//   //      await _preferences.setString(
//   //         SharedKeys.user, json.encode(user.toJson()));
//   // }
//   // MyUser get user => MyUser.fromJson(json.decode(_preferences.getString(SharedKeys.user))) ;
//
//
//
//   //header cubit pref
//
//   // Future<void> persistHeader({HeaderResult? headerResult}) async {
//   //   if (headerResult == null) {
//   //      await _preferences!.remove(SharedKeys.headerResult);
//   //   } else
//   //      await _preferences!.setString(
//   //         SharedKeys.headerResult, json.encode(headerResult.toJson()))!;
//   // }
//   //
//   // // MyUser get user => MyUser.fromJson(json.decode(_preferences.getString(SharedKeys.user))) ;
//   // String get header => _preferences!.getString(SharedKeys.headerResult);
//
// //////
//
//   Future<void> persistIsLoggedIn(bool value) async {
//     await _preferences!.setBool('is_logged_in', value);
//   }
//
//   bool get isLoggedIn => _preferences!.getBool('is_logged_in') ?? false;
//
//   Future<void> persistIsGuest(bool value) async {
//     await _preferences!.setBool('isGuest', value);
//   }
//
//   bool get isGuest => _preferences!.getBool('isGuest') ?? true;
//
//
//   Future<void> persistFcmToken({String? fcmToken}) async {
//      await _preferences!.setString("fcm_token", fcmToken!);
//   }
//
//   String get fcmToken => _preferences!.getString("fcm_token")!;
//
//   read(String key) async {
//     //  print("read shared 1");
//     final prefs = await SharedPreferences.getInstance();
//     //  print("read shared 2");
//     return json.decode(prefs.getString(key)!);
//   }
//
//   save(String key, value) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString(key, json.encode(value));
//   }
//
//   remove(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.remove(key);
//   }
// }
