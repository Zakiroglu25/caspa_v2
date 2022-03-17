import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:caspa_v2/infrastructure/data_source/account_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/auth_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/requset/register_request_model.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/delegate/user_operations.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/util/validators/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

import '../../../locator.dart';
import '../../../util/screen/alert.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  HiveService get _prefs => locator<HiveService>();

  void checkAndPickImage(BuildContext context) async {
    try {
      var galleryAccessStatus = await Permission.photos.status;
      var cameraAccessStatus = await Permission.camera.status;
      await Permission.photos.request();
      await Permission.camera.request();
      if (galleryAccessStatus != PermissionStatus.granted ||
          cameraAccessStatus != PermissionStatus.granted) {
        var statusPhotos = await Permission.photos.request();
        var statusCamera = await Permission.camera.request();
        // var status = await Permission.photos.request();
        if (statusPhotos != PermissionStatus.granted) {
          await showGalleryAccessAlert(context);
        } else {
          updateImage(await AppOperations.pickPhotoFromGallery());
          editAvatar(context);
        }
      } else {
        updateImage(await AppOperations.pickPhotoFromGallery());
        editAvatar(context);
      }
    } on PlatformException catch (e) {
      eeee("error: " + e.toString());
      await showGalleryAccessAlert(context);
    } catch (e) {
      eeee("error: " + e.toString());
      Snack.display(context: context, message: e.toString());
    }
  }

  void checkAndTake(BuildContext context) async {
    try {
      var cameraAccessStatus = await Permission.camera.status;

      await Permission.camera.request();
      if (cameraAccessStatus != PermissionStatus.granted) {
        var statusCamera = await Permission.camera.request();
        // var status = await Permission.photos.request();

        if (statusCamera != PermissionStatus.granted) {
          await showGalleryAccessAlert(context);
        } else {
          updateImage(await AppOperations.pickPhotoFromGallery(
              imageSource: ImageSource.camera));
          editAvatar(context);
        }
      } else {
        updateImage(await AppOperations.pickPhotoFromGallery(
            imageSource: ImageSource.camera));
        editAvatar(context);
      }
    } on PlatformException catch (e) {
      eeee("error: " + e.toString());
      await showGalleryAccessAlert(context);
    } catch (e) {
      eeee("error: " + e.toString());
      Snack.display(context: context, message: e.toString());
    }
  }

  Future<void> showGalleryAccessAlert(BuildContext context) async {
    Alert.show(context,
        title: MyText.we_need_access_to_gallery,
        content: MyText.we_will_redirect_to_settings,
        buttonText: MyText.goOn,
        onTap: () async => await openAppSettings());
  }

  void update(BuildContext context, {bool? isLoading = true}) async {
    if (isLoading!) {
      emit(UserLoading());
    }
    try {
      final response = await AccountProvider.updateUserInfo(
          token: _prefs.accessToken,
          email: uEmail.valueOrNull,
          password: uPassMain.valueOrNull,
          password_confirmation: uPassSecond.valueOrNull,
          birthday: birthDate.valueOrNull,
          id_number: idNumber.valueOrNull,
          fin: fin.valueOrNull,
          ware_house: 1,
          address: adress.valueOrNull,
          phone: phone.valueOrNull,
          company_name: company_name.valueOrNull,
          tax_number: tax_number.valueOrNull,
          language: _prefs.language,
          old_password: old_password.valueOrNull);

      if (isSuccess(response!.statusCode)) {
        await UserOperations.configUserDataWhenOpenApp(
          // fcmToken: _prefs.fcmToken,
          accessToken: _prefs.accessToken!, fcm: _prefs.fcmToken,
          //  path: _prefs.userPath
        );
        Snack.positive(context: context, message: MyText.operationIsSuccess);
        emit(UserSuccess(response.data!));
      } else {
        Snack.display(context: context, message: MyText.error);
        emit(UserFailed(response.statusCode.toString()));
      }
    } catch (e, s) {
      emit(UserFailed("Errorlari doshuyecem"));
    }
  }

  void editAvatar(BuildContext context, {bool? isLoading = true}) async {
    if (isLoading!) {
      emit(UserLoading());
    }
    try {
      if (isPhotoValid()) {
        final response = await AccountProvider.report(
          invoice: image.valueOrNull,
        );

        if (isSuccess(response!.statusCode)) {
          await UserOperations.configUserDataWhenOpenApp(
            fcm: _prefs.fcmToken,
            accessToken: _prefs.accessToken!,
            // path: _prefs.userPath
          );
          Snack.positive(context: context, message: MyText.operationIsSuccess);
          emit(UserSuccess(response.data!));
        } else {
          Snack.display(context: context, message: MyText.error);
          emit(UserFailed(response.statusCode.toString()));
        }
      } else {
        emit(UserFailed(MyText.error));
      }
    } catch (e, s) {
      emit(UserFailed("Errorlari doshuyecem"));
    }
  }

  //////VALUES///////////VALUES//////////VALUES/////////////VALUES///////////////////

  //old_password
  final BehaviorSubject<String> old_password = BehaviorSubject<String>();

  Stream<String> get old_passwordStream => old_password.stream;

  updateOldPassword(String value) {
    if (value == null || value.isEmpty) {
      old_password.value = '';
      old_password.sink.addError(MyText.field_is_not_correct);
    } else {
      old_password.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isOldPasswordIncorrect => (!old_password.hasValue ||
      old_password.value == null ||
      old_password.value.isEmpty);
  //email
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
    isUserInfoValid();
  }

  bool get isEmailIncorrect => (!uEmail.hasValue ||
      uEmail.value == null ||
      uEmail.value.isEmpty ||
      !emailValid);

//company_name
  final BehaviorSubject<String> company_name = BehaviorSubject<String>();

  Stream<String> get companyNameStream => company_name.stream;

  updateCompanyName(String value) {
    if (value == null || value.isEmpty) {
      company_name.value = '';
      company_name.sink.addError(MyText.field_is_not_correct);
    } else {
      company_name.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get iscompany_nameIncorrect => (!company_name.hasValue ||
      company_name.value == null ||
      company_name.value.isEmpty);

//tax_number
  final BehaviorSubject<String> tax_number = BehaviorSubject<String>();

  Stream<String> get tax_numberStream => tax_number.stream;

  updateTaxNumber(String value) {
    if (value == null || value.isEmpty) {
      tax_number.value = '';
      tax_number.sink.addError(MyText.field_is_not_correct);
    } else {
      tax_number.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get istax_numberIncorrect => (!tax_number.hasValue ||
      tax_number.value == null ||
      tax_number.value.isEmpty);

  //phone
  final BehaviorSubject<String> phone = BehaviorSubject<String>();

  Stream<String> get phoneStream => phone.stream;

  updatePhone(String value) {
    if (value == null || value.isEmpty) {
      phone.value = '';
      phone.sink.addError("field_is_not_correct");
    } else {
      phone.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isPhoneIncorrect =>
      (!phone.hasValue || phone.value == null || phone.value.isEmpty);

  //adress
  final BehaviorSubject<String> adress = BehaviorSubject<String>();

  Stream<String> get adressStream => adress.stream;

  updateAdress(String value) {
    if (value == null || value.isEmpty) {
      adress.value = '';
      adress.sink.addError("field_is_not_correct");
    } else if (value.length < 10) {
      adress.sink.addError(MyText.adress_minumum_10);
    } else {
      adress.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isAdressIncorrect =>
      (!adress.hasValue || adress.value == null || adress.value.isEmpty);

  //anbar
  final BehaviorSubject<String> anbar = BehaviorSubject<String>();

  Stream<String> get anbarStream => anbar.stream;

  updateAnbar(String value) {
    if (value == null || value.isEmpty) {
      anbar.value = '';
      anbar.sink.addError("field_is_not_correct");
    } else {
      anbar.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isAnbarIncorrect =>
      (!anbar.hasValue || anbar.value == null || anbar.value.isEmpty);

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
    isUserInfoValid();
    if (uPassSecond.hasValue && value != uPassSecond.value) {
      uPassSecond.sink.addError(MyText.every_past_must_be_same);
    } else
      uPassSecond.sink.add(uPassSecond.value);
  }

  bool get isMainPassInCorrect => (!uPassMain.hasValue ||
      uPassMain.value == null ||
      uPassMain.value.isEmpty);

  ///////uSecondPass
  final BehaviorSubject<String> uPassSecond = BehaviorSubject<String>();

  Stream<String> get passSecondStream => uPassSecond.stream;

  updateSecondPass(String value) {
    if (value == null || value.isEmpty) {
      uPassSecond.value = '';
      uPassSecond.sink.addError(MyText.field_is_not_correct);
    } else if (value != uPassMain.value) {
      uPassSecond.sink.addError(MyText.every_past_must_be_same);
    } else {
      uPassSecond.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isSecondPassInCorrect => (!uPassSecond.hasValue ||
      uPassSecond.value == null ||
      uPassSecond.value.isEmpty ||
      uPassSecond.value != uPassMain.value);

  //fin
  final BehaviorSubject<String> fin = BehaviorSubject<String>();

  Stream<String> get finStream => fin.stream;

  updateFin(String value) {
    if (value == null || value.isEmpty) {
      fin.value = '';
      fin.sink.addError("field_is_not_correct");
    } else {
      fin.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isFinIncorrect =>
      (!fin.hasValue || fin.value == null || fin.value.isEmpty);

  //idNumber
  final BehaviorSubject<String> idNumber = BehaviorSubject<String>();

  Stream<String> get idNumberStream => idNumber.stream;

  updateIdNumber(String value) {
    if (value == null || value.isEmpty) {
      idNumber.value = '';
      idNumber.sink.addError("field_is_not_correct");
    } else {
      idNumber.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isIdNumberIncorrect =>
      (!idNumber.hasValue || idNumber.value == null || idNumber.value.isEmpty);

  //birthDate
  final BehaviorSubject<String> birthDate = BehaviorSubject<String>();

  Stream<String> get birthDateStream => birthDate.stream;

  updateBirthDate(String value) {
    if (value == null || value.isEmpty) {
      birthDate.value = '';
      birthDate.sink.addError("field_is_not_correct");
    } else {
      birthDate.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isBirthDateIncorrect => (!birthDate.hasValue ||
      birthDate.value == null ||
      birthDate.value.isEmpty);

  //photo
  final BehaviorSubject<File?> image = BehaviorSubject<File>();

  Stream<File?> get imageStream => image.stream;

  updateImage(File? value) {
    if (value == null || value.path == null) {
      image.sink.addError(MyText.field_is_not_correct);
    } else {
      image.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isImageIncorrect => (!image.hasValue || image.value == null);

  @override
  Future<void> close() {
    uEmail.close();
    old_password.close();
    tax_number.close();
    birthDate.close();
    company_name.close();
    idNumber.close();
    fin.close();
    uPassSecond.close();
    uPassMain.close();
    adress.close();
    image.close();
    anbar.close();
    phone.close();
    return super.close();
  }

  bool isUserInfoValid() {
    // bbbb("---- isNameIncorrect:  $isNameIncorrect");
    // bbbb("---- isGenderIncorrect:  $isGenderIncorrect");
    // bbbb("---- isBirthDateIncorrect:  $isBirthDateIncorrect");
    // bbbb("---- isFinIncorrect:  $isFinIncorrect");
    // bbbb("---- isIdNumberIncorrect:  $isIdNumberIncorrect");
    // bbbb("---- isMainPassCorrect:  $isMainPassInCorrect");
    // bbbb("---- isSecondPassCorrect:  $isSecondPassInCorrect");
    // bbbb("---- isGenderIncorrect:  $isGenderIncorrect");
    // bbbb("---- isEmailIncorrect:  $isEmailIncorrect");
    // bbbb("---- isEmailIncorrect:  $isEmailIncorrect");
    // bbbb("---- isPhoneIncorrect:  $isPhoneIncorrect");

    if (!iscompany_nameIncorrect &&
        !istax_numberIncorrect &&
        !isOldPasswordIncorrect &&
        !isBirthDateIncorrect &&
        !isFinIncorrect &&
        !isIdNumberIncorrect &&
        !isMainPassInCorrect &&
        //!isAnbarIncorrect &&
        !isSecondPassInCorrect &&
        // !isBirtdayIncorrect &&

        !isEmailIncorrect &&
        !isPhoneIncorrect) {
      emit(UserButtonActive());

      //bbbb("---- true");
      return true;
    } else {
      //bbbb("---- false");
      return false;
    }
  }

  bool isPhotoValid() {
    if (!isImageIncorrect) {
      //emit(UserButtonActive());
      //bbbb("---- true");
      return true;
    } else {
      //bbbb("---- false");
      return false;
    }
  }
}
