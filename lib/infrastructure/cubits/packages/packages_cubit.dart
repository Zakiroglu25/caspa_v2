import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/package_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/package_and_count_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../locator.dart';
import '../../../util/constants/text.dart';
import '../../../util/screen/snack.dart';
import 'packages_state.dart';

class PackageCubit extends Cubit<PackageState> {
  PackageCubit() : super(PackagesInitial());

  HiveService get _prefs => locator<HiveService>();

  void fetch([bool loading = true]) async {
    List<Package> allPackages = [];
    if (loading) {
      emit(PackagesInProgress());
    }
    try {
      // String token = await _prefs.accessToken!;
      // final result = await PackageProvider.fetchAllPackages();
      final result = await PackageProvider.fetchPackagesWithStatuses();
      final Map<String, dynamic> packageMap = result.data;

      packageMap.entries.forEach((e) {
        PackageAndCount packageAndCount = PackageAndCount.fromJson(e.value);
        packageAndCount.packages!.forEach((f) => f.customStatus = e.key);
        allPackages.addAll(packageAndCount.packages!.reversed.toList());
      });

      final format =
          DateFormat("dd.MM.yyyy H:mm"); //.format(DateTime.parse("2019-09-30"))
      allPackages.sort(
          (a, b) => format.parse(a.date!).compareTo(format.parse(b.date!)));
      allPackages = allPackages.reversed.toList();

      emit(PackagesError());
      if (isSuccess(result.statusCode)) {
        emit(PackagesSuccess(allPackages));
      } else {
        emit(PackagesError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(PackagesNetworkError());
    } catch (e, s) {
      eeee("package cubit catch: $e=>$s");
      emit(PackagesError(error: e.toString()));
    }
  }

  void fetchActive([bool loading = true]) async {
    iiii("fetchActive 1");
    if (loading) {
      emit(PackagesInProgress());
    }
    iiii("fetchActive 2");
    try {
      // String token = await _prefs.accessToken!;
      // final result = await PackageProvider.fetchAllPackages();
      final result = await PackageProvider.fetchActivePackages();
      if (result.statusCode == 200) {}
      // final Map<dynamic, dynamic> packageMap = result.data;
      iiii(result.toString());
      //    iiii("fetchActive 1");
      // packageMap.entries.forEach((e) {
      //   PackageAndCount packageAndCount = PackageAndCount.fromJson(e.value);
      //   packageAndCount.packages!.forEach((f) => f.customStatus = e.key);
      //   allPackages.addAll(packageAndCount.packages!.reversed.toList());
      // });

      // final format =
      // DateFormat("dd.MM.yyyy H:mm"); //.format(DateTime.parse("2019-09-30"))
      // allPackages.sort(
      //         (a, b) => format.parse(a.date!).compareTo(format.parse(b.date!)));
      // allPackages = allPackages.reversed.toList();

      // emit(PackagesError());
      // iiii("fetchActive 3");
      if (isSuccess(result.statusCode)) {
        emit(PackagesSuccess(result.data));
        iiii("fetchActive 4");
      } else {
        iiii("fetchActive 5");
        emit(PackagesError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(PackagesNetworkError());
    } catch (e, s) {
      iiii("fetchActive 6");
      eeee("Active package cubit catch: $e=>$s");
      emit(PackagesError(error: e.toString()));
    }
  }

  void delete({BuildContext? context, bool loading = true, int? id}) async {
    if (loading) {
      emit(PackagesInProgress());
    }
    try {
      String? token = _prefs.accessToken;
      final result = await PackageProvider.deletePackage(id: id, token: token);
      iiii(result.toString());
      if (isSuccess(result!.statusCode)) {
        emit(PackagesDeleteSuccess(""));
        fetch(false);
      } else {
        emit(PackagesError());
      }
    } catch (e) {
      emit(PackagesError(error: MyText.error + "" + e.toString()));
      print(e);
    }
  }
}
