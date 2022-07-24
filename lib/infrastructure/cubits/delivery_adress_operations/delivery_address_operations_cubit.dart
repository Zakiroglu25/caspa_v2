import 'dart:async';
import 'dart:io';
import 'package:caspa_v2/infrastructure/cubits/order_via_url_list/order_via_url_list_state.dart';
import 'package:caspa_v2/infrastructure/data_source/order_via_link_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/util/screen/full_screen_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../locator.dart';
import '../../../util/delegate/app_operations.dart';
import '../../../util/formatter/masked_text_controller_phone.dart';
import '../../data_source/delivery_adress_provider.dart';
import '../../models/remote/response/delivery_address_model.dart';
import '../../models/remote/response/regions_model.dart';
import 'delivery_address_operations_state.dart';

class DeliveryAdressOperationsCubit
    extends Cubit<DeliveryAdressOperationsState> {
  DeliveryAdressOperationsCubit() : super(DeliveryAdressOperationsInitial());

  HiveService get _prefs => locator<HiveService>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = MaskedTextController.app(
      text:
          "${AppOperations.formatNumber("", addZero: false, fromSpaceToLine: false)}");

  final TextEditingController detailsController =
      TextEditingController(text: "${''}");

  void add(BuildContext context, {bool loading = true, int? id}) async {
    try {
      if (isUserDataValid()) {
        if (loading) {
          emit(DeliveryAdressOperationsInProgress());
        }

        final result = await DeliveryAdressProvider.add(
            region: region.valueOrNull?.id!,
            name: name.value,
            phone: phone.value,
            id: id,
            address: address.value);

        bbbb("resoooo: " + result.toString());

        if (isSuccess(result?.statusCode)) {
          emit(DeliveryAdressOperationsSuccess());
        } else {
          emit(DeliveryAdressOperationsError(
              error: MyText.error + " ${result!.statusCode}"));
        }
        emit(DeliveryAdressOperationsInProgress());
      } else {
        emit(DeliveryAdressOperationsError(
            error: MyText.all_fields_must_be_filled));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(DeliveryAdressOperationsError(error: MyText.network_error));
    } catch (e) {
      emit(DeliveryAdressOperationsError());
    }
  }

  void get({bool loading = true, DeliveryAddress? deliveryAddress}) async {
    try {
      if (loading) {
        emit(DeliveryAdressOperationsInProgress());
      }
      if (deliveryAddress != null) {
        nameController.text = deliveryAddress.name!;
        phoneController.text = deliveryAddress.phone!;
        detailsController.text = deliveryAddress.address!;
        updateRegion(deliveryAddress.region);
      }
      emit(DeliveryAdressOperationsSuccess(id: deliveryAddress?.id));
    } on SocketException catch (_) {
      //network olacaq
      emit(DeliveryAdressOperationsError(error: MyText.network_error));
    } catch (e) {
      emit(DeliveryAdressOperationsError());
    }
    //emit(DeliveryAdressOperationsSuccess());
  }

  void edit(BuildContext context, {required LinkOrder order}) async {
    emit(DeliveryAdressOperationsInProgress());
    // try {
    //   final result = await OrderViaLinkProvider.editOrder(
    //     id: order.id!,
    //     qty: productCount.valueOrNull,
    //     price: price.valueOrNull,
    //     link: link.valueOrNull,
    //     cargo_price: localCargo.valueOrNull,
    //     detail: note.valueOrNull,
    //   );
    //
    //   if (isSuccess(result!.statusCode)) {
    //     emit(DeliveryAdressOperationsEdited());
    //   } else {
    //     emit(DeliveryAdressOperationsError(error: MyText.error));
    //   }
    // } on SocketException catch (_) {
    //   emit(DeliveryAdressOperationsError(error: MyText.network_error));
    // } catch (e) {
    //   print(e);
    //   emit(DeliveryAdressOperationsError(error: MyText.error + ": $e"));
    // }
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

//name
  final BehaviorSubject<String> name = BehaviorSubject<String>();

  Stream<String> get nameStream => name.stream;

  updateName(String value) {
    if (value == null || value.isEmpty) {
      name.value = '';
      name.sink.addError(MyText.field_is_not_correct);
    } else {
      name.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isNameIncorrect =>
      (!name.hasValue || name.value == null || name.value.isEmpty);

  //adress
  final BehaviorSubject<String> address = BehaviorSubject<String>();

  Stream<String> get adressStream => address.stream;

  updateAdress(String value) {
    if (value == null || value.isEmpty) {
      address.value = '';
      address.sink.addError(MyText.field_is_not_correct);
    } else if (value.length < 10) {
      address.sink.addError(MyText.adress_minumum_10);
    } else {
      address.sink.add(value);
    }
  }

  bool get isAddressIncorrect =>
      (!address.hasValue || address.value == null || address.value.isEmpty);

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

  //is user data valid
  bool isUserDataValid() {
    if (!isRegionIncorrect &&
        !isAddressIncorrect &&
        !isNameIncorrect &&
        !isPhoneIncorrect) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> close() {
    name.close();
    address.close();
    phone.close();
    region.close();
    nameController.dispose();
    phoneController.dispose();
    detailsController.dispose();
    return super.close();
  }
}
