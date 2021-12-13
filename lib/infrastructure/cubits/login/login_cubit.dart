// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/infrastructure/data_source/auth_provider.dart';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/presentation/page/landing_page/landing_page.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/util/validators/validator.dart';
import 'package:device_information/device_information.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import 'login_state.dart';

import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:device_info_plus/device_info_plus.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  PreferencesService get _prefs => locator<PreferencesService>();

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
            deviceTypeId: StringOperations.platformId(),
            deviceCode: 'yoken',
            deviceName: await StringOperations.devicename(),
            lang: 'az');

        if (isSuccess(response.statusCode)) {
          await configureUserData(accessToken: 'jk', fcmToken: 'ss');

          emit(LoginSuccess(response.body));
       //   Go.replace(context, Pager.landing);
          // result=response.data;
        } else {
          emit(LoginError());
          // result= MessageResponse.fromJson(response.data).message;
          eeee(
              "login result bad: ${ResponseMessage.fromJson(jsonDecode(response.body)).message}");
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

      final response = await AuthProvider.login(
          email: "esev.sv@gmail.com",
          password: 'salam12345',
          deviceTypeId: StringOperations.platformId(),
          deviceCode: 'yoken',
          deviceName: 'kk',
          lang: 'az');

      if (isSuccess(response.statusCode)) {
       await configureUserData(accessToken: 'jk', fcmToken: 'ss');
        emit(LoginSuccess(response.body));
        // Go.replace(context, Pager.landing);

        context.read<AuthenticationCubit>()
          .startApp(context, showSplash: false);
        // result=response.data;
      } else {
        emit(LoginError());
        // result= MessageResponse.fromJson(response.data).message;
        eeee(
            "login result bad: ${ResponseMessage.fromJson(jsonDecode(response.body)).message}");
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

  Future<void> configureUserData(
      //MyUser user,
      {required String fcmToken,
      required String accessToken}) async {
    //llll("configureUserData result result: " + user.toString());

    // final userSave = MyUser(
    //      id: result.result.id,
    //      mobileCurrentLng: mobileCurrentLng,
    //      email: result.result.email,
    //      surname: result.result.surname,
    //      genderId: result.result.genderId,
    //      birthday: result.result.birthday,
    //      phoneNumber: result.result.phoneNumber,
    //      name: result.result.name,
    //      haveCard: result.result.haveCard,
    //      refreshToken: result.result.refreshToken,
    //      accessToken: result.result.accessToken);

    // await _prefs.save("user", userSave);
    await _prefs.persistIsGuest(false);
    await _prefs.persistIsLoggedIn(true);
    //await _prefs.persistRefreshToken(refreshToken: user.result.refreshToken);
    await _prefs.persistAccessToken(accessToken: accessToken);
    await _prefs.persistFcmToken(fcmToken: fcmToken);

    //llll("configureUserData result result: " + userSave.toString());

    //wtf("new user: " + userSave.toString());
  }
}
