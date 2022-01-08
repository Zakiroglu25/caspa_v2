// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/infrastructure/data_source/account_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/auth_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/infrastructure/services/firestore_service.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/util/delegate/user_operations.dart';
import 'package:caspa_v2/util/validators/validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import 'login_state.dart';

import 'package:rxdart/rxdart.dart';

// Project imports:

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  PreferencesService get _prefs => locator<PreferencesService>();
  FirebaseMessaging get _fcm => locator<FirebaseMessaging>();

  bool emailValid = false;

  final BehaviorSubject<String> uEmail = BehaviorSubject<String>();
  final BehaviorSubject<String> uPass = BehaviorSubject<String>();

  Stream<String> get emailStream => uEmail.stream;

  Stream<String> get passStream => uPass.stream;

  updateEmail(String value) {
    if (value == null || value.isEmpty) {
      uEmail.value = '';
      uEmail.sink.addError("email_address_is_not_correct");
    } else {
      emailValid = Validator.mail(value);
      uEmail.sink.add(value);
    }
  }

  updatePass(String value) {
    if (value == null || value.isEmpty) {
      uPass.value = '';
      uPass.sink.addError("fill_correctly");
    } else {
      uPass.sink.add(value);
      uEmail.sink.add("esev.sv@gmail.com");
      uPass.sink.add("salam12345");
    }
  }

  bool get isPassIncorrect =>
      (!uPass.hasValue || uPass.value == null || uPass.value.isEmpty);

  bool get isEmailIncorrect => (!uEmail.hasValue ||
      uEmail.value == null ||
      uEmail.value.isEmpty ||
      !emailValid);

  @override
  Future<void> close() {
    uPass.close();
    uEmail.close();
    return super.close();
  }

  void login(BuildContext context, {bool? loading}) async {
    try {
      if (isPassIncorrect) {
        updatePass('');
      }
      if (isEmailIncorrect) {
        updateEmail('');
      }

      if (isUserInfoValid()) {
        if (loading ?? true) {
          emit(LoginInProgress());
        }

        final response = await AuthProvider.login(
            email: uEmail.value,
            password: uPass.value,
            deviceTypeId: await StringOperations.platformId(),
            deviceCode: 'yoken',
            deviceName: await StringOperations.devicename(),
            lang: 'az');

        if (isSuccess(response?.statusCode)) {
          await UserOperations.configureUserData(accessToken: response!.data, fcmToken:"",path: "");

          emit(LoginSuccess(response.data));
         // bbbb("auiui");
           //  Go.replace(context, Pager.landing);
          // result=response.data;
        } else {
          emit(LoginError());
          // result= MessageResponse.fromJson(response.data).message;
          eeee(
              "login result bad: ${ResponseMessage.fromJson(jsonDecode(response!.data)).message}");
        }
      } else {
        emit(LoginError(error: 'error'));
      }
    } on SocketException catch (_) {
      emit(LoginError(error: 'network_error'));
    } catch (e) {
      emit(LoginError(error: e.toString()));
    }
  }

  void testLogin(BuildContext context, {bool? loading}) async {
    try {
      if (loading ?? true) {
        emit(LoginInProgress());
      }

final email="esev.sv@gmail.com";
final pass= 'b261c54a3';
      final deviceCode = await _fcm.getToken();

      final response = await AuthProvider.login(
          email: email,
          password: pass,
          deviceTypeId: StringOperations.platformId(),
          deviceCode: deviceCode,
          deviceName: await StringOperations.devicename(),
          lang: _prefs.language);

  //    FirestoreDBService.saveUser(userData!);
      if (isSuccess(response?.statusCode)) {
        await UserOperations.configureUserData(accessToken: response?.data, fcmToken: deviceCode!,path: pass);
        Go.andRemove(context, Pager.app(showSplash: true));
        emit(LoginSuccess(''));

      } else {
        emit(LoginError());
        // result= MessageResponse.fromJson(response.data).message;
        eeee(
            "login result bad: ${ResponseMessage.fromJson(jsonDecode(response?.data)).message}");
      }
    } on SocketException catch (_) {
      emit(LoginError(error: 'network_error'));
    } catch (e) {
      emit(LoginError(error: e.toString()));
    }
  }

  bool isUserInfoValid() {
    if (!isPassIncorrect && !isEmailIncorrect) {
      return true;
    } else {
      return false;
    }
  }

}
