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
    var url = Uri.parse(api);
    final body = {"amount": amount};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    eeee("body: ${body}");

    if (response.statusCode == ResultKey.responseSuccess) {
      GeneralResponse data = GeneralResponse.fromJson(response.data);
      statusDynamic.data = data.data;
    } else {
      eeee(
          "payment_balance order result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  //package
  static Future<StatusDynamic> packagePay({required int? id}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForPackageBalalnce + "?id=$id";
    var url = Uri.parse(api);
    final body = {};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee(
          "payForPackage order result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> packageGetPaymentUrl({
    required int? id,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForPackageCard + "?id=$id";
    var url = Uri.parse(api);
    final body = {};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      GeneralResponse data = GeneralResponse.fromJson(response.data);
      statusDynamic.data = data.data;
    } else {
      eeee(
          "getPaymentUrlForPackage  result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> packageListPay({required List<int>? ids}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForPackageListBalalnce;

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
    var url = Uri.parse(api);
    final body = {"id": id};
    final response = await dioAuth.dio.post(api, data: body);
    wtf("bura girdi3");
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      wtf("bura girdi");
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee(
          "packagePayWithCashback result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> packagePayWithPromo({required int id}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForPackagePromo;
    var url = Uri.parse(api);
    final body = {"id": id};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee(
          "packagePayWithPromo result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> packagePayWithPromoCheck(
      {required int id}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForPackagePromoCheck;
    var url = Uri.parse(api);
    final body = {"id": id};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee(
          "packagePayWithPromoCheck result bad:  url: $url  ,  response: ${response.data}");
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
    var url = Uri.parse(api);
    final body = {"order": idList};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee("orderPay result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> orderGetPaymentUrl(
      {required List<int> idList}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForOrderCard;
    var url = Uri.parse(api);
    final body = {"order": idList};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      GeneralResponse data = GeneralResponse.fromJson(response.data);
      statusDynamic.data = data.data;
    } else {
      eeee(
          "orderGetPaymentUrl  result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> orderListGetPaymentUrl(
      {required List<int> idList}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForOrderCard;
    var url = Uri.parse(api);
    final body = {"order": idList};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      GeneralResponse data = GeneralResponse.fromJson(response.data);
      statusDynamic.data = data.data;
    } else {
      eeee(
          "orderGetPaymentUrl  result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> orderPayWithCashback(
      {required List<int> idList}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForOrderCashback;
    var url = Uri.parse(api);
    final body = {"order": idList};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee(
          "orderPayWithCashback result bad:  url: $url  ,  response: ${response.data}");
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
    var url = Uri.parse(api);
    final body = {"id": id};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      GeneralResponse data = GeneralResponse.fromJson(response.data);
      statusDynamic.data = data.data;
    } else {
      eeee(
          "courierGetPaymentUrl  result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> courierPayWithCashback({required int id}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.payForCourierCashback;
    var url = Uri.parse(api);
    final body = {"id": id};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      //GeneralResponse data = GeneralResponse.fromJson(response.data);
      // statusDynamic.data = data.data;
    } else {
      statusDynamic.data = response.data['message'];
      eeee(
          "courierPayWithCashback result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }
}
