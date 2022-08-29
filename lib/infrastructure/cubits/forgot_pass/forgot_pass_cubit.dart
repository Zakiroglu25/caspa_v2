// Dart imports:
// Package imports:

import 'package:caspa_v2/infrastructure/data_source/forgot_provider.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/util/validators/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../locator.dart';
import 'forgot_pass_state.dart';

class ForgotPassCubit extends Cubit<ForgotPassState> {
  ForgotPassCubit() : super(ForgotPassEnterMail());

  HiveService get _prefs => locator<HiveService>();
  String buttonText = MyText.send;

  void changeState(
      {bool loading = true,
      int? index,
      bool back = false,
      required BuildContext context}) async {
    if (loading) {
      emit(ForgotPassInProgress());
    }

    final goOn = await operate(currentIndex, context);
    if (!back) {
      if (goOn) currentIndex = index ?? currentIndex + 1;
    } else {
      currentIndex = currentIndex > 0 ? currentIndex - 1 : currentIndex;
    }
    emit(states[index ?? currentIndex]);
  }

  Future<bool> sendMail(BuildContext context, {bool loading = true}) async {
    final result = await ForgotProvider.sendMail(
        phone: AppOperations.formatNumber(phone.valueOrNull!));
    if (isSuccess(result!.statusCode)) {
      return true;
    } else {
      emit(ForgotPassError());
      if (result.data.toString().contains('message')) {
        Snack.display(context: context, message: result.data['message']);
      }

      return false;
    }
  }

  Future<bool> enterCode(BuildContext context, {bool loading = true}) async {
    if (loading) {
      emit(ForgotPassInProgress());
    }
    final result = await ForgotProvider.addCode(
        phone: AppOperations.formatNumber(phone.valueOrNull!),
        code: otpCode.valueOrNull);

    if (isSuccess(result!.statusCode)) {
      return true;
    } else {
      emit(ForgotPassError());
      Snack.display(context: context, message: MyText.error);
      return false;
    }
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
    bbbb("crrent: " + currentIndex.toString());
    switch (currentIndex) {
      case 0:
        buttonText = MyText.send;
        res = await sendMail(context);
        break;
      //return res;
      case 1:
        buttonText = MyText.log_in;
        res = await enterCode(context);

        //return res;
        break;
      case 2:
        Go.andRemove(context, Pager.app());
        buttonText = MyText.log_in;
        break;
      case 3:
        buttonText = MyText.log_in;
        Go.andRemove(context, Pager.app());
        break;
    }

    return res;
  }

  ////////values////////////////////////////////////////////////////////////////////
  ////////values////////////////////////////////////////////////////////////////////
  //phone
  final BehaviorSubject<String> phone = BehaviorSubject<String>();

  Stream<String> get phoneStream => phone.stream;

  updatePhone(String value) {
    if (value == null || value.isEmpty) {
      phone.value = '';
      phone.sink.addError(MyText.field_is_not_correct);
    } else {
      phone.sink.add(value);
    }
    //isUserInfoValid(registerType: _registerType);
  }

  bool get isPhoneIncorrect =>
      (!phone.hasValue || phone.value == null || phone.value.isEmpty);

  ///////uEmail
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

  ///////uCode
  final BehaviorSubject<String> otpCode = BehaviorSubject<String>();

  Stream<String> get codeStream => otpCode.stream;

  updateCode(String value) {
    if (value == null || value.isEmpty) {
      otpCode.value = '';
      otpCode.sink.addError(MyText.field_is_not_correct);
    } else {
      otpCode.sink.add(value);
    }
  }

  bool get isCodeIncorrect =>
      (!otpCode.hasValue || otpCode.value == null || otpCode.value.isEmpty);

  ///////uMainPass
  final BehaviorSubject<String> uPassMain = BehaviorSubject<String>();

  Stream<String> get passMainStream => uPassMain.stream;

  updateMainPass(String value) {
    if (value == null || value.isEmpty) {
      uPassMain.value = '';
      uPassMain.sink.addError(MyText.field_is_not_correct);
    } else {
      uPassMain.sink.add(value);
    }
  }

  bool get isMainPassCorrect => (!uPassMain.hasValue ||
      uPassMain.value == null ||
      uPassMain.value.isEmpty);

  ///////uSecondPass
  final BehaviorSubject<String> uPassSecond = BehaviorSubject<String>();

  Stream<String> get passSecondStream => uPassSecond.stream;

  updateSecondPass(String value) {
    if (value == null || value.isEmpty) {
      uPassSecond.value = '';
      uPassSecond.sink.addError(MyText.field_is_not_correct);
    } else {
      uPassSecond.sink.add(value);
    }
  }

  bool get isSecondPassCorrect => (!uPassSecond.hasValue ||
      uPassSecond.value == null ||
      uPassSecond.value.isEmpty ||
      uPassSecond.value != uPassMain.value);

  @override
  Future<void> close() {
    uEmail.close();
    otpCode.close();
    uPassSecond.close();
    uPassMain.close();
    return super.close();
  }

  int currentIndex = 0;

  List states = [
    ForgotPassEnterMail(),
    ForgotPassEnterCode(),
    ForgotPassChanged(),
    // ForgotPassNewPass(),
    // ForgotPassSuccess()
  ];
}
