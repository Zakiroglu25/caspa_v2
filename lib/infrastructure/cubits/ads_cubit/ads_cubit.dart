import 'dart:convert';
import 'dart:io';

import 'package:caspa_v2/infrastructure/cubits/ads_cubit/ads_state.dart';
import 'package:caspa_v2/infrastructure/data_source/general_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit() : super(AdsInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(AdsInProgress());
    }
    try {
      final result = await GeneralProvider.ads();

      try {
        if (isSuccess(result!.statusCode)) {
          emit(AdsSuccess(result.data));
        } else {
          emit(AdsError());
          eeee(
              "Ads: ${ResponseMessage.fromJson(jsonDecode(result.data)).message}");
        }
      } catch (e) {
        print(e);
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(AdsNetworkError());
    } catch (e) {
      eeee("ads cubit catch: $e");
      emit(AdsError(error: e.toString()));
    }
  }
  void sendIsActive(int id) async {
    try {
      final result = await GeneralProvider.adsIsActive(id);
      try {
        if (isSuccess(result!.statusCode)) {
          emit(AdsSuccess(result.data));
        } else {
          emit(AdsError());
          eeee(
              "Ads: ${ResponseMessage.fromJson(jsonDecode(result.data)).message}");
        }
      } catch (e) {
        print(e);
      }
    } on SocketException catch (_) {
      emit(AdsNetworkError());
    } catch (e) {
      eeee("ads send IsActive cubit catch: $e");
      emit(AdsError(error: e.toString()));
    }
  }

//NeseCubit(NeseLoading());
}

class NeseCubit extends Cubit<NeseState> {
  NeseCubit() : super(NeseInitial());

  getAllDat() {
    emit(NeseLoading());
    //api sorgi atilir
    //apiden resposne geldi
    int resposne = 200;
    if (resposne == 200) {
      emit(NeseSuccess());
    } else {
      emit(NeseError());
    }
  }
}

abstract class NeseState {}

class NeseSuccess extends NeseState {}

class NeseInitial extends NeseState {}

class NeseError extends NeseState {}

class NeseLoading extends NeseState {}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}
