import 'dart:io';

import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/cubits/shop/shop_state.dart';
import 'package:caspa_v2/infrastructure/data_source/general_provider.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopState> {
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
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(ShopNetworkError());
    } catch (e, s) {
      Recorder.recordCatchError(e, s, where: 'ShopCubit.fetch');
      emit(ShopError(error: e.toString()));
    }
  }
}
