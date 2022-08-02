import 'package:bloc/bloc.dart';
import 'package:caspa_v2/infrastructure/data_source/auth_provider.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/util/delegate/user_operations.dart';
import 'package:caspa_v2/util/enums/register_type.dart';
import 'package:caspa_v2/util/validators/validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import '../../../locator.dart';
import '../../models/remote/response/wares.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  FirebaseMessaging get _firebaseMessaging => locator<FirebaseMessaging>();
  List<Data> permanentWares = [];

  HiveService get _prefs => locator<HiveService>();
  RegisterType _registerType = RegisterType.personal;

  //bool registerActive = false;

  // set registerType(RegisterType value) {
  //   _registerType = value;
  //   isUserInfoValid(registerType: _registerType);
  // }
  set updateRegisterType(int index) {
    if (index == 0) {
      _registerType = RegisterType.personal;
    } else {
      _registerType = RegisterType.company;
    }
    isUserInfoValid(registerType: _registerType);
  }

  void register(BuildContext context) {
    if (_registerType == RegisterType.personal) {
      registerPersonal(context);
    } else
      registerCompany(context);
  }

  void registerPersonal(BuildContext context) async {
    emit(RegisterLoading());
    //emit(RegisterFailed(message:" errors.first"));
    try {
      final deviceCode = await _firebaseMessaging.getToken();

      final response = await AuthProvider.registrationPersonal(
          name: uName.valueOrNull,
          surname: surName.valueOrNull,
          address: adress.valueOrNull,
          email: uEmail.valueOrNull,
          password: uPassMain.value,
          password_confirmation: uPassSecond.value,
          phone: phone.valueOrNull,
          accept: 1,
          birthday: birthDate.valueOrNull,
          fin: fin.value,
          id_number: idNumber.value,
          gender: gender.valueOrNull,
          deviceCode: deviceCode,
          deviceTypeId: StringOperations.platformId(),
          language: _prefs.language,
          ware_house: selectedWares.valueOrNull!.id);

      bbbb("register bloc result: " + response.toString());

      if (isSuccess(response?.statusCode)) {
        await UserOperations.configureUserDataWhenLogin(
            accessToken: response?.data,
            fcmToken: deviceCode!,
            path: uPassMain.valueOrNull);
        Go.andRemove(context, Pager.app(showSplash: true));
        emit(RegisterSuccess(''));
      } else {
        List<String> errors = response?.data;
        emit(RegisterFailed(message: errors[0]));
      }
    } catch (e, s) {
      print("register cubit -> registrationPersonal ->catch : $e=> $s");
      emit(RegisterFailed(message: e.toString()));
    }
  }

  void registerCompany(BuildContext context) async {
    emit(RegisterLoading());
    //emit(RegisterFailed(message:" errors.first"));
    try {
      final deviceCode = await _firebaseMessaging.getToken();

      final response = await AuthProvider.registrationCompany(
        name: uName.valueOrNull,
        surname: surName.valueOrNull,
        address: adress.valueOrNull,
        email: uEmail.valueOrNull,
        password: uPassMain.valueOrNull,
        password_confirmation: uPassSecond.valueOrNull,
        phone: phone.valueOrNull,
        accept: 1,
        deviceCode: deviceCode,
        deviceTypeId: StringOperations.platformId(),
        language: _prefs.language,
        tax_number: taxNumber.valueOrNull,
        company_name: companyName.valueOrNull,
      );

      bbbb("registerCompany bloc result: " + response.toString());

      if (isSuccess(response?.statusCode)) {
        await UserOperations.configureUserDataWhenLogin(
            accessToken: response?.data,
            fcmToken: deviceCode!,
            path: uPassMain.valueOrNull);
        Go.andRemove(context, Pager.app(showSplash: true));
        emit(RegisterSuccess(''));
      } else {
        List<String> errors = response?.data;
        emit(RegisterError(message: errors[0]));
      }
    } catch (e, s) {
      eeee("register cubit -> registerCompany ->catch : " + e.toString());
      emit(RegisterError(message: e.toString()));
    }
  }

  //////VALUES///////////VALUES//////////VALUES/////////////VALUES///////////////////

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
    isUserInfoValid(registerType: _registerType);
  }

  bool get isEmailIncorrect => (!uEmail.hasValue ||
      uEmail.value == null ||
      uEmail.value.isEmpty ||
      !emailValid);

  //name
  final BehaviorSubject<String> uName = BehaviorSubject<String>();

  Stream<String> get nameStream => uName.stream;

  updateName(String value) {
    if (value == null || value.isEmpty) {
      uName.value = '';
      uName.sink.addError(MyText.field_is_not_correct);
    } else {
      uName.sink.add(value);
    }
    isUserInfoValid(registerType: _registerType);
  }

  bool get isNameIncorrect =>
      (!uName.hasValue || uName.value == null || uName.value.isEmpty);

  //surname
  final BehaviorSubject<String> surName = BehaviorSubject<String>();

  Stream<String> get surnameStream => surName.stream;

  updateSurName(String value) {
    if (value == null || value.isEmpty) {
      surName.value = '';
      surName.sink.addError(MyText.field_is_not_correct);
    } else {
      surName.sink.add(value);
    }
    isUserInfoValid(registerType: _registerType);
  }

  bool get isSurNameIncorrect =>
      (!surName.hasValue || surName.value == null || surName.value.isEmpty);

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
    isUserInfoValid(registerType: _registerType);
  }

  bool get isPhoneIncorrect =>
      (!phone.hasValue || phone.value == null || phone.value.isEmpty);

  //adress
  final BehaviorSubject<String> adress = BehaviorSubject<String>();

  Stream<String> get adressStream => adress.stream;

  updateAdress(String value) {
    if (value == null || value.isEmpty) {
      adress.value = '';
      adress.sink.addError(MyText.field_is_not_correct);
    } else if (value.length < 10) {
      adress.sink.addError(MyText.adress_minumum_10);
    } else {
      adress.sink.add(value);
    }
    isUserInfoValid(registerType: _registerType);
  }

  bool get isAdressIncorrect =>
      (!adress.hasValue || adress.value == null || adress.value.isEmpty);

  //companyName
  final BehaviorSubject<String> companyName = BehaviorSubject<String>();

  Stream<String> get companyStream => companyName.stream;

  updateCompany(String value) {
    if (value == null || value.isEmpty) {
      companyName.value = '';
      companyName.sink.addError(MyText.field_is_not_correct);
    } else {
      companyName.sink.add(value);
    }
    isUserInfoValid(registerType: _registerType);
  }

  bool get isCompanyNameIncorrect => (!companyName.hasValue ||
      companyName.value == null ||
      companyName.value.isEmpty);

  //tax_number
  final BehaviorSubject<String> taxNumber = BehaviorSubject<String>();

  Stream<String> get taxStream => taxNumber.stream;

  updateTaxNumber(String value) {
    if (value == null || value.isEmpty) {
      taxNumber.value = '';
      taxNumber.sink.addError(MyText.field_is_not_correct);
    } else {
      taxNumber.sink.add(value);
    }
    isUserInfoValid(registerType: _registerType);
  }

  bool get isTaxNumberIncorrect => (!taxNumber.hasValue ||
      taxNumber.value == null ||
      taxNumber.value.isEmpty);

  //anbar
  final BehaviorSubject<String> anbar = BehaviorSubject<String>();

  Stream<String> get anbarStream => anbar.stream;

  updateAnbar(String value) {
    if (value == null || value.isEmpty) {
      anbar.value = '';
      anbar.sink.addError(MyText.field_is_not_correct);
    } else {
      anbar.sink.add(value);
    }
    isUserInfoValid(registerType: _registerType);
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
    isUserInfoValid(registerType: _registerType);
    if (uPassSecond.hasValue) {
      if (value != uPassSecond.value) {
        uPassSecond.sink.addError(MyText.every_past_must_be_same);
      } else {
        uPassSecond.sink.add(uPassSecond.value);
      }
    }
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
    } else {
      if (uPassMain.hasValue && value != uPassMain.value) {
        uPassSecond.sink.addError(MyText.every_past_must_be_same);
      }
      uPassSecond.sink.add(value);
    }
    isUserInfoValid(registerType: _registerType);
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
      fin.sink.addError(MyText.field_is_not_correct);
    } else {
      fin.sink.add(value);
    }
    isUserInfoValid(registerType: _registerType);
  }

  bool get isFinIncorrect =>
      (!fin.hasValue || fin.value == null || fin.value.isEmpty);

  //idNumber
  final BehaviorSubject<String> idNumber = BehaviorSubject<String>();

  Stream<String> get idNumberStream => idNumber.stream;

  updateIdNumber(String value) {
    if (value == null || value.isEmpty) {
      idNumber.value = '';
      idNumber.sink.addError(MyText.field_is_not_correct);
    } else {
      idNumber.sink.add(value);
    }
    isUserInfoValid(registerType: _registerType);
  }

  bool get isIdNumberIncorrect => (!idNumber.hasValue ||
          idNumber.value == null ||
          idNumber.value.isEmpty ||
          idNumber.value.length < 5
      //|| !AppOperations.idCardSeriesControl(idNumber.value)
      );

  //checkbox
  final BehaviorSubject<bool> checkbox = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get checkBoxStream => checkbox.stream;

  updateCheckBox(bool value) {
    // if (value) {
    //   checkbox.value = false;
    //   checkbox.sink.addError(MyText.field_is_not_correct);
    // } else {
    checkbox.sink.add(value);
    //}
    isUserInfoValid(registerType: _registerType);
  }

  bool get isCheckBoxIncorrect =>
      (!checkbox.hasValue || checkbox.value == null || checkbox.value == false);

  //gender
  final BehaviorSubject<String> gender = BehaviorSubject<String>();

  Stream<String> get genderStream => gender.stream;

  updateGender(String? value) {
    if (value == null || value.isEmpty) {
      gender.value = '';
      gender.sink.addError(MyText.field_is_not_correct);
    } else {
      gender.sink.add(value);
    }
    isUserInfoValid(registerType: _registerType);
  }

  bool get isGenderIncorrect =>
      (!gender.hasValue || gender.value == null || gender.value.isEmpty);

  //birthDate
  final BehaviorSubject<String> birthDate = BehaviorSubject<String>();

  Stream<String> get birthDateStream => birthDate.stream;

  updateBirthDate(String value) {
    if (value == null || value.isEmpty) {
      birthDate.value = '';
      //  birthDate.sink.addError(MyText.field_is_not_correct);
    } else {
      birthDate.sink.add(value);
    }
    isUserInfoValid(registerType: _registerType);
  }

  bool get isBirthDateIncorrect => (!birthDate.hasValue ||
      birthDate.value == null ||
      birthDate.value.isEmpty);

  //birthDate
  final BehaviorSubject<bool> registerActive =
      BehaviorSubject<bool>.seeded(false);

  Stream<bool> get registerActiveeStream => registerActive.stream;

  updateRegisterActivee(bool value) {
    registerActive.sink.add(value);
  }

  ///selectedWares
  final BehaviorSubject<Data?> selectedWares = BehaviorSubject<Data>();

  Stream<Data?> get selectedWaresStream => selectedWares.stream;

  updateWares(Data value) {
    if (value == null) {
      selectedWares.value = null;
      //taxNumber.sink.addError(MyText.field_is_not_correct);
    } else {
      if (selectedWares.valueOrNull?.id != value.id) {
        selectedWares.sink.add(value);
      }
    }

    //isUserInfoValid(registerType: _registerType);
  }

  ///selectedWares

  ///wares list
  final BehaviorSubject<List<Data>> wares =
      BehaviorSubject<List<Data>>.seeded([]);

  Stream<List<Data>> get waresListStream => wares.stream;

  ///wares list

  ///update wares list
  updateWaresList(List<Data> value) {
    permanentWares = value;
    wares.sink.add(permanentWares);
  }

  ///update wares list

  @override
  Future<void> close() {
    uEmail.close();
    uName.close();
    surName.close();
    birthDate.close();
    gender.close();
    idNumber.close();
    fin.close();
    uPassSecond.close();
    uPassMain.close();
    adress.close();
    checkbox.close();
    anbar.close();
    registerActive.close();
    phone.close();
    return super.close();
  }

  //eslinde asagidaki regidster type funksiyada gondermeye ehtiyac yoxdu
  bool isUserInfoValid({required RegisterType registerType}) {
    //bbbb("---- isNameIncorrect:  $isNameIncorrect");
    // bbbb("---- isGenderIncorrect:  $isGenderIncorrect");
    // bbbb("---- isBirthDateIncorrect:  $isBirthDateIncorrect");
    // bbbb("---- isFinIncorrect:  $isFinIncorrect");
    // bbbb("---- isIdNumberIncorrect:  $isIdNumberIncorrect");
    // bbbb("---- isMainPassCorrect:  $isMainPassInCorrect");
    // bbbb("---- isSecondPassCorrect:  $isSecondPassInCorrect");
    // bbbb("---- isEmailIncorrect:  $isEmailIncorrect");
    // bbbb("---- isEmailIncorrect:  $isEmailIncorrect");
    // bbbb("---- isPhoneIncorrect:  $isPhoneIncorrect");
    // bbbb("---- isCheckBoxIncorrect:  $isCheckBoxIncorrect");

    if (_registerType == RegisterType.personal) {
      if (!isNameIncorrect &&
          // !isGenderIncorrect &&
          !isSurNameIncorrect &&
          // !isBirthDateIncorrect &&
          !isFinIncorrect &&
          !isIdNumberIncorrect &&
          !isMainPassInCorrect &&
          !isCheckBoxIncorrect &&
          //!isAnbarIncorrect &&
          !isSecondPassInCorrect &&
          // !isBirtdayIncorrect &&
          //  !isGenderIncorrect &&
          !isEmailIncorrect &&
          !isPhoneIncorrect) {
        //  emit(RegisterButtonActive());
        updateRegisterActivee(true);
        //   bbbb("---- true 4");
        return true;
      } else {
        updateRegisterActivee(false);
        //bbbb("---- false 3");
        return false;
      }
    } else {
      if (!isNameIncorrect &&
          // !isGenderIncorrect &&
          !isSurNameIncorrect &&
          // !isBirthDateIncorrect &&
          //!isFinIncorrect &&
          // !isIdNumberIncorrect &&
          !isMainPassInCorrect &&
          //!isAnbarIncorrect &&
          !isSecondPassInCorrect &&
          !isCheckBoxIncorrect &&
          // !isBirtdayIncorrect &&
          //  !isGenderIncorrect &&
          !isEmailIncorrect &&
          !isTaxNumberIncorrect &&
          !isCompanyNameIncorrect &&
          !isPhoneIncorrect) {
        // emit(RegisterButtonActive());
        updateRegisterActivee(true);
        //bbbb("---- true 1");
        return true;
      } else {
        updateRegisterActivee(false);
        //bbbb("---- false 2");
        return false;
      }
    }
  }
}
