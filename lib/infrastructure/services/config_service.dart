// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/util/constants/preferences_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:

class ConfigService {
  static ConfigService? _instance;
  static Box? _box;

  ConfigService._internal();

  static Future<ConfigService> get instance async {
    _instance ??= ConfigService._internal();
    _box = await Hive.openBox('config');
    return _instance!;
  }

  void clear() async {
    return _box!.close();
  }

  // refresh token
  Future<void> persistOnBoard({bool? seen}) async {
    if (seen == null) {
      await _box!.delete(SharedKeys.onBoardIsSeen);
    } else {
      await _box!.put(SharedKeys.onBoardIsSeen, seen);
    }
  }

  String get onBoardIsSeen => _box!.get(SharedKeys.onBoardIsSeen)!;
}
