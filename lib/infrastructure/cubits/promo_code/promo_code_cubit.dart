import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/promo_code_provider.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'promo_code_state.dart';

class PromoCodeCubit extends Cubit<PromoCodeState> {
  PromoCodeCubit() : super(PromoCodeInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(PromoCodeInProgress());
    }

    try {
      final result = await PromoCodeProvider.getPromoCodes();
      if (isSuccess(result.statusCode)) {
        emit(PromoCodeSuccess(result.data));
      } else {
        emit(PromoCodeError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(PromoCodeNetworkError());
    } catch (e, s) {
      eeee("PromoCodeCubit catch: $e");
      emit(PromoCodeError(error: e.toString()));
    }
  }

  void addPromo(BuildContext context, [bool loading = true]) async {
    if (loading) {
      emit(PromoCodeInAdding());
    }

    try {
      final result =
          await PromoCodeProvider.addPromoCode(code: promoCode.valueOrNull!);

      if (isSuccess(result.statusCode)) {
        Snack.positive(context: context, message: MyText.operationIsSuccess);
        fetch(false);
        emit(PromoCodeAdded());
      } else {
        Snack.display(context: context, message: result.data['message']);
        emit(PromoCodeNotAdded());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(PromoCodeNetworkError());
    } catch (e, s) {
      eeee("addPromo cubit catch: $e");
      emit(PromoCodeError(error: e.toString()));
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
