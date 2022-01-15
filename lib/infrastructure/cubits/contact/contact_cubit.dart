import 'dart:developer';
import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/contact_provider.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(ContactInProgress());
    }
    try {
      final result = await ContactProvider.fetchContacts();
      if (isSuccess(result.statusCode)) {
        emit(ContactSuccess(result.data));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(ContactNetworkError());
    } catch (e) {
      eeee("contact cubit catch: $e");
      emit(ContactError(error: e.toString()));
    }
  }
}
