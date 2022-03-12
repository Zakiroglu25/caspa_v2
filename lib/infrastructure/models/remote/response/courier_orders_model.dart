import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';

import 'regions_model.dart';

class CourierListModel {
  List<CourierOrder>? data;

  CourierListModel({this.data});

  CourierListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CourierOrder>[];
      json['data'].forEach((v) {
        data!.add(new CourierOrder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'CourierListModel{data: $data}';
  }
}

class CourierOrder {
  int? id;
  int? payment;
  int? delivery;
  String? phone;
  String? address;
  String? price;
  Region? region;
  double? usdPrice;
  String? date;
  String? updateDate;
  List<Package>? products;

  CourierOrder(
      {this.id,
      this.payment,
      this.delivery,
      this.phone,
      this.address,
      this.price,
      this.region,
      this.usdPrice,
      this.date,
      this.updateDate,
      this.products});

  CourierOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    payment = json['payment'];
    delivery = json['delivery'];
    phone = json['phone'];
    address = json['address'];
    price = json['price'];
    region =
        json['region'] != null ? new Region.fromJson(json['region']) : null;
    usdPrice = json['usd_price'];
    date = json['date'];
    updateDate = json['update_date'];
    if (json['products'] != null) {
      products = <Package>[];
      json['products'].forEach((v) {
        products!.add(new Package.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['payment'] = this.payment;
    data['delivery'] = this.delivery;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['price'] = this.price;
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    data['usd_price'] = this.usdPrice;
    data['date'] = this.date;
    data['update_date'] = this.updateDate;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Data{id: $id, payment: $payment, delivery: $delivery, phone: $phone, address: $address, price: $price, region: $region, usdPrice: $usdPrice, date: $date, updateDate: $updateDate, products: $products}';
  }
}

class Pivot {
  int? courierId;
  int? packageId;

  Pivot({this.courierId, this.packageId});

  Pivot.fromJson(Map<String, dynamic> json) {
    courierId = json['courier_id'];
    packageId = json['package_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courier_id'] = this.courierId;
    data['package_id'] = this.packageId;
    return data;
  }

  @override
  String toString() {
    return 'Pivot{courierId: $courierId, packageId: $packageId}';
  }
}
