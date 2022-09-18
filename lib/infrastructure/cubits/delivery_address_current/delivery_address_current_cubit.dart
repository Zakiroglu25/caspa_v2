import 'dart:async';
import 'dart:io';

import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/cubits/delivery_address/delivery_address_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/big_data_info.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/delivery_address_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/google_map_model.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/infrastructure/services/navigation_service.dart';
import 'package:caspa_v2/util/constants/durations.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/extensions/word.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

import '../../../locator.dart';
import '../../../util/delegate/pager.dart';
import '../../../util/screen/alert.dart';
import '../../data_source/delivery_adress_provider.dart';
import '../../data_source/public_provider.dart';
import '../../models/remote/response/regions_model.dart';
import 'delivery_address_current_state.dart';

class DeliveryAddressCurrentCubit extends Cubit<DeliveryAddressCurrentState> {
  DeliveryAddressCurrentCubit() : super(DeliveryAdressCurrentInitial());

  HiveService get _prefs => locator<HiveService>();
  final context = NavigationService.instance.navigationKey?.currentContext;

  String? coordinates;
  String? address;
  String? regionTitle;
  late Position position;

  void get([bool loading = true]) async {
    emit(DeliveryAdressCurrentInProgress());
    try {
      if (loading) {
        emit(DeliveryAdressCurrentInProgress());
      }
      position = await _determinePosition();

      final lat = position.latitude;
      final long = position.longitude;
      final _location = "$lat , $long";

      List<Placemark> addresses = await placemarkFromCoordinates(lat, long);
      final locData =
          await PublicProvider.getLocDataFromBigData(lat: lat, long: long);
      var first = addresses.first;
      print("nname: ${first.name} :administrativeArea:  ${first}");

      if (isSuccess(locData.statusCode)) {
        regionTitle = (locData.data as LocalityInfo).administrative?.last.name;
      }
      bbbb("regionnnn: $regionTitle");

      if (first != null) {
        final _address =
            (first.thoroughfare == null || first.thoroughfare == '')
                ? '${first.subAdministrativeArea}'
                : '${first.subAdministrativeArea}, '.notEmpty +
                    '${first.subLocality}, '.notEmpty +
                    '${first.thoroughfare} '.notEmpty +
                    '${first.subThoroughfare}'.notEmpty;

        address = _address;
        // regionTitle = first.subAdministrativeArea;
        coordinates = _location;
        await Future<void>.delayed(Durations.ms100);
        emit(DeliveryAdressCurrentSuccess(
            location: _location, address: _address));
      } else {
        emit(DeliveryAdressCurrentError(error: MyText.error));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(DeliveryAdressCurrentError(error: MyText.network_error));
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      // emit(DeliveryAdressCurrentError());
    }
    // emit(DeliveryAdressSuccess());
  }

  Future<int?> getLocationFromGoogle({required List<Region> regionList}) async {
    final lat = position.latitude;
    final long = position.longitude;
    final _location = "$lat , $long";

    final locData =
        await PublicProvider.getLocDataFromGoogleMap(lat: lat, long: long);
    //print("nname: ${first.name} :administrativeArea:  ${first}");

    if (isSuccess(locData.statusCode)) {
      final mapResult = (locData.data as List<GoogleMapResults>);

      if (mapResult.isEmpty) return null;

      for (GoogleMapResults res in mapResult) {
        if (res.addressComponents == null) return null;
        for (AddressComponents comp in res.addressComponents!) {
          final regionFirstPart = comp.longName?.first;

          final declaredRegions = regionList.where((element) =>
              element.eng == regionFirstPart ||
              element.name?.first == regionFirstPart);
          if (declaredRegions.isNotEmpty) {
            final int id = declaredRegions.first.id!;
            eeee("mapppo: $id");
            return id;
          }
        }
      }
    }

    // emit(DeliveryAdressSuccess());
  }

  void add(BuildContext context, {bool loading = true}) async {
    try {
      if (loading) {
        emit(DeliveryAdressCurrentInProgress());
      }

      if (regionTitle == null || coordinates == null) {
        return;
      }
      final regionList = context.read<DeliveryAddressCubit>().regionList;
      final region =
          await declareRegionId(region: regionTitle!, regionList: regionList);
      final result = await DeliveryAdressProvider.add(
          region: region ?? 14,
          name: address ?? '',
          phone: _prefs.user.phone!,
          address: "${address ?? ''} | $coordinates");

      if (isSuccess(result?.statusCode)) {
        emit(DeliveryAdressCurrentAdded());
      }
      emit(DeliveryAdressCurrentSuccess(
          location: coordinates!, address: address!));
      // emit(DeliveryAdressOperationsInProgress());

    } on SocketException catch (_) {
      //network olacaq
      emit(DeliveryAdressCurrentError(error: MyText.network_error));
    } catch (e) {
      emit(DeliveryAdressCurrentError());
    }
  }

  Future<int?> declareRegionId({
    required String region,
    required List<Region> regionList,
  }) async {
    try {
      final regionFirstPart = region.first;
      int? id;
      final declaredRegions = regionList.where((element) =>
          element.eng == regionFirstPart ||
          element.name?.first == regionFirstPart);
      //burada evvelce bigDataCloud apisinden region axtarrir
      //tapmayanda ise elsenin icinde
      //googlemap apisinde region axtarir
      //oradad da tapmasa id 14 - Diger qaytarir
      if (declaredRegions.isNotEmpty) {
        //bigDataCloud
        id = declaredRegions.first.id!;
      } else {
        //googleMap
        id = await getLocationFromGoogle(regionList: regionList);
      }
      return id;
    } on SocketException catch (_) {
      emit(DeliveryAdressCurrentError(error: MyText.network_error));
    } catch (e) {
      emit(DeliveryAdressCurrentError());
    }
  }

  void goToAddPage(
      {required BuildContext context,
      required List<Region> regions,
      DeliveryAddress? deliveryAddress}) async {
    try {
      showCupertinoModalBottomSheet(
        expand: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Pager.deliveryAddressOperations(
            context: context,
            regions: regions,
            deliveryAddress: deliveryAddress),
      );
    } on SocketException catch (_) {
      emit(DeliveryAdressCurrentError(error: MyText.network_error));
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    loc.Location location = loc.Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    loc.LocationData _locationData;

    // await location.requestService();
    // _serviceEnabled = await location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await location.requestService();
    //   if (!_serviceEnabled) {}
    // }
    //
    // _permissionGranted = (await location.hasPermission()) as PermissionStatus;
    // if (_permissionGranted == PermissionStatus.denied) {
    //   _permissionGranted =
    //       (await location.requestPermission()) as PermissionStatus;
    //   if (_permissionGranted != PermissionStatus.granted) {}
    // }

    // Test if location services are enabled.
    serviceEnabled = await location.requestService();

    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      emit(DeliveryAdressCurrentDenied());
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        emit(DeliveryAdressCurrentDenied());
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      emit(DeliveryAdressCurrentDisabled());
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> showAccessAlert(BuildContext context) async {
    Alert.show(context,
        title: MyText.we_need_access_to_locatoin,
        content: MyText.we_will_redirect_to_settings_locatoin,
        buttonText: MyText.goOn,
        onTap: () async => await openAppSettings());
  }

  //--------------------values:-----------------

  //selected  adress id
  final BehaviorSubject<int?> selectedAdressId = BehaviorSubject<int>();

  Stream<int?> get selectedAdressIdStream => selectedAdressId.stream;

  updateSelectedAdressId(int? value) {
    if (value == null) {
      selectedAdressId.value = null;
      //taxNumber.sink.addError(MyText.field_is_not_correct);
    } else {
      selectedAdressId.sink.add(value);
    }
  }

  bool get isSelectedAdressIdIncorrect =>
      (!selectedAdressId.hasValue || selectedAdressId.value == null);

//note
  final BehaviorSubject<String> note = BehaviorSubject<String>();

  Stream<String> get noteStream => note.stream;

  updateNote(String value) {
    if (value.isEmpty) {
      note.value = '';
      note.sink.addError(MyText.field_is_not_correct);
    } else {
      note.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isNoteIncorrect => (!note.hasValue || note.value.isEmpty);

  //details
  final BehaviorSubject<String> details = BehaviorSubject<String>();

  Stream<String> get detailsStream => note.stream;

  updateDetails(String value) {
    if (value.isEmpty) {
      details.value = '';
      details.sink.addError(MyText.field_is_not_correct);
    } else {
      details.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isDetailsIncorrect => (!details.hasValue || details.value.isEmpty);

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
    if (!isRegionIncorrect && !isDetailsIncorrect && !isNoteIncorrect) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> close() {
    note.close();
    details.close();
    region.close();
    return super.close();
  }
}
