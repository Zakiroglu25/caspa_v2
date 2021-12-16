import 'dart:io';

import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_state.dart';
import 'package:caspa_v2/infrastructure/data_source/address_provider.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(AddressInProgress());
    }
    try {
      final result = await AddressProvider.getAddress();
      if (result.data != null) {
        emit(AddressSuccess(result.data!));
      } else {
        emit(AddressError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(AddressError());
    } catch (e) {
      emit(AddressError());
    }
  }
}
