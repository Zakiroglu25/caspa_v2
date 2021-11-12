import 'dart:io';

import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_state.dart';
import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TarifCubit extends Cubit<TarifState> {
  TarifCubit() : super(TarifInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(TarifInProgress());
    }
    try {
      final result = await TarifProvider.getTarif();
      if (result.data != null) {
        emit(TarifSuccess(result));
      } else {
        emit(TarifError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(TarifError());
    } catch (e) {
      emit(TarifError());
    }
  }
}
