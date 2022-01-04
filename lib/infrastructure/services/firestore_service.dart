import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firestore.dart';
class FirestoreDBService  {
  FirebaseFirestore _firebaseDB = FirebaseFirestore.instance;

  @override
  Future<bool> saveUser(MyUser user, String num, String sifre) async {
    DocumentSnapshot _oxunanUser =
    await FirebaseFirestore.instance.doc("users/${user.userID}").get();

    if (_oxunanUser.data != null) {
      user.userNum = num;
      user.userPass = sifre;

      await _firebaseDB.collection("users").doc(user.userID).set(user.toMap());

      //await _firebaseDB.doc("users/${user.userID}").update({ "userNum": num,});

      return true;
    } else {
      return true;
    }
  }

  @override
  Future<MyUser> readUser(String userID) async {
    DocumentSnapshot _oxunanUser =
    await _firebaseDB.collection("users").doc(userID).get();
    Map<String, dynamic> _oxunanUserDataMap = _oxunanUser.data();

    MyUser _oxunanUserObject = MyUser.fromMap(_oxunanUserDataMap);
    // print("firestore_db_service -> readUser:" + _oxunanUserObject.toString());
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
  @override
  Future<bool> updateUser(String userID, MyUser user) async {

    await _firebaseDB
        .collection("users")
        .doc(userID)
        .update(user.toMap());

    return true;

  }

  @override
  Future<bool> pay(String userID, String payAmount, int paid, String paidDate)async {
    // var users = await _firebaseDB
    //     .collection("users")
    //     .where("userName", isEqualTo: yeniUserName)
    //     .get();
    // if (users.docs.length >= 1) {
    //   return false;
    // } else {
    //   await _firebaseDB
    //       .collection("users")
    //       .doc(userID)
    //       .update({"userName": yeniUserName});
    //
    //   return true;
    // }
  }



}
