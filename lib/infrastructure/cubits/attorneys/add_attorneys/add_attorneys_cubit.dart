// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:caspa_v2/infrastructure/cubits/attorneys/add_attorneys/add_attorneys_state.dart';
import 'package:caspa_v2/infrastructure/data_source/attorneys_provider.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../locator.dart';

class AddAttorneysCubit extends Cubit<AddAttorneysState> {
  AddAttorneysCubit() : super(AddAttorneysInitial()) {}

  PreferencesService get _prefs => locator<PreferencesService>();

  final full_name_controller = TextEditingController();
  final father_name_controller = TextEditingController();
  final phone_controller = TextEditingController();

  final id_number_controller = TextEditingController();
  final fin_controller = TextEditingController();
  final birthday_controller = TextEditingController();
  final note_controller = TextEditingController();

  void addAttorney() async {

    emit(AddAttorneysInProgress());
    try {
      final result = await AddAttorneysProvider.addAttorneys(
        full_name: full_name_controller.text,
        father_name: father_name_controller.text,
        phone: AppOperations.formatNumber(phone_controller.text,addZero: false),
        id_ext: serieType.valueOrNull,
        id_number: id_number_controller.text,
        fin: fin_controller.text,
        birthday: birthDate.valueOrNull,
        note: note_controller.text,
        accessToken: (await _prefs.accessToken),
      );
      print(full_name_controller.text.toString());
      print(father_name_controller.text.toString());
      print(phone_controller.text.toString());
      print(id_number_controller.text.toString());
      print(fin_controller.text.toString());
      print(birthday_controller.text.toString());
      print(note_controller.text.toString());
      print(_prefs.accessToken.toString());

      if (isSuccess(result!.statusCode)) {
        emit(AddAttorneysSuccess());
      } else {
        emit(AddAttorneysError(error: "error"));
      }
    } on SocketException catch (_) {
      emit(AddAttorneysError(error: 'network_error'));
    } catch (e) {
      print(e);
      emit(AddAttorneysError(error: ""));
    }
  }

  //serieType
  final BehaviorSubject<String> serieType =
  BehaviorSubject<String>.seeded(MyText.aze);

  Stream<String> get serieTypeStream => serieType.stream;

  updatepriceType(String value) {
    if (value == null || value.isEmpty) {
      serieType.value = '';
      serieType.sink.addError(MyText.field_is_not_correct);
    } else {
      serieType.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isSerieTypeIncorrect => (!serieType.hasValue ||
      serieType.value == null ||
      serieType.value.isEmpty);

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
    //isUserInfoValid(registerType: _registerType);
  }

  bool get isBirthDateIncorrect => (!birthDate.hasValue ||
      birthDate.value == null ||
      birthDate.value.isEmpty);
  ///delete ishlemedi
  //
  // Future<bool> deleteAttorney({int? id}) async {
  //   try {
  //     final result = await AddAttorneysProvider.deleteAttorney(
  //         id: id, accessToken: _prefs.accessToken.toString());
  //     if (result!.data != null) {
  //       FullScreenAlert.of(ctx!).hideAlert();
  //       return true;
  //     } else {
  //       // FullScreenAlert.of(ctx).hideAlert();
  //       emit(AddAttorneysError(error: ''));
  //     }
  //     //FullScreenAlert.of(ctx).hideAlert();
  //     //  return false;
  //   } catch (e) {
  //     eeee("deleteAttorney: $e");
  //   }
  //   FullScreenAlert.of(ctx!).hideAlert();
  //   return false;
  // }



}
