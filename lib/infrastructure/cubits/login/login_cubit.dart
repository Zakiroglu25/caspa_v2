// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:caspa_v2/infrastructure/data_source/auth_provider.dart';
import 'package:caspa_v2/infrastructure/models/general/MyMessage.dart';
import 'package:caspa_v2/presentation/page/landing_page/landing_page.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/validators/validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

import 'package:rxdart/rxdart.dart';
// Project imports:

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

  void login(BuildContext context,{bool? loading}) async {
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
          NavigateUtils.pushReplacement(context, LandingPage());
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

  bool isUserInfoValid() {
    if (!isPassIncorrect && !isEmailIncorrect) {
      return true;
    } else {
      return false;
    }
  }
}
