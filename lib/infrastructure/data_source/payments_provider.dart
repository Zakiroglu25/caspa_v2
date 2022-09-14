import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/general_response_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/enums/payment_balance.dart';

import '../../locator.dart';

class PaymentsProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  /////////////////////////////////////////
  //-------P--A---C---K--A--G---E--------//
  /////////////////////////////////////////

  static Future<StatusDynamic> getPaymentUrl(
      {required double? amount,
      required PaymentBalanceType paymentBalanceType}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = paymentBalanceType == PaymentBalanceType.order
        ? ApiKeys.paymentOrder
        : ApiKeys.paymentCargo;

    final body = {"amount": amount};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    eeee("body: ${body}");

    if (response.statusCode == ResultKey.responseSuccess) {
      GeneralResponse data = GeneralResponse.fromJson(response.data);
      statusDynamic.data = data.data;
    } else {
      eeee(
          "payment_balance order result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  //package
  static Future<StatusDynamic> packagePay({required int? id}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForPackageBalalnce + "?id=$id";

    final body = {};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee(
          "payForPackage order result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> packageGetPaymentUrl({
    required int? id,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForPackageCard + "?id=$id";
    final body = {};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      GeneralResponse data = GeneralResponse.fromJson(response.data);
      statusDynamic.data = data.data;
    } else {
      eeee(
          "getPaymentUrlForPackage  result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> packageListPay({required List<int>? ids}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForPackageListBalance;

    final body = {"package": ids};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee(
          "payForPackage order result bad:  url: ${response.requestOptions.path}  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> packageListBonus(
      {required List<int>? ids}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForPackageListBonus;

    final body = {"package": ids};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee(
          "payForPackage order result bad:  url: ${response.requestOptions.path}  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> packageListGetPaymentUrl({
    required List<int>? ids,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForPackageListCard;
    final body = {"package": ids};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      GeneralResponse data = GeneralResponse.fromJson(response.data);
      statusDynamic.data = data.data;
    } else {
      eeee(
          "getPaymentUrlForPackage  result bad:  packageListGetPaymentUrl ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> packagePayWithCashback({required int id}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForPackageCashback;
    final body = {"id": id};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee(
          "packagePayWithCashback result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> packagePayWithPromo({required int id}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForPackagePromo;
    final body = {"id": id};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee(
          "packagePayWithPromo result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> packagePayWithPromoCheck(
      {required int id}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForPackagePromoCheck;
    final body = {"id": id};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee(
          "packagePayWithPromoCheck result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  /////////////////////////////////////////
  //-------O---R---D----E----R-----------//
  /////////////////////////////////////////

  /// biri budu
  static Future<StatusDynamic> orderPay({required List<int> idList}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForOrderBalance;
    final body = {"order": idList};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee("orderPay result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> orderGetPaymentUrl(
      {required List<int> idList}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForOrderCard;
    final body = {"order": idList};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      GeneralResponse data = GeneralResponse.fromJson(response.data);
      statusDynamic.data = data.data;
    } else {
      eeee(
          "orderGetPaymentUrl  result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> orderListGetPaymentUrl(
      {required List<int> idList}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForOrderCard;
    final body = {"order": idList};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      GeneralResponse data = GeneralResponse.fromJson(response.data);
      statusDynamic.data = data.data;
    } else {
      eeee(
          "orderGetPaymentUrl  result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> orderPayWithCashback(
      {required List<int> idList}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForOrderCashback;
    final body = {"order": idList};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee(
          "orderPayWithCashback result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  /////////////////////////////////////////
  //-----C---O---U---R---I---E----R------//
  /////////////////////////////////////////

  static Future<StatusDynamic> courierPay({required int id}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForCourierBalance;
    var url = Uri.parse(api);
    final body = {"id": id};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee("courierPay result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> courierGetPaymentUrl({required int id}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForCourierCard;
    final body = {"id": id};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      GeneralResponse data = GeneralResponse.fromJson(response.data);
      statusDynamic.data = data.data;
    } else {
      eeee(
          "courierGetPaymentUrl  result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> courierPayWithCashback({required int id}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForCourierCashback;
    final body = {"id": id};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee(
          "courierPayWithCashback result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }
}
