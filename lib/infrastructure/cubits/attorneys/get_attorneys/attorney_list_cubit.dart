import 'dart:io';

import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_state.dart';
import 'package:caspa_v2/infrastructure/data_source/address_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/attorney_list_provider.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../locator.dart';
import 'attorney_list_state.dart';

class AttorneyListCubit extends Cubit<AttorneyListState> {
  AttorneyListCubit() : super(AttorneyListInitial());
  PreferencesService get _prefs => locator<PreferencesService>();
  void fetch([bool loading = true]) async {

    if (loading) {
      emit(AttorneyListInProgress());
    }



    try {
      final result = await AttorneyListProvider.getAttorneys(accessToken: _prefs.accessToken);
      bbbb("uuu: "+result.data.toString());
      if (result.data != null) {
        emit(AttorneyListSuccess(result.data!));
      } else {
        emit(AttorneyListError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(AttorneyListNetworkError());
    } catch (e) {
      emit(AttorneyListError(error: e.toString()));
    }
  }
}
