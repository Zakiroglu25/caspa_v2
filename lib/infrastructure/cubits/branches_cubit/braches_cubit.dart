import 'dart:io';

import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_source/public_provider.dart';
import 'branches_state.dart';

class BranchCubit extends Cubit<BranchesState> {
  BranchCubit() : super(BranchesInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(BranchesProgress());
    }
    try {
      final response = await PublicProvider.getBranch();
      if (isSuccess(response.statusCode)) {
        emit(BranchesSuccess(response.data));
      } else {
        emit(BranchesError(error: "Error status code: ${response.statusCode}"));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(BranchesNetworkError());
    } catch (e) {
      eeee("BranchCubit -> fetch error: $e");
      emit(BranchesError(error: e.toString()));
    }
  }
}
