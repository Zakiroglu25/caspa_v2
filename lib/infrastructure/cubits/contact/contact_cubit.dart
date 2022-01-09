import 'dart:developer';
import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/contact_provider.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  void fetch([bool loading = true]) async {
    log("1");
    if (loading) {
      emit(ContactInProgress());
    }
    try {
      log("2");
      final result = await ContactProvider.getContact();
        log("3");
        if(result != null){
        emit(ContactSuccess(result));
        }
        log("5"+result.toString());
        emit(ContactError());
        // eeee(
        //     "login result bad: ${ResponseMessage.fromJson(jsonDecode(result)).message}");

    } on SocketException catch (_) {
      //network olacaq
      emit(ContactNetworkError());
    } catch (e) {
      eeee("contact cubit catch: $e");
      emit(ContactError(error: e.toString()));
    }
  }
}
