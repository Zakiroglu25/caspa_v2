import 'dart:io';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_state.dart';
import 'package:caspa_v2/infrastructure/data_source/courier_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/package_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/public_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/regions_model.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class CourierCubit extends Cubit<CourierState> {
  CourierCubit() : super(CourierInProgress()) {
    selectedOrdersId.addListener(() {
      isDataValid();
    });
  }

  // List<int> selectedOrders = [];
  ValueNotifier<List<int>> selectedOrdersId = ValueNotifier<List<int>>([]);
  ValueNotifier<List<Package>> selectedPackages =
      ValueNotifier<List<Package>>([]);

  ///////////////////

  addOrderId(int id) {
    id = id;
    if (selectedOrdersId.value.contains(id)) {
      selectedOrdersId.value.remove(id);
    } else {
      selectedOrdersId.value.add(id);
      //  selectedOrders.value.add(4415);
    }

    isDataValid();
    bbbb("selected order list in cubit : ${selectedOrdersId.value}");
  }

  addPackage(Package package) {
    // id = id;
    if (selectedPackages.value.contains(package)) {
      selectedPackages.value.remove(package);
    } else {
      selectedPackages.value.add(package);
      //  selectedOrders.value.add(4415);
    }
  }

  bool isDataValid() {
    if (selectedOrdersId.value.length != 0) {
      emit(CourierContinueButtonActive());
      return false;
    } else
      emit(CourierContinueButtonPassive());
    return true;
  }

  /////////////////////////////////////////////////////
  /////////////////////////////////////////////////////

  void addCourier(BuildContext context, {bool loading = true}) async {
    try {
      if (isUserDataValid()) {
        if (loading) {
          emit(CourierInProgressButton());
        }
        final result = await CourierProvider.addCourier(
            phone: AppOperations.formatNumber(phone.valueOrNull!),
            adress: adress.valueOrNull!,
            regionId: (region.valueOrNull!.id)!,
            packages: selectedOrdersId.value);
        if (isSuccess(result.statusCode)) {
          Go.to(
              context,
              Pager.courier_order(
                phone: phone.value,
                packages: selectedPackages.value,
                adress: adress.value,
                price: region.value!.price!,
              ));
        } else {
          Snack.display(context: context, message: MyText.error);
          emit(CourierOperationFail());
        }
      } else {
        Snack.display(
            context: context, message: MyText.all_fields_must_be_filled);
        emit(CourierOperationFail());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(CourierError());
    } catch (e, s) {
      eeee("fetchPackagesForCourier catch: $e => $s");
      emit(CourierError(error: e.toString()));
    }
  }

  void fetchPackagesForCourier({bool loading = true}) async {
    if (loading) {
      emit(CourierInProgress());
    }

    try {
      final resultPackages = await PackageProvider.fetchPackagesForCourier();
      final resultRegions = await PublicProvider.getRegions();
      if (isSuccess(resultPackages.statusCode) &&
          isSuccess(resultRegions.statusCode)) {
        //bbbb("kkkk: ${(resultPackages.data[0] as Package).payment}");
        emit(CourierableFetched(
            packageList: resultPackages.data, regionList: resultRegions.data));
      } else {
        emit(CourierError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(CourierError());
    } catch (e, s) {
      eeee("fetchPackagesForCourier catch: $e => $s");
      emit(CourierError(error: e.toString()));
    }
  }

  // void fetchRegions([bool loading = true]) async {
  //   if (loading) {
  //     emit(CourierInProgress());
  //   }
  //
  //   try {
  //     final result = await PublicProvider.getRegions();
  //     if (isSuccess(result.statusCode)) {
  //       emit(CourierableFetched(result.data));
  //     } else {
  //       emit(CourierError());
  //     }
  //   } on SocketException catch (_) {
  //     //network olacaq
  //     emit(CourierError());
  //   } catch (e, s) {
  //     eeee("fetchPackagesForCourier catch: $e => $s");
  //     emit(CourierError(error: e.toString()));
  //   }
  // }

  ////////////////////////////fields

  //adress
  final BehaviorSubject<String> adress = BehaviorSubject<String>();

  Stream<String> get adressStream => adress.stream;

  updateAdress(String value) {
    if (value == null || value.isEmpty) {
      adress.value = '';
      adress.sink.addError(MyText.field_is_not_correct);
    } else if (value.length < 10) {
      adress.sink.addError(MyText.adress_minumum_10);
    } else {
      adress.sink.add(value);
    }
  }

  bool get isAdressIncorrect =>
      (!adress.hasValue || adress.value == null || adress.value.isEmpty);

  //phone
  final BehaviorSubject<String> phone = BehaviorSubject<String>();

  Stream<String> get phoneStream => phone.stream;

  updatePhone(String value) {
    if (value == null || value.isEmpty) {
      phone.value = '';
      phone.sink.addError(MyText.field_is_not_correct);
    } else {
      phone.sink.add(value);
    }
  }

  bool get isPhoneIncorrect =>
      (!phone.hasValue || phone.value == null || phone.value.isEmpty);

  //region
  final BehaviorSubject<Region?> region = BehaviorSubject<Region>();

  Stream<Region?> get regionStream => region.stream;

  updateRegion(Region? value) {
    if (value == null) {
      region.value = null;
      //region.sink.addError(MyText.field_is_not_correct);
    } else {
      region.sink.add(value);
    }
  }

  bool get isRegionIncorrect => (!region.hasValue || region.value == null);

  //is user data valid
  bool isUserDataValid() {
    if (!isRegionIncorrect && !isAdressIncorrect && !isPhoneIncorrect) {
      return true;
    } else {
      return false;
    }
  }

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
    adress.close();
    region.close();
    phone.close();
    paymentType.close();
    return super.close();
  }
}
