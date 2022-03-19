// Dart imports:
import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/attorneys_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../locator.dart';
import '../../../util/formatter/masked_text_controller_phone.dart';
import 'add_attorneys_state.dart';

class AddAttorneysCubit extends Cubit<AddAttorneysState> {
  AddAttorneysCubit() : super(AddAttorneysInitial()) {}

  HiveService get _prefs => locator<HiveService>();

  final full_name_controller = TextEditingController();
  final father_name_controller = TextEditingController();
  final phone_controller = MaskedTextController.app();
  final id_number_controller = TextEditingController();
  final fin_controller = TextEditingController();
  final note_controller = TextEditingController();

  void addAttorney() async {
    emit(AddAttorneysInProgress());
    try {
      final result = await AttorneyProvider.addAttorneys(
        full_name: full_name_controller.text,
        father_name: father_name_controller.text,
        phone: AppOperations.formatNumber(
          phone_controller.text,
          addZero: false,
        ),
        id_ext: serieType.valueOrNull,
        id_number: id_number_controller.text,
        fin: fin_controller.text,
        birthday: birthDate.valueOrNull,
        note: note_controller.text,
        accessToken: (_prefs.accessToken),
      );

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

  void editAttorney(Attorney attorney) async {
    emit(AddAttorneysInProgress());
    try {
      final result = await AttorneyProvider.editAttorneys(
        id: attorney.id,
        full_name: full_name_controller.text,
        father_name: father_name_controller.text,
        phone:
            AppOperations.formatNumber(phone_controller.text, addZero: false),
        id_ext: serieType.valueOrNull,
        id_number: id_number_controller.text,
        fin: fin_controller.text,
        birthday: birthDate.valueOrNull,
        note: note_controller.text,
        accessToken: (await _prefs.accessToken),
      );

      if (isSuccess(result!.statusCode)) {
        emit(AddAttorneysEdited());
      } else {
        emit(AddAttorneysError(error: MyText.error));
      }
    } on SocketException catch (_) {
      emit(AddAttorneysError(error: 'network_error'));
    } catch (e) {
      print(e);
      emit(AddAttorneysError(error: MyText.error + ": $e"));
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

  @override
  close() {
    // TODO: implement close
    birthDate.close();
    serieType.close();
    full_name_controller.dispose();
    father_name_controller.dispose();
    phone_controller.dispose();
    id_number_controller.dispose();
    fin_controller.dispose();
    note_controller.dispose();
    return super.close();
  }
}
