import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:caspa_v2/infrastructure/cubits/sms_codes/sms_codes_state.dart';
import 'package:caspa_v2/infrastructure/data_source/contact_provider.dart';
import 'package:caspa_v2/infrastructure/models/local/local_sms.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/sms_code_model.dart';
import 'package:caspa_v2/util/constants/durations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util/enums/sms_types.dart';

class SmsCodesCubit extends Cubit<SmsCodesState> {
  SmsCodesCubit() : super(SmsCodesInitial());

  int a = 0;
  bool refresh = true;
  void fetch({bool loading = true, required SmsTypes smsType}) async {
    if (loading) {
      emit(SmsCodesInProgress());
    }
    try {
      final result = await ContactProvider.getSMSCodes(smsType: smsType);

      if (result != null) {
        emit(SmsCodesSuccess(result.data));
      } else {
        emit(SmsCodesError());
        eeee(
            "contact result bad: ${ResponseMessage.fromJson(jsonDecode(result.toString())).message}");
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(SmsCodesNetworkError());
    } catch (e) {
      eeee("contact cubit catch: $e".toString());
      emit(SmsCodesError(error: e.toString()));
    }
  }

  void start({required SmsTypes smsType}) {
    a++;
    if (refresh) {
      fetch(loading: a == 1, smsType: smsType);
      Timer(Durations.s5, () => start(smsType: smsType));
    }
  }

  @override
  Future<void> close() {
    // TODO: implement close
    refresh = false;
    return super.close();
  }
}
