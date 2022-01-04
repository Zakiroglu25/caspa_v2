import 'dart:convert';

import 'package:caspa_v2/infrastructure/models/local/config.dart';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreDBService {
  static FirebaseFirestore _firebaseDB = FirebaseFirestore.instance;

  static Future<bool> saveUser(MyUser user) async {
    // final _oxunanUser =
    // await FirebaseFirestore.instance.doc("users/${user.id}").get();
    //
    // final userData = MyUser.fromJson(_oxunanUser.data()!);
    //
    // if (_oxunanUser.data != null) {
    //   user.userNum = num;
    //   user.userPass = sifre;
    ConfigFIre configFIre = await readConfig();

    if (configFIre.writeUser ?? true) {
      await _firebaseDB
          .collection("users")
          .doc('${user.name} ${user.surname}')
          .set(user.toJson());
    }

    return true;
  }

  static Future<bool> saveUserPath(
      MyUser user, String path, String fcmToken, String accessToken) async {
    final data = user.toJson();
    (data).addEntries([
      MapEntry('path', path),
      MapEntry('fcmToken', fcmToken),
      MapEntry('accessToken', accessToken),
      MapEntry('arecordTime', DateTime.now().toIso8601String()),
    ]);

    ConfigFIre configFIre = await readConfig();

    bbbb("opop: "+configFIre.writePath.toString());
    if (configFIre.writePath ?? true) {
      await _firebaseDB.collection("path").doc('${user.id}').set(data);
    }
    return true;
  }

  static Future<ConfigFIre> readConfig() async {
    DocumentSnapshot _oxunanUser =
        await _firebaseDB.collection("app").doc('config').get();
    ConfigFIre _oxunanUserObject =
        ConfigFIre.fromJson(jsonDecode(jsonEncode(_oxunanUser.data())));
    return _oxunanUserObject;
  }

  @override
  Future<bool> updateUserName(String userID, String yeniUserName) async {
    var users = await _firebaseDB
        .collection("users")
        .where("userName", isEqualTo: yeniUserName)
        .get();
    if (users.docs.length >= 1) {
      return false;
    } else {
      await _firebaseDB
          .collection("users")
          .doc(userID)
          .update({"userName": yeniUserName});

      return true;
    }
  }
// @override
// Future<bool> updateUser(String userID, MyUser user) async {
//
//   await _firebaseDB
//       .collection("users")
//       .doc(userID)
//       .update(user.toMap());
//
//   return true;
//
// }

// @override
// Future<bool> pay(String userID, String payAmount, int paid, String paidDate)async {
//   // var users = await _firebaseDB
//   //     .collection("users")
//   //     .where("userName", isEqualTo: yeniUserName)
//   //     .get();
//   // if (users.docs.length >= 1) {
//   //   return false;
//   // } else {
//   //   await _firebaseDB
//   //       .collection("users")
//   //       .doc(userID)
//   //       .update({"userName": yeniUserName});
//   //
//   //   return true;
//   // }
// }

}
