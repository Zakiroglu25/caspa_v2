import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:caspa_v2/infrastructure/data_source/tarif_reopisotory.dart';
import 'package:caspa_v2/infrastructure/models/response/tarif_response_model.dart';
import 'package:equatable/equatable.dart';

part 'tarif_state.dart';

class TarifCubit extends Cubit<TarifState> {
  TarifCubit() : super(TarifInitial());

  Future<void> getTarif() async {
    final TarifRepository repo = TarifRepository();
    emit(TarifLoading());

    try {
      final PriceModel response = await repo.getPrice();
      if (response.data! ==null) {
        emit(TarifSuccess(response));
        print(response);
      } else {
        emit(TarifFailed("Data yoxdur"));
      }
    } catch (e) {
      emit(TarifFailed("Bilinməyən xəta baş verdi"));
    }
    log("3");

  }
}
