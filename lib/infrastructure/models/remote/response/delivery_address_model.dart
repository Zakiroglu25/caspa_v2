import 'regions_model.dart';

class DeliveryAdressResponse {
  List<DeliveryAddress>? data;

  DeliveryAdressResponse({this.data});

  DeliveryAdressResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DeliveryAddress>[];
      json['data'].forEach((v) {
        data!.add(new DeliveryAddress.fromJson(v));
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
    return 'DeliveryAdressResponse{data: $data}';
  }
}

class DeliveryAddress {
  int? id;
  String? name;
  Region? region;
  String? phone;
  String? address;

  DeliveryAddress({this.id, this.name, this.region, this.phone, this.address});

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    region =
        json['region'] != null ? new Region.fromJson(json['region']) : null;
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    data['phone'] = this.phone;
    data['address'] = this.address;
    return data;
  }

  @override
  String toString() {
    return 'DeliveryAddress{id: $id, name: $name, region: $region, phone: $phone, address: $address}';
  }
}
