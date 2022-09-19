import 'dart:io';

import 'package:caspa_v2/infrastructure/cubits/wares_cubit/wares_state.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import '../../data_source/public_provider.dart';
import '../../services/hive_service.dart';

class WaresCubit extends Cubit<WaresState> {
  WaresCubit() : super(WaresInitial());


  void fetch([bool loading = true]) async {
    if (loading) {
      emit(WaresInProgress());
    }
    try {
      final response = await PublicProvider.getWares();
      if (isSuccess(response.statusCode)) {
        emit(WaresSuccess(response.data));
      } else {
        emit(WaresError(error: "Error status code: ${response.statusCode}"));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(WaresNetworkError());
    } catch (e) {
      eeee("CategoryCubit -> fetch error: $e");
      emit(WaresError(error: e.toString()));
    }
  }
}
