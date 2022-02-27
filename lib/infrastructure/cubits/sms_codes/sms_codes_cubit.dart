import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:caspa_v2/infrastructure/cubits/sms_codes/sms_codes_state.dart';
import 'package:caspa_v2/infrastructure/data_source/contact_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/sms_code_model.dart';
import 'package:caspa_v2/util/constants/durations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmsCodesCubit extends Cubit<SmsCodesState> {
  SmsCodesCubit() : super(SmsCodesInitial());

  int a = 0;
  bool refresh = true;
  void fetch([bool loading = true]) async {
    if (loading) {
      emit(SmsCodesInProgress());
    }
    try {
      emit(SmsCodesSuccess([
        for (int i = 1; i < 100; i++)
          SmsCode(code: '11$i$a', time: '11:$i', id: i),
      ]));
      // final result = await ContactProvider.fetchContacts();
      // if (result != null) {
      //   bbbb("saalaml");
      //   emit(SmsCodesSuccess([
      //     for(int i=1;i<100;i++)
      //     SmsCode(code: '11$i',time: '11:$i',id: i),
      //   ]));
      // } else {
      //   emit(SmsCodesError());
      //   eeee(
      //       "contact result bad: ${ResponseMessage.fromJson(jsonDecode(result.toString())).message}");
      // }
    } on SocketException catch (_) {
      //network olacaq
      emit(SmsCodesNetworkError());
    } catch (e) {
      eeee("contact cubit catch: $e".toString());
      emit(SmsCodesError(error: e.toString()));
    }
  }

  void start() {
    bbbb("Sssss");
    a++;

    if (refresh) {
      fetch();
      Timer(Durations.s5, start);
    }
  }

  @override
  Future<void> close() {
    // TODO: implement close
    refresh = false;
    return super.close();
  }
}
