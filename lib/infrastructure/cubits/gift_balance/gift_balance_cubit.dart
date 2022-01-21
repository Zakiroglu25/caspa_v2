import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/gift_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/promo_code_provider.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'gift_balance_state.dart';

class GiftBalanceCubit extends Cubit<GiftBalanceState> {
  GiftBalanceCubit() : super(GiftBalanceInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(GiftBalanceInProgress());
    }

    try {
      final result = await GiftProvider.getGiftCodes();
      if (isSuccess(result.statusCode)) {
        emit(GiftBalanceSuccess(result.data));
      } else {
        emit(GiftBalanceError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(GiftBalanceNetworkError());
    } catch (e, s) {
      eeee("GiftBalanceCubit ftech catch: $e");
      emit(GiftBalanceError(error: e.toString()));
    }
  }

  void addPromo(BuildContext context, [bool loading = true]) async {
    if (loading) {
      emit(GiftBalanceInAdding());
    }

    try {
      final result = await GiftProvider.addGift(code: promoCode.valueOrNull!);

      if (isSuccess(result.statusCode)) {
        Snack.positive(context: context, message: MyText.operationIsSuccess);
        fetch(false);
        emit(GiftBalanceAdded());
      } else {
        //
        Snack.display(context: context, message: result.data['message']);
        emit(GiftBalanceNotAdded());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(GiftBalanceNetworkError());
    } catch (e, s) {
      eeee("GiftBalanceCubit add cubit catch: $e");
      emit(GiftBalanceError(error: e.toString()));
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