// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:caspa_v2/infrastructure/data_source/auth_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/presentation/page/landing_page/landing_page.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/validators/validator.dart';
import 'package:device_information/device_information.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

import 'package:rxdart/rxdart.dart';
// Project imports:
import 'package:device_info_plus/device_info_plus.dart';
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

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
        );

        if (isSuccess(response.statusCode)) {
          emit(LoginSuccess(response.body));
          Go.replace(context, LandingPage());
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



    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    //AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //  print('Running 1 on ${androidInfo.model}');  // e.g. "Moto G (4)"

    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    print('Running 2 on ${iosInfo.utsname.machine}');  // e.g. "iPod7,1"
    print('Running 2 on ${iosInfo.utsname.nodename}');  // e.g. "iPod7,1"
    print('Running 2 on ${iosInfo.utsname.release}');  // e.g. "iPod7,1"
    print('Running 2 on ${iosInfo.utsname.sysname}');  // e.g. "iPod7,1"
    print('Running 2 on ${iosInfo.utsname.version}');  // e.g. "iPod7,1"
    print('Running 2 on ${iosInfo.name}');  // e.g. "iPod7,1"
    print('Running 2 on ${iosInfo.model}');  // e.g. "iPod7,1"
    print('Running 2 on ${iosInfo.systemName}');  // e.g. "iPod7,1"
    print('Running 2 on ${iosInfo.identifierForVendor}');  // e.g. "iPod7,1"

   // WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    //print('Running   3 on ${webBrowserInfo.userAgent}');  // e.g. "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"

 //  final deviceName =  await DeviceExtInfo.deviceName;
    try {
      final platformVersion = await DeviceInformation.platformVersion;
      final imeiNo = await DeviceInformation.deviceIMEINumber;
      final modelName = await DeviceInformation.deviceModel;
      final manufacturer = await DeviceInformation.deviceManufacturer;
      final apiLevel =  await DeviceInformation.apiLevel;
      final deviceName = await DeviceInformation.deviceName;
      final productName = await DeviceInformation.productName;
      final cpuType = await DeviceInformation.cpuName;
      final hardware = await DeviceInformation.hardware;
      print('Running on ${apiLevel}');
    } on PlatformException {
      final platformVersion = 'Failed to get platform version.';
      print('Running on ');
    }
    catch(e){

      print('Running on ${e}');
    }
    // e.g. "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"


    try {
      if (loading ?? true) {
        emit(LoginInProgress());
      }

      final response = await AuthProvider.login(
        email: "esev.sv@gmail.com",
        password: 'salam12345',
      );

      if (isSuccess(response.statusCode)) {
        emit(LoginSuccess(response.body));
        Go.replace(context, LandingPage());
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
}
