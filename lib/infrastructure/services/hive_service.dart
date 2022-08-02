// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/util/constants/preferences_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/remote/response/delivery_address_model.dart';
import '../models/remote/response/regions_model.dart';

// Project imports:

class HiveService {
  static HiveService? _instance;
  static Box? _box;

  HiveService._internal();

  static Future<HiveService> get instance async {
    _instance ??= HiveService._internal();

    _box = await Hive.openBox('main');
    // if (_preferences == null) {}

    return _instance!;
  }

  void clear() async {
    _box!.clear();
  }

  // refresh token
  Future<void> persistRefreshToken({String? refreshToken}) async {
    if (refreshToken == null) {
      await _box!.delete(SharedKeys.refreshToken);
    } else {
      await _box!.put(SharedKeys.refreshToken, refreshToken);
    }
  }

  String get refreshToken => _box!.get(SharedKeys.refreshToken)!;

  bool get hasRefreshToken =>
      _box?.containsKey(SharedKeys.refreshToken) ?? false;

  //access token
  Future<void> persistAccessToken({String? accessToken}) async {
    if (accessToken == null) {
      await _box!.delete(SharedKeys.accessToken);
    } else
      await _box!.put(SharedKeys.accessToken, accessToken);
  }

  String? get accessToken => _box!.get(SharedKeys
      .accessToken); //??"265|dX6SpWKiv3sHDNAGsApUFPmtN3ToE5r0ntZJBvMI";
  // String? get accessToke => '583|8G45krLD8Hj2VAZAFFS2N3dStuLYQ1ERgMlv4ZAy';
  //??"265|dX6SpWKiv3sHDNAGsApUFPmtN3ToE5r0ntZJBvMI";

  bool get hasAccessToken =>
      (_box?.containsKey(SharedKeys.accessToken)) ?? false;

  //language
  Future<void> persistLanguage({String? language}) async {
    await _box!.put(SharedKeys.language, language!);
  }

  String get language => _box!.get(SharedKeys.language) ?? "az";

  //user
  persistUser({required MyUser user}) async {
    if (user == null) {
      return await _box!.delete(SharedKeys.user);
    } else
      return await _box!.put(SharedKeys.user, json.encode(user.toJson()));
  }

  MyUser get user => MyUser.fromJson(json.decode(_box!.get(SharedKeys.user)!));

  //user
  persistAddress({required DeliveryAddress address}) async {
    if (address == null) {
      return await _box!.delete(SharedKeys.address);
    } else
      return await _box!.put(SharedKeys.address, json.encode(address.toJson()));
  }

  DeliveryAddress? get address {
    String? address = _box!.get(SharedKeys.address);
    if (address == null) {
      return null;
    } else
      return DeliveryAddress.fromJson(json.decode(address));
  }

  //user
  // Future<void> persistUser({MyUser? user}) async {
  //   if (user == null) {
  //      await _preferences.remove(SharedKeys.user);
  //   } else
  //      await _preferences.setString(
  //         SharedKeys.user, json.encode(user.toJson()));
  // }
  // MyUser get user => MyUser.fromJson(json.decode(_preferences.getString(SharedKeys.user))) ;

  //header cubit pref

  // Future<void> persistHeader({HeaderResult? headerResult}) async {
  //   if (headerResult == null) {
  //      await _preferences!.remove(SharedKeys.headerResult);
  //   } else
  //      await _preferences!.setString(
  //         SharedKeys.headerResult, json.encode(headerResult.toJson()))!;
  // }
  //
  // // MyUser get user => MyUser.fromJson(json.decode(_preferences.getString(SharedKeys.user))) ;
  // String get header => _preferences!.getString(SharedKeys.headerResult);

//////

  Future<void> persistIsLoggedIn(bool value) async {
    await _box!.put('is_logged_in', value);
  }

  bool get isLoggedIn => _box!.get('is_logged_in') ?? false;

  Future<void> persistIsGuest(bool value) async {
    await _box!.put('isGuest', value);
  }

  bool get isGuest => _box!.get('isGuest') ?? true;

  //pass
  Future<void> persistPath(String path) async {
    await _box!.put(SharedKeys.userPath, path);
  }

  String get userPath => _box!.get(SharedKeys.userPath) ?? "null";

  Future<void> persistFcmToken({String? fcmToken}) async {
    await _box!.put("fcm_token", fcmToken!);
  }

  String get fcmToken => _box!.get("fcm_token")!;

  read(String key) async {
    //  print("read shared 1");
    final prefs = await SharedPreferences.getInstance();
    //  print("read shared 2");
    return json.decode(prefs.getString(key)!);
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
