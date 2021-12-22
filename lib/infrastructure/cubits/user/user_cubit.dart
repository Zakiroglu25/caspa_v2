import 'package:bloc/bloc.dart';
import 'package:caspa_v2/infrastructure/data_source/auth_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/requset/register_request_model.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/validators/validator.dart';
import 'package:rxdart/rxdart.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());


// void registerBusiness(RegisterRequestModel body) async {
//     emit(RegisterLoading());
//     try {
//       final response = await AuthProvider.registrationBusiness(name: name, surname: surname, address: address, email: email, password: password, password_confirmation: password_confirmation, phone: phone, accept: accept, company_name: company_name, tax_number: tax_number);
//       if (response.message == null) {
//         emit(RegisterSuccess(response.message!));
//       } else {
//         emit(RegisterFailed(response.message!));
//       }
//     } on DioError catch (e) {
//       print(e.response!.data.toString());
//       emit(RegisterFailed(e.response!.data.toString()));
//     } catch (e, s) {
//       emit(RegisterFailed("Errorlari doshuyecem"));
//     }
//   }

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
    isUserInfoValid();
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
      uName.sink.addError("field_is_not_correct");
    } else {
      uName.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isNameIncorrect =>
      (!uName.hasValue || uName.value == null || uName.value.isEmpty);

  //surname
  final BehaviorSubject<String> surName = BehaviorSubject<String>();

  Stream<String> get surnameStream => surName.stream;

  updateSurName(String value) {
    if (value == null || value.isEmpty) {
      surName.value = '';
      surName.sink.addError("field_is_not_correct");
    } else {
      surName.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isSurNameIncorrect =>
      (!surName.hasValue || surName.value == null || surName.value.isEmpty);

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
      uPassMain.sink.addError("fill_correctly");
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
      uPassSecond.sink.addError("fill_correctly");
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

  //gender
  final BehaviorSubject<String> gender = BehaviorSubject<String>();

  Stream<String> get genderStream => gender.stream;

  updateGender(String value) {
    if (value == null || value.isEmpty) {
      gender.value = '';
      gender.sink.addError("field_is_not_correct");
    } else {
      gender.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isGenderIncorrect =>
      (!gender.hasValue || gender.value == null || gender.value.isEmpty);

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

    if (!isNameIncorrect &&
        !isGenderIncorrect &&
        !isSurNameIncorrect &&
        !isBirthDateIncorrect &&
        !isFinIncorrect &&
        !isIdNumberIncorrect &&
        !isMainPassInCorrect &&
        //!isAnbarIncorrect &&
        !isSecondPassInCorrect &&
        // !isBirtdayIncorrect &&
        !isGenderIncorrect &&
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
}
