class CourierListModel {
  List<Data>? data;

  CourierListModel({this.data});

  CourierListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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
}

class Data {
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
  List<Products>? products;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
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
}

class Region {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? price;

  Region({this.id, this.createdAt, this.updatedAt, this.name, this.price});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

class Products {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? tracking;
  String? cargoTracking;
  Null? orderNumber;
  String? invoice;
  String? note;
  Null? orderDate;
  int? countryId;
  String? store;
  int? categoryId;
  String? price;
  double? weight;
  Null? size;
  Null? name;
  String? status;
  int? qty;
  String? cargoPrice;
  int? wareHouseId;
  int? userId;
  int? payment;
  int? urgent;
  int? commission;
  String? fromReport;
  Null? regNumber;
  String? wardrobe;
  int? noInvoice;
  String? currency;
  int? courier;
  Null? width;
  Null? length;
  Null? height;
  int? opened;
  Null? whichAdmin;
  Pivot? pivot;

  Products(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.tracking,
        this.cargoTracking,
        this.orderNumber,
        this.invoice,
        this.note,
        this.orderDate,
        this.countryId,
        this.store,
        this.categoryId,
        this.price,
        this.weight,
        this.size,
        this.name,
        this.status,
        this.qty,
        this.cargoPrice,
        this.wareHouseId,
        this.userId,
        this.payment,
        this.urgent,
        this.commission,
        this.fromReport,
        this.regNumber,
        this.wardrobe,
        this.noInvoice,
        this.currency,
        this.courier,
        this.width,
        this.length,
        this.height,
        this.opened,
        this.whichAdmin,
        this.pivot});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tracking = json['tracking'];
    cargoTracking = json['cargo_tracking'];
    orderNumber = json['order_number'];
    invoice = json['invoice'];
    note = json['note'];
    orderDate = json['order_date'];
    countryId = json['country_id'];
    store = json['store'];
    categoryId = json['category_id'];
    price = json['price'];
    weight = json['weight'];
    size = json['size'];
    name = json['name'];
    status = json['status'];
    qty = json['qty'];
    cargoPrice = json['cargo_price'];
    wareHouseId = json['ware_house_id'];
    userId = json['user_id'];
    payment = json['payment'];
    urgent = json['urgent'];
    commission = json['commission'];
    fromReport = json['from_report'];
    regNumber = json['regNumber'];
    wardrobe = json['wardrobe'];
    noInvoice = json['no_invoice'];
    currency = json['currency'];
    courier = json['courier'];
    width = json['width'];
    length = json['length'];
    height = json['height'];
    opened = json['opened'];
    whichAdmin = json['which_admin'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['tracking'] = this.tracking;
    data['cargo_tracking'] = this.cargoTracking;
    data['order_number'] = this.orderNumber;
    data['invoice'] = this.invoice;
    data['note'] = this.note;
    data['order_date'] = this.orderDate;
    data['country_id'] = this.countryId;
    data['store'] = this.store;
    data['category_id'] = this.categoryId;
    data['price'] = this.price;
    data['weight'] = this.weight;
    data['size'] = this.size;
    data['name'] = this.name;
    data['status'] = this.status;
    data['qty'] = this.qty;
    data['cargo_price'] = this.cargoPrice;
    data['ware_house_id'] = this.wareHouseId;
    data['user_id'] = this.userId;
    data['payment'] = this.payment;
    data['urgent'] = this.urgent;
    data['commission'] = this.commission;
    data['from_report'] = this.fromReport;
    data['regNumber'] = this.regNumber;
    data['wardrobe'] = this.wardrobe;
    data['no_invoice'] = this.noInvoice;
    data['currency'] = this.currency;
    data['courier'] = this.courier;
    data['width'] = this.width;
    data['length'] = this.length;
    data['height'] = this.height;
    data['opened'] = this.opened;
    data['which_admin'] = this.whichAdmin;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
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
}