// Package imports:
import 'dart:convert';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/util/constants/preferences_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/local/app_member.dart';

class AppMembersService {
  static AppMembersService? _instance;
  static Box? _box;

  AppMembersService._internal();

  static Future<AppMembersService> get instance async {
    _instance ??= AppMembersService._internal();
    _box = await Hive.openBox(SharedKeys.appMember);
    return _instance!;
  }

  void clear() async {
    return _box!.close();
  }

//token list
  Future<void> persistTokenList(List value) async {
    await _box!.put(SharedKeys.appMembers, value);
  }

  Future<void> addAppMember(AppMember value) async {
    final jsonListOfMembers =
        (appMembers..add(value)).map((e) => e.toJson()).toList();
    await _box!.put(SharedKeys.appMembers, jsonListOfMembers);
  }

  Future<void> removeAppMember(MyUser value) async {
    final filteredMembers =
        appMembers.where((element) => element.user?.id == value.id);
    if (filteredMembers.isEmpty) return;
    final foundMember = filteredMembers.last;
    final jsonListOfMembers = (appMembers
          ..removeWhere((e) => e.user?.id == foundMember.user?.id))
        .map((e) => e.toJson())
        .toList();
    await _box!.put(SharedKeys.appMembers, jsonListOfMembers);
  }

  List<AppMember> get appMembers {
    final List<dynamic> members =
        (_box!.get(SharedKeys.appMembers)) as List<dynamic>;
    List<AppMember> appMemberList = [];

    if (members.isEmpty) return [];
    for (var element in members) {
      appMemberList.add(AppMember.fromJson(json.decode(json.encode(element))));
    }
    return appMemberList;
  }
}
