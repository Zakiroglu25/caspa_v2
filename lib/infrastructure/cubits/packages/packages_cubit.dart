import 'dart:convert';
import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/package_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../locator.dart';
import 'packages_state.dart';

class PackageCubit extends Cubit<PackageState> {
  PackageCubit() : super(PackagesInitial());

  PreferencesService get _prefs=>locator<PreferencesService>();

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(PackagesInProgress());
    }
    try {
      String token =await _prefs.accessToken!;
      final result = await PackageProvider.fetchAllPackages(token);

      if (isSuccess(result?.statusCode)) {
        emit(PackagesSuccess(result?.data ));
      } else {
        emit(PackagesError());
        eeee(
            "package cubit result bad: ${ResponseMessage.fromJson(jsonDecode(result!.data)).message}");
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
