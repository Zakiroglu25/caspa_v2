import 'dart:io';
import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/data_source/package_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/package_and_count_model.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../locator.dart';
import 'packages_statuses_state.dart';

class PackageStatusesCubit extends Cubit<PackageStatusesState> {
  PackageStatusesCubit() : super(PackageStatusesInitial());

  HiveService get _prefs => locator<HiveService>();

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(PackageStatusesInProgress());
    }
    Map<String, dynamic> mainPackageMap = {};
    try {
      // String token = await _prefs.accessToken!;
      final result = await PackageProvider.fetchPackagesWithStatuses();

      emit(PackageStatusesError());
      if (isSuccess(result.statusCode)) {
        final Map<String, dynamic> packageMap = result.data;
        packageMap.forEach((key, value) {
          // bbbb("vslue $key in map: ${value}");

          PackageAndCount packageAndCount = PackageAndCount.fromJson(value);
          packageAndCount.packages!.forEach((f) => f.customStatus = key);
          //allPackages.addAll(packageAndCount.packages!.reversed.toList());
          mainPackageMap[key] = packageAndCount.toJson();
        });
        //  bbbb("vslue x in map: ${packageMap}");
        // bbbb("vslue x in map: ${mainPackageMap}");
        emit(PackageStatusesSuccess(mainPackageMap));
      } else {
        emit(PackageStatusesError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(PackageStatusesNetworkError());
    } catch (e, s) {
      eeee("package cubit catch: $e => $s");
      Recorder.recordCatchError(e, s);
      emit(PackageStatusesError(error: e.toString()));
    }
  }
}
