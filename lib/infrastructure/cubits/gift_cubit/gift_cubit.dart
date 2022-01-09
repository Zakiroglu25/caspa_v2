import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/gift_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/promo_code_provider.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'gift_state.dart';

class GiftCubit extends Cubit<GiftState> {
  GiftCubit() : super(GiftInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(GiftInProgress());
    }
    try {
      final result = await GiftProvider.getGift();

      if (result!.data != null) {
        emit(GiftSuccess(result.data!));
      } else {
        emit(GiftError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(GiftNetworkError());
    } catch (e, s) {
      eeee("gift cubit catch: $e");
      emit(GiftError(error: e.toString()));
    }
  }

  void addPromo([bool loading = true]) async {
    if (loading) {
      emit(GiftInProgress());
    }
    try {
      final result = await GiftProvider.addGift(code: promoCode.valueOrNull!);

      if (isSuccess(result.statusCode)) {
        emit(GiftAdded());
      } else {
        emit(GiftNotAdded());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(GiftNetworkError());
    } catch (e, s) {
      eeee("addPromo cubit catch: $e");
      emit(GiftError(error: e.toString()));
    }
  }

  //promoCode
  final BehaviorSubject<String> promoCode = BehaviorSubject<String>();

  Stream<String> get promoCodeStream => promoCode.stream;

  updatePromoCode(String value) {
    if (value == null || value.isEmpty) {
      promoCode.value = '';
      promoCode.sink.addError(MyText.field_is_not_correct);
    } else {
      promoCode.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get ispromoCodeIncorrect => (!promoCode.hasValue ||
      promoCode.value == null ||
      promoCode.value.isEmpty);

  //--------------------values:-----------------
  @override
  Future<void> close() {
    promoCode.close();
    return super.close();
  }
}
