// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:

import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/util/validators/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../locator.dart';
import 'forgot_pass_state.dart';

class ForgotPassCubit extends Cubit<ForgotPassState> {
  ForgotPassCubit() : super(ForgotPassEnterMail());

  PreferencesService get _prefs => locator<PreferencesService>();
  String buttonText='send';

  bool emailValid = false;
  final BehaviorSubject<String> uEmail = BehaviorSubject<String>();

  Stream<String> get emailStream => uEmail.stream;

  updateEmail(String value) {
    if (value == null || value.isEmpty) {
      uEmail.value = '';
      uEmail.sink.addError("email_address_is_not_correct");
    } else {
      emailValid = Validator.mail(value);
      uEmail.sink.add(value);
    }
  }

  bool get isEmailIncorrect => (!uEmail.hasValue ||
      uEmail.value == null ||
      uEmail.value.isEmpty ||
      !emailValid);

  @override
  Future<void> close() {
    uEmail.close();
    return super.close();
  }

  int currentIndex = 0;

  List states = [
    ForgotPassEnterMail(),
    ForgotPassEnterCode(),
    ForgotPassNewPass(),
    ForgotPassSuccess()
  ];

  void changeState(
      {bool loading = true,
      int? index,
      bool back = false,
      required BuildContext context}) async {
    if (loading) {
      emit(ForgotPassInProgress());
    }

    operate(currentIndex, context);
    if (!back) {
      currentIndex = index ?? currentIndex + 1;
    } else {
      currentIndex = currentIndex > 0 ? currentIndex - 1 : currentIndex;
    }
    emit(states[index ?? currentIndex]);
  }

  void sendMail({bool loading = true}) async {
    if (loading) {
      emit(ForgotPassInProgress());
    }

    currentIndex = 1;
    emit(ForgotPassEnterCode());
  }

  void enterCode({bool loading = true}) async {
    if (loading) {
      emit(ForgotPassInProgress());
    }

    currentIndex = 2;
    emit(ForgotPassNewPass());
  }

  void confirmPass({bool loading = true}) async {
    if (loading) {
      emit(ForgotPassInProgress());
    }

    currentIndex = 2;
    emit(ForgotPassSuccess());
  }

  Future<bool> operate(int currentIndex, BuildContext context) async {
    bool res = false;
    switch (currentIndex) {
      case 0:
        buttonText='send';
        Snack.display(context: context, message: "kod gonderildi");
        break;
      case 1:
        buttonText='send';
        Snack.display(context: context, message: "kod duzgun daxil edildi");
        break;
      case 2:
        buttonText='OK';
        Snack.display(context: context, message: "dirim dirim dirim");
        break;
      case 3:
        break;
    }

    return res;
  }
}