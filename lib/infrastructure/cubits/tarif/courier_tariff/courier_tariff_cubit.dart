import 'dart:io';

import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_state.dart';
import 'package:caspa_v2/infrastructure/data_source/public_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'courier_tariff_state.dart';

class CourierTarifCubit extends Cubit<CourierTarifState> {
  CourierTarifCubit() : super(CourierTarifInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(CourierTarifInProgress());
    }
    try {
      final result = await PublicProvider.getRegions();
      if (result.data != null) {
        emit(CourierTarifSuccess(result.data!));
      } else {
        emit(CourierTarifError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(CourierTarifError());
    } catch (e) {
      emit(CourierTarifError());
    }
  }
}
