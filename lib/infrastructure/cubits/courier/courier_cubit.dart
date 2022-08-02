import 'dart:io';
import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_state.dart';
import 'package:caspa_v2/infrastructure/data_source/courier_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/package_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/public_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/regions_model.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/courier_operations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../locator.dart';
import '../../../util/constants/durations.dart';
import '../../data_source/delivery_adress_provider.dart';
import '../../models/remote/response/delivery_address_model.dart';
import '../../services/hive_service.dart';

class CourierCubit extends Cubit<CourierState> {
  CourierCubit() : super(CourierInProgress());

  ////////////////////////////////////////
  HiveService get _prefs => locator<HiveService>();
  /////////////////////////////////////////////////////
  /////////////////////////////////////////////////////

  Future<DeliveryAddress?> getAddress([bool loading = true]) async {
    bbbb("huuhuh");
    // emit(CourierAddressInProgress());
    // await Future.delayed(Durations.s1);
    final resultAddress = await DeliveryAdressProvider.getAddresses();

    if (resultAddress != null) {
      final List<DeliveryAddress>? addresses = resultAddress.data;
      final address =
          CourierOperations.determineSelectedAddress(addresses: addresses);
      updatedeliveryAddress(address?.name ?? '');
      return address;
    }
    return null;
  }

  Future<int?> addCourier(BuildContext context,
      {bool loading = true,
      required List<Package> packages,
      required String phone,
      required String adress,
      int? courierId,
      required Region region}) async {
    try {
      if (loading) {
        emit(CourierInProgressButton());
      }

      final result = await CourierProvider.addCourier(
          phone: AppOperations.formatNumber(phone, addZero: false),
          adress: adress,
          regionId: region.id!,
          courierId: courierId,
          packages: packages.map((e) => e.id!).toList());
      if (isSuccess(result.statusCode)) {
        if (courierId == null) {
          int courierId = result.data['message'];
          emit(CourierAdded(courierId));
        } else {
          String message = result.data['message'];
          emit(CourierEdited(message, courierId));
        }

        //  emit(CourierAdded(courierId));
        return courierId;
      } else {
        Snack.display(context: context, message: MyText.error);
        emit(CourierOperationFail());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(CourierOperationFail());
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CourierOperationFail());
    }
  }

  void configureCourier(
    BuildContext context, {
    bool loading = true,
    int? courierId,
  }) async {
    try {
      // if (isUserDataValid()) {
      final _address = _prefs.address;
      if (loading) {
        emit(CourierInProgressButton());
      }
      ;
      if (_address == null) {
        emit(CourierError());
        return null;
      }
      Go.to(
          context,
          Pager.courier_order(
            phone: _address.phone!,
            packages: selectedOrders.value,
            adress: _address.address!,
            courierId: courierId,
            price: _address.region!.price!,
            region: _address.region!,
          ));
      emit(CourierConfigured());
      // } else {
      //   Snack.display(
      //       context: context, message: MyText.all_fields_must_be_filled);
      //   emit(CourierOperationFail());
      // }
    } on SocketException catch (_) {
      //network olacaq
      emit(CourierError());
    } catch (e, s) {
      Recorder.recordCatchError(e, s, where: 'CourierCubit.configureCourier');
      emit(CourierError(error: e.toString()));
    }
  }
  // void configureCourier(
  //   BuildContext context, {
  //   bool loading = true,
  //   int? courierId,
  // }) async {
  //   try {
  //     if (isUserDataValid()) {
  //       if (loading) {
  //         emit(CourierInProgressButton());
  //       }
  //       ;
  //       Go.to(
  //           context,
  //           Pager.courier_order(
  //             phone: phone.value,
  //             packages: selectedOrders.value,
  //             adress: adress.value,
  //             courierId: courierId,
  //             price: region.value!.price!,
  //             region: region.value!,
  //           ));
  //       emit(CourierConfigured());
  //     } else {
  //       Snack.display(
  //           context: context, message: MyText.all_fields_must_be_filled);
  //       emit(CourierOperationFail());
  //     }
  //   } on SocketException catch (_) {
  //     //network olacaq
  //     emit(CourierError());
  //   } catch (e, s) {
  //     Recorder.recordCatchError(e, s, where: 'CourierCubit.configureCourier');
  //     emit(CourierError(error: e.toString()));
  //   }
  // }

  void fetchPackagesForCourier({bool loading = true}) async {
    if (loading) {
      emit(CourierInProgress());
    }
    updatedeliveryAddress("");

    try {
      selectedOrders.value.clear();
      final resultPackages = await PackageProvider.fetchPackagesForCourier();
      final resultRegions = await PublicProvider.getRegions();

      final address = await getAddress();

      //  await Future.delayed(Durations.ms100);
      if (isSuccess(resultPackages.statusCode) &&
          isSuccess(resultRegions.statusCode)) {
        emit(CourierableFetched(
            address: address,
            packageList: (resultPackages.data as List<Package>).where((element) => element.inCourier!<1).toList(),
            regionList: resultRegions.data));
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

//deliveryAddress
  final BehaviorSubject<String> deliveryAddress = BehaviorSubject<String>();

  Stream<String> get deliveryAddressStream => deliveryAddress.stream;

  updatedeliveryAddress(String value) {
    deliveryAddress.sink.add(value);
  }

  bool get isDeliveryAddressIncorrect => (!deliveryAddress.hasValue ||
      deliveryAddress.value == null ||
      deliveryAddress.value.isEmpty);

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

  //selected orders
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

  @override
  Future<void> close() {
    adress.close();
    region.close();
    phone.close();
    selectedOrders.close();
    paymentType.close();
    return super.close();
  }
}
