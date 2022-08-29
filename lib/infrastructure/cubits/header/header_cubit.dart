// Dart imports:
import 'dart:io';

// Package imports:

import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import 'header_state.dart';

class HeaderCubit extends Cubit<HeaderState> {
  HeaderCubit() : super(HeaderInitial());

  HiveService get _prefs => locator<HiveService>();

  void fetch({bool loading = true}) async {
    if (loading) {
      try {
        // HeaderResult headerResult =
        //     HeaderResult.fromJson(json.decode(_prefs.header));
        // emit(HeaderInProgress(headerResult: headerResult));
      } catch (e) {
        emit(HeaderInProgress());
      }
    }
    try {
      // final result =
      //     await HeaderProvider.fetchHeader(userId: _prefs.userId,customerGuid: _prefs.customerGuid);

      // vvvv(result.toString());
      //   if (result.message == 'ok') {
      //     _prefs.persistHeader(headerResult: result.result);
      //     emit(HeaderSuccess(result.result));
      //   } else {
      //     emit(HeaderError());
      //   }
    } on SocketException catch (_) {
      emit(HeaderNetworkError());
    } catch (e) {
      emit(HeaderError());
    }
  }
}
