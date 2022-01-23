import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/package_provider.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../locator.dart';
import 'packages_statuses_state.dart';

class PackageStatusesCubit extends Cubit<PackageStatusesState> {
  PackageStatusesCubit() : super(PackageStatusesInitial());

  PreferencesService get _prefs => locator<PreferencesService>();

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(PackageStatusesInProgress());
    }
    try {
      // String token = await _prefs.accessToken!;
      final result = await PackageProvider.fetchPackagesWithStatuses();
      emit(PackageStatusesError());
      if (isSuccess(result.statusCode)) {
        emit(PackageStatusesSuccess(result.data));
      } else {
        emit(PackageStatusesError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(PackageStatusesNetworkError());
    } catch (e) {
      eeee("package cubit catch: $e");
      emit(PackageStatusesError(error: e.toString()));
    }
  }
}
