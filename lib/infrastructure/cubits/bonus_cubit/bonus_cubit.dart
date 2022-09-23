import 'dart:convert';
import 'dart:io';

import 'package:caspa_v2/infrastructure/cubits/bonus_cubit/bonus_state.dart';
import 'package:caspa_v2/infrastructure/data_source/general_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/wheel_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import '../../services/hive_service.dart';

class BonusCubit extends Cubit<BonusState> {
  BonusCubit() : super(BonusInitial());

  HiveService get _prefs => locator<HiveService>();

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(BonusInProgress());
    }
    try {
      final result = await WheelProvider.bonus(_prefs.accessToken);
      try {
        if (isSuccess(result!.statusCode)) {
          emit(BonusSuccess(result.data));
        } else {
          emit(BonusError());
          eeee(
              "Ads: ${ResponseMessage.fromJson(jsonDecode(result.data)).message}");
        }
      } catch (e) {
        print(e);
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(BonusNetworkError());
    } catch (e) {
      eeee("bonus cubit catch: $e");
      emit(BonusError(error: e.toString()));
    }
  }

//NeseCubit(NeseLoading());
}
