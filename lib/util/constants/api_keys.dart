// Flutter imports:
import 'dart:io';

class ApiKeys {
  ApiKeys._();

  static const baseUrl = 'https://caspa.az/api';
  static const bigDataCloud = 'https://api.bigdatacloud.net/data';
  static const googleMap = 'https://maps.googleapis.com/maps/api/geocode';

  ///delete
  static const headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  //reg and login
  static const login = "$baseUrl/user/login";
  static const registerPersonal = "$baseUrl/user/register";
  static const registerCompany = "$baseUrl/user/company/register";

  //report
  static const report = "$baseUrl/user/report";
  static const editReport = "$baseUrl/user/report/edit";
  static const deleteReport = "$baseUrl/user/report/delete";
  static const orderViaLink = "$baseUrl/user/orders";
  static const orderViaLinkEdit = "$baseUrl/user/orders/edit";
  static const orderViaLinkDelete = "$baseUrl/user/orders/delete";

  //user
  static const user = "$baseUrl/user/user";
  static const updateAccount = "$baseUrl/user/account";
  static const updateAvatar = "$baseUrl/user/avatar";

  //general
  static const shop = '$baseUrl/public/stores';
  static const commission = '$baseUrl/public/order/commission';
  static const regions = '$baseUrl/public/regions';
  static const localityInfoBigData = '$bigDataCloud/reverse-geocode-client';
  static const localityInfoGoogleMap = '$googleMap/json';

  static const smsCodes = '$baseUrl/public/sms';
  static const wares = '$baseUrl/public/wares';

  //packages
  static const allPackages = '$baseUrl/user/packages';
  static const packagesForCourier = '$baseUrl/user/couriers/packages';
  static const addCourier = '$baseUrl/user/couriers';
  static const editCourier = '$baseUrl/user/couriers/edit';
  static const packagesStatuses = '$baseUrl/user/statuses';
  static const packagesArchive = '$baseUrl/user/package/archive';
  static const packagesActives = '$baseUrl/user/package/actives';

  //adress
  static const addresses = '$baseUrl/user/addresses';
  static const editAddresses = '$baseUrl/user/address/edit';
  static const deleteAddress = '$baseUrl/user/address/delete';
  static const addAddress = '$baseUrl/user/address/add';

  //------------------local-------------------------
  static const youtubeIMG = "https://img.youtube.com/";
  static const youtube = "https://youtube.com/";
  static const vi = "vi/";
  static const defaultJPG = "/hqdefault.jpg";
  static const watch = "/watch?v=";

  //get tarif
  static const tariff = "$baseUrl/public/prices";

  //get ads
  static const ads = "$baseUrl/public/ads";

  //get category
  static const categories = "$baseUrl/public/categories";

  //get address
  static const getAddress = "$baseUrl/public/countries";

  //add Etibarname
  static const addAttorneys = "$baseUrl/user/attorneys";
  static const deleteAttorneys = "$baseUrl/user/attorneys/delete";
  static const editAttorneys = "$baseUrl/user/attorneys/edit";

  //forgot
  static const forgotOtp = "$baseUrl/user/otp";
  static const forgotOtpApprove = "$baseUrl/user/otp/approve";

  //contact
  static const contact = "$baseUrl/public/contacts";

  //promoCode
  static const promoCodes = "$baseUrl/user/promos";
  static const addPromoCode = "$baseUrl/user/promo";
  static const checkPromoCode = "$baseUrl/user/promo/check";

//courier
  static const courierList = "$baseUrl/user/couriers";
  static const deleteCourier = "$baseUrl/user/couriers/delete";

  //gift
  static const giftList = "$baseUrl/user/gifts";
  static const addGiftCode = "$baseUrl/user/gift";

  //payment_balance
  static const paymentOrder = "$baseUrl/user/order/balance";
  static const paymentCargo = "$baseUrl/user/cargo/balance";

  //calculate kg
  static const calculateKg = "$baseUrl/public/calculator";

  //pay package
  static const payForPackageBalalnce = "$baseUrl/user/package/payment";
  static const payForPackageListBalalnce = "$baseUrl/user/package/payment/bulk";
  static const payForPackageCard = "$baseUrl/user/package/payment/card";
  static const payForPackageListCard =
      "$baseUrl/user/package/payment/card/bulk";
  static const payForPackageCashback = "$baseUrl/user/package/payment/bonus";
  static const payForPackagePromo = "$baseUrl/user/package/payment/promo";

