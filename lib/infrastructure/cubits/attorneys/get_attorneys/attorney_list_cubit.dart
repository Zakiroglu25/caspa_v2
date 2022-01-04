import 'dart:io';

import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_state.dart';
import 'package:caspa_v2/infrastructure/data_source/address_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/attorneys_provider.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../locator.dart';
import 'attorney_list_state.dart';

class AttorneyListCubit extends Cubit<AttorneyListState> {
  AttorneyListCubit() : super(AttorneyListInProgress());

  PreferencesService get _prefs => locator<PreferencesService>();

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(AttorneyListInProgress());
    }

    try {
      final result = await AttorneyProvider.getAttorneys(
          accessToken: _prefs.accessToken);
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


  void delete(int? id,{bool loading=true})async{

    if (loading) {
      emit(AttorneyListInProgress());
    }

    try {
      final result = await AttorneyProvider.deleteAttorney(
          accessToken: _prefs.accessToken,id: id!);

      if (isSuccess(result!.statusCode)) {
        emit(AttorneyDeleted());
        fetch(false);
      } else {
        emit(AttorneyListError(error: MyText.error));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(AttorneyListNetworkError());
    } catch (e) {
      emit(AttorneyListError(error: MyText.error+" "+e.toString()));
    }

    //user/attorneys/delete
  }


}
