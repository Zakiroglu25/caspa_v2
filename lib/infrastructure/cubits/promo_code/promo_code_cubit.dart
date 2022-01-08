import 'dart:convert';
import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/general_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'promo_code_state.dart';



class ShopCubit extends Cubit<PromoCodeState> {
  ShopCubit() : super(ShopInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(ShopInProgress());
    }
    try {
      final result = await GeneralProvider.fetchShops();

      if (isSuccess(result?.statusCode)) {
        emit(ShopSuccess(result?.data));
      } else {
        emit(ShopError());
        eeee(
            "login result bad: ${ResponseMessage.fromJson(jsonDecode(result!.data)).message}");
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(ShopNetworkError());
    } catch (e) {
      eeee("shop cubit catch: $e");
      emit(ShopError(error: e.toString()));
    }
  }
}
