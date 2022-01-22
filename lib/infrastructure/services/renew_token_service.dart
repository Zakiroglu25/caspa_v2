// // Dart imports:
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // Package imports:
// import 'package:http/http.dart' as http;
// import 'package:optimal/infrastructure/cubits/authentication/authentication_cubit.dart';
// import 'package:optimal/infrastructure/services/hive_service.dart';
// import 'package:optimal/locator.dart';
// import 'package:optimal/pages/first_page/first_page.dart';
// import 'package:optimal/util/constants/api_keys.dart';
// import 'package:optimal/util/constants/result_keys.dart';
// import 'package:optimal/util/delegates/my_printer.dart';
// import 'package:optimal/util/screen/snack.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';
//
// class RenewTokenService {
//   static RenewTokenService _instance;
//
//   RenewTokenService._internal();
//
//   static Future<RenewTokenService> get instance async {
//     if (_instance == null) {
//       _instance = RenewTokenService._internal();
//     }
//     return _instance;
//   }
//
//   PreferencesService get _prefs => locator<PreferencesService>();
//   AuthenticationCubit authenticationCubist;
//
//   Future<String> reNewToken(BuildContext context) async {
//     final api = ApiKeys.renewToken;
//     final headers = ApiKeys.headers;
//     final url = Uri.parse(api);
//     final body = {"refreshToken": _prefs.refreshToken};
//     var newAccessToken;
//     final response =
//         await http.post(url, headers: headers, body: jsonEncode(body));
//     if (response.statusCode == ResultKey.responseSuccess) {
//       var dataGelenCavabJSON = jsonDecode(response.body);
//
//       if (dataGelenCavabJSON['statusCode'] < 300) {
//         newAccessToken = dataGelenCavabJSON['result']['accessToken'];
//         //  setSentry(dataGelenCavabJSON, body, "dataGelenCavabJSON['statusCode'] < 300  ---true ");
//         iiii("token: " + newAccessToken.toString());
//         //  iiii("refresh token: " + _prefs.refreshToken.toString());
//         _prefs.persistAccessToken(accessToken: newAccessToken);
//       } else {
//         //setSentry(dataGelenCavabJSON, body, "dataGelenCavabJSON['statusCode'] < 300  ---false ");
//         logout(context);
//       }
//     } else {
//       // setSentry("", body, "response.statusCode == ResultKey.responseSuccess --false : --> response.statusCode=${response.statusCode}");
//       eeee("reNewToken: error -> " + response.body.toString());
//       logout(context);
//     }
//
//     return newAccessToken;
//   }
//
//   void logout(BuildContext context) {
//     BlocProvider.of<AuthenticationCubit>(context)..logOut(context);
//     Navigator.of(context, rootNavigator: true)
//         .pushReplacement(MaterialPageRoute(builder: (context) => FirstPage()));
//     Snack.display(
//         context: context, message: "please_login_again", positive: true);
//   }
//
//   void setSentry(
//       dataGelenCavabJSON, Map<String, String> body, String local_status) async {
//     getException(await Sentry.captureException(
//       {
//         "user": _prefs.user,
//         "dataGelenCavabJSON": dataGelenCavabJSON,
//         "body": body,
//         "local_status": local_status,
//         "date": DateTime.now().toString()
//       },
//       stackTrace: "stackTrace",
//     ).then((value) {
//       debugPrint("error sended: $value");
//     }));
//
//     // FirebaseFirestore firestore = FirebaseFirestore.instance;
//     // try {
//     //   return firestore.collection('Users').doc(_prefs.user.id).set({
//     //     "dataGelenCavabJSON": dataGelenCavabJSON,
//     //     "body": body,
//     //     "local_status": local_status,
//     //     "date": DateTime.now().toString()
//     //   });
//     //   // // AdvertisementList advertisementL = AdvertisementList.fromMap(advData);
//     //   // print("---------------- ${advData['permission']}");
//     //   // final bool permission = advData['permission'];
//     //   // final bool permission2 = advData['permission2'];
//     //   // final String message = advData['message'];
//     // } catch (e) {
//     //   print("setFirebase error: " + e.toString());
//     // }
//   }
// }
//
// void getException(Function func) {
//   try {
//     List a = [1];
//     print(a[9]);
//   } catch (exception, stackTrace) {
//     func.call();
//   }
// }
