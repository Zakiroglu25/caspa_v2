import 'dart:io';

import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/regions_model.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

import '../../../util/delegate/my_printer.dart';
import '../../../util/delegate/request_control.dart';
import '../../data_source/package_provider.dart';
import '../../models/remote/response/package_and_count_model.dart';
import 'select_packages_pay_state.dart';

class SelectPackagesPayCubit extends Cubit<SelectPackagesPayState> {
  SelectPackagesPayCubit() : super(SelectPackagesPayInProgress());

  ////////////////////////////////////////
  final BehaviorSubject<List<Package>> selectedOrders =
      BehaviorSubject<List<Package>>.seeded([]);

  Stream<List<Package>> get selectedOrdersStream => selectedOrders.stream;

  addOrder(Package package) {
    if (selectedOrders.value.contains(package)) {
      selectedOrders.add(selectedOrders.value..remove(package));
    } else {
      selectedOrders.add(selectedOrders.value..add(package));
    }
  }

  void fetchActiveUnpaid([bool loading = true]) async {
    List<Package> allPackages = [];
    if (loading) {
      emit(SelectPackagesPayInProgress());
    }
    try {
      // String token = await _prefs.accessToken!;
      // final result = await PackageProvider.fetchAllPackages();
      final result = await PackageProvider.fetchActivePackages();
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
      allPackages = allPackages.reversed.toList()
        ..where((element) => element.payment == 0);

      emit(SelectPackagesPayError());
      if (isSuccess(result.statusCode)) {
        emit(SelectPackagesPaySuccess(packages: allPackages));
      } else {
        emit(SelectPackagesPayError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(SelectPackagesPayNetworkError());
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(SelectPackagesPayError(error: e.toString()));
    }
  }

  void paySelectedOrders({bool loading = true}) async {
    try {
      final selectedIds = selectedOrders.value.fold<List<int>>(
          [], (previous, element) => previous..add(element.id!));
      emit(SelectPackagesPayShowPaymentDialog(selectedOrders: selectedIds));
      bbbb("selected ids: $selectedIds");
    } catch (e) {
      emit(SelectPackagesPayError(error: MyText.error));
    }
  }

  ////////////////////////////fields

  //paymentType
  final BehaviorSubject<String> paymentType =
      BehaviorSubject<String>.seeded(MyText.fromBalance);

  Stream<String> get payTypeStream => paymentType.stream;

  updatePayType(String value) {
    if (value == null || value.isEmpty) {
      paymentType.value = '';
      paymentType.sink.addError(MyText.field_is_not_correct);
    } else {
      paymentType.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isPayTypeIncorrect => (!paymentType.hasValue ||
      paymentType.value == null ||
      paymentType.value.isEmpty);

  @override
  Future<void> close() {
    selectedOrders.close();
    paymentType.close();
    return super.close();
  }
}
