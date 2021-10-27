// // Dart imports:
// import 'dart:io';
//
// // Flutter imports:
// import 'package:caspa_v2/infrastructure/data_source/auth_provider.dart';
// import 'package:flutter/cupertino.dart';
//
// // Package imports:
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'login_state.dart';
// // Project imports:
//
// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial()) {
//     userNameController.addListener(() {});
//     commentController.addListener(() {});
//   }
//
//   final userNameController = TextEditingController();
//   final commentController = TextEditingController();
//
//   void login({bool? loading}) async {
//     try {
//       if (loading ?? true) {
//         emit(LoginInProgress());
//       }
//
//       final result = await AuthProvider.addComment(
//           rate: rate,
//           comment: commentController.text,
//           username: userNameController.text,
//           goodsId: goodsId
//
//       );
//       //tewst
//
//       if (result.message == 'created') {
//         emit(LoginSuccess(result));
//       } else {
//         emit(LoginError());
//       }
//     } on SocketException catch (_) {
//       emit(LoginError(error: 'network_error'));
//     } catch (e) {
//       emit(LoginError(error: e));
//     }
//   }
// }
