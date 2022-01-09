import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/contact_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(ContactInProgress());
    }
    try {
      final result = await ContactProvider.getContact();
      if (result != null) {
        emit(ContactSuccess(result));
      } else {
        emit(ContactError());
        eeee(
            "contact result bad: ${ResponseMessage.fromJson(jsonDecode(result.toString())).message}");
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(ContactNetworkError());
    } catch (e) {
      eeee("contact cubit catch: $e".toString());
      emit(ContactError(error: e.toString()));
    }
  }
}