  //check for promo
  static const payForPackagePromoCheck =
      "$baseUrl/user/package/payment/promo/check";

  //pay order
  static const payForOrderBalance = "$baseUrl/user/orders/balance";
  static const payForOrderCard = "$baseUrl/user/orders/card";
  static const payForOrderCashback = "$baseUrl/user/orders/cashback";

  //pay courier
  static const payForCourierBalance = "$baseUrl/user/courier/balance";
  static const payForCourierCard = "$baseUrl/user/courier/card";
  static const payForCourierCashback = "$baseUrl/user/courier/cashback";

  //notification
  static const deleteNotification = "$baseUrl/user/delete/notification";

  //bonus
  static const bonus = "$baseUrl/user/bonus";

  static loginBody({
    required String? email,
    required String? password,
    required String? device_name,
    required String? language,
    required int? deviceTypeId,
    required String? deviceCode,
  }) {
    //
    final map = {
      "email": email,
      "password": password,
      "device_name": device_name,
      "deviceName": device_name,
      "deviceTypeId": deviceTypeId,
      "deviceCode": deviceCode,
      "language": language,
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static orderViaLinkBody({
    required String? link,
    required double? price,
    required double? cargo_price,
    required String? detail,
    required int? qty,
    int? id,
  }) {
    //
    final map = {
      "link": link,
      "id": id,
      "qty": qty,
      "price": price,
      "cargo_price": cargo_price,
      "detail": detail,
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static addressBody({
    required int? id,
    required int? region,
    required String name,
    required String phone,
    required String address,
  }) {
    //
    final map = {
      "id": id,
      "region": region,
      "phone": phone,
      "address": address,
      "name": name,
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static registrationBusinessBody({
    required String? name,
    required String? surname,
    required String? address,
    required String? email,
    required String? language,
    required String? deviceCode,
    required int? deviceTypeId,
    required String? password,
    required String? password_confirmation,
    required String? phone,
    required int? accept,
    required String? company_name,
    required String? tax_number,
  }) {
    //
    final map = {
      "name": name,
      "surname": surname,
      "address": address,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
      "phone": phone,
      "accept": 1,
      "company_name": company_name,
      "tax_number": tax_number,
      "deviceCode": deviceCode,
      "deviceTypeId": deviceTypeId,
      "language": language,
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static reportBody({
    required String? store,
    required int? qty,
    required int? category,
    required String? tracking,
    required double? price,
    required String? currency,
    required File? invoice,
    required String? note,
  }) {
    //
    final Map<String, dynamic> map = {
      "store": store,
      "qty": qty,
      "category": category,
      "tracking": tracking,
      "price": price,
      "currency": currency,
      "note": note,
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static registrationPersonalBody({
    required String? name,
    required String? surname,
    required String? address,
    required String? language,
    required String? deviceCode,
    required int? deviceTypeId,
    required String? email,
    required String? password,
    required String? password_confirmation,
    required String? phone,
    required int? accept,
    required String? id_number,
    required String? fin,
    required String? birthday,
    required String? gender,
    required int? ware_house,
  }) {
    final map = {
      "name": name,
      "surname": surname,
      "address": address,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
      "phone": phone,
      "accept": 1,
      "id_number": id_number,
      "fin": fin,
      "birthday": birthday,
      "gender": gender,
      "ware_house": ware_house,
      "deviceCode": deviceCode,
      "deviceTypeId": deviceTypeId,
      "language": language
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static updateAccountBody({
    required String? address,
    required String? language,
    required String? email,
    required String? password,
    required String? old_password,
    required String? password_confirmation,
    required String? phone,
    required String? id_number,
    required String? fin,
    required String? birthday,
    required String? company_name,
    required String? tax_number,
    required int? ware_house,
  }) {
    final map = {
      "password": password,
      "password_confirmation": password_confirmation,
      "birthday": birthday,
      "id_number": id_number,
      "fin": fin,
      "city": 1,
      "address": address,
      "email": email,
      "company_name": company_name,
      "tax_number": tax_number,
      "phone": phone,
      "ware_house": ware_house,
      "language": language
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static header({
    required String? token,
  }) {
    //
    final map = {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
      //'Bearer 767|sCxXpk9PKU5QdCKcaLBh2Tj3t5QG0gQYOqLTcY8f',
      "Content-Type": "application/json",
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }
}
