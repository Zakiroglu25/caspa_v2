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

class SmsCodesCubit extends Cubit<SmsCodesState> {
  SmsCodesCubit() : super(SmsCodesInitial());

  int a = 0;
  bool refresh = true;
  void fetch([bool loading = true]) async {
    if (loading) {
      emit(SmsCodesInProgress());
    }
    try {
      final result = await ContactProvider.getSMSCodes();

      List<LocalSms> localSmsList = [];

      List<SmsCode> smsList = result.data;
      List<String> dateList = [];
      Map<String, List<String>> smsMapList = {};
      for (SmsCode smsCode in smsList) {
        if (!dateList.contains(smsCode.date)) {
          dateList.add(smsCode.date!);
          localSmsList.add(LocalSms(date: smsCode.date));
        }
      }
      for (String date in dateList) {
        List<String> smsForDateList = [];
        List b = localSmsList.map((element) {
          if (element.date == date) {
            //  smsForDateList.add(element.code!);
            //  localSmsList.
            //element.smsList?.add(value);
            for (SmsCode smsCode in smsList) {
              if (smsCode.date == element.date) {
                element.smsList?.add(
                    LocalSmsElement(date: smsCode.date, sms: smsCode.code));
              }
            }
          }
          return localSmsList;
        }).toList();
        bbbb("hhhhhh: $b");
        smsMapList['$date'] = smsForDateList;
      }

      if (result != null) {
        // bbbb("saalaml");
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

  void start() {
    a++;
    if (refresh) {
      fetch(a == 1);
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
