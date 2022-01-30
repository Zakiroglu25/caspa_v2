import 'dart:io';
import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/data_source/general_provider.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'comission_state.dart';

class CommissionCubit extends Cubit<CommissionState> {
  CommissionCubit() : super(CommissionInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(CommissionInProgress());
    }
    try {
      final result = await GeneralProvider.fetchCommission();
      if (result != null) {
        emit(CommissionSuccess(result.data));
      } else {
        emit(CommissionError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(CommissionNetworkError());
    } catch (e, s) {
      eeee("CommissionCubit catch: $e=>$s");
      Recorder.recordCatchError(e, s);
      emit(CommissionError(error: e.toString()));
    }
  }
}
