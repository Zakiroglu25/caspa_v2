// Dart imports:
import 'dart:io';
import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/cubits/active_package_cubit/active_package_state.dart';
import 'package:caspa_v2/infrastructure/data_source/notification_provider.dart';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import '../../../util/delegate/request_control.dart';
import '../../data_source/package_provider.dart';

// Project imports:

class ActivePackageCubit extends Cubit<ActivePackageState> {
  ActivePackageCubit() : super(ActivePackageInitial());

  HiveService get _prefs => locator<HiveService>();
  //RenewTokenService get _token => locator<RenewTokenService>();

  void fetch({bool? loading}) async {
    if (loading ?? true) {
      emit(ActivePackageInProgress());
    }
    emit(ActivePackageInProgress());
    try {

      final result = await PackageProvider.getActivePackage();
      // bbbb('noy: ${result.statusCode}');
      List<Package> activePackageList =
      result.data as List<Package>;
      // notificationList.forEach((element) {});

      if (isSuccess(result.statusCode)) {
        emit(ActivePackageSuccess(activePackageList));
        // bbbb("hjgkhjk; $notificationList");
      } else {
        emit(ActivePackageError());
      }
    } on SocketException catch (_) {
      emit(ActivePackageNetworkError());
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(ActivePackageError());
    }
  }
}
