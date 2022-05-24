// Package imports:
import 'package:caspa_v2/util/constants/preferences_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UsersService {
  static UsersService? _instance;
  static Box? _box;

  UsersService._internal();

  static Future<UsersService> get instance async {
    _instance ??= UsersService._internal();
    _box = await Hive.openBox('users');
    return _instance!;
  }

  void clear() async {
    return _box!.close();
  }

  // refresh token
  Future<void> saveUser({bool? seen}) async {
    if (seen == null) {
      await _box!.delete(SharedKeys.onBoardIsSeen);
    } else {
      await _box!.put(SharedKeys.onBoardIsSeen, seen);
    }
  }

  bool get onBoardIsSeen => _box!.get(SharedKeys.onBoardIsSeen) ?? false;

  // email
  Future<void> persistEmail({String? email}) async {
    if (email == null) {
      await _box!.delete(SharedKeys.email);
    } else {
      await _box!.put(SharedKeys.email, email);
    }
  }

  String get email => (_box!.get(SharedKeys.email)) ?? '';
}
