// Package imports:
import 'package:caspa_v2/util/constants/preferences_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  static PackageInfoService? _instance;
  static Box? _box;

  PackageInfoService._internal();

  static Future<PackageInfoService> get instance async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _instance ??= PackageInfoService._internal();
    _box = await Hive.openBox(SharedKeys.config);
    return _instance!;
  }
}
