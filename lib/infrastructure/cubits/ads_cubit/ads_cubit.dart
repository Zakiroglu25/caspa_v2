import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:caspa_v2/infrastructure/cubits/ads_cubit/ads_state.dart';
import 'package:caspa_v2/infrastructure/cubits/shop/shop_state.dart';
import 'package:caspa_v2/infrastructure/data_source/general_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit() : super(AdsInitial());

  void fetch([bool loading = true]) async {
    log("1");
    if (loading) {
      emit(AdsInProgress());
    }
    try {
      log("2");
      final result = await GeneralProvider.ads();
      log("3");
      try{
        if (isSuccess(result!.statusCode)) {
          emit(AdsSuccess(result.data));
        } else {
          emit(AdsError());
          eeee(
              "Ads: ${ResponseMessage.fromJson(jsonDecode(result.data)).message}");
        }
      }catch (e){
        print(e);
      }

    } on SocketException catch (_) {
      //network olacaq
      emit(AdsNetworkError());
    } catch (e) {
      eeee("shop cubit catch: $e");
      emit(AdsError(error: e.toString()));
    }
  }
}
