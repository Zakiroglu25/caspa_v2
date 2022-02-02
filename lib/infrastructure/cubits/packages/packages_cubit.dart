import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/package_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/package_and_count_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../locator.dart';
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
      // bbbb('resul: ${allPackages[0].customStatus}');
      // bbbb('resul: ${result.data}');
      emit(PackagesError());
      if (isSuccess(result.statusCode)) {
        emit(PackagesSuccess(allPackages));
      } else {
        emit(PackagesError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(PackagesNetworkError());
    } catch (e) {
      eeee("package cubit catch: $e");
      emit(PackagesError(error: e.toString()));
    }
  }
}
