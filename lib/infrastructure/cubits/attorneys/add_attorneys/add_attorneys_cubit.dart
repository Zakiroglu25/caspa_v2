// Dart imports:
import 'dart:developer';
import 'dart:io';

// Flutter imports:
import 'package:caspa_v2/infrastructure/cubits/attorneys/add_attorneys/add_attorneys_state.dart';
import 'package:caspa_v2/infrastructure/data_source/add_attorneys_provider.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
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
    try {
      final result = await AddAttorneysProvider.addAttorneys(
        full_name: full_name_controller.text,
        father_name: father_name_controller.text,
        phone: phone_controller.text,
        id_ext: "AZ",
        id_number: id_number_controller.text,
        fin: fin_controller.text,
        birthday: birthday_controller.text,
        note: note_controller.text,
        accessToken: _prefs.accessToken,
      );
      print(full_name_controller.text.toString());
      print(father_name_controller.text.toString());
      print(phone_controller.text.toString());
      print(id_number_controller.text.toString());
      print(fin_controller.text.toString());
      print(birthday_controller.text.toString());
      print(note_controller.text.toString());
      print(_prefs.accessToken.toString());

      if (result!.data != null) {
        emit(AddAttorneysSuccess(result));
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
}
