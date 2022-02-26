class CourierOrdersListResponse {
  List<CourierOrder>? data;

  CourierOrdersListResponse({this.data});

  CourierOrdersListResponse.fromJson(Map<String, dynamic> json) {
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
    return 'CourierOrdersListResponse{data: $data}';
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
  List<Products>? products;

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

  @override
  String toString() {
    return 'CourierOrder{id: $id, payment: $payment, delivery: $delivery, phone: $phone, address: $address, price: $price, region: $region, usdPrice: $usdPrice, date: $date, updateDate: $updateDate, products: $products}';
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

  @override
  String toString() {
    return 'Region{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, price: $price}';
  }
}

class Products {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? tracking;
  String? cargoTracking;
  int? orderNumber;
  String? invoice;
  String? note;
  String? orderDate;
  int? countryId;
  String? store;
  int? categoryId;
  String? price;
  double? weight;
  num? size;
  String? name;
  String? status;
  int? qty;
  String? cargoPrice;
  int? wareHouseId;
  int? userId;
  int? payment;
  int? urgent;
  int? commission;
  String? fromReport;
  String? regNumber;
  String? wardrobe;
  int? noInvoice;
  String? currency;
  int? courier;
  String? width;
  String? length;
  String? height;
  int? opened;
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
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Products{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, tracking: $tracking, cargoTracking: $cargoTracking, orderNumber: $orderNumber, invoice: $invoice, note: $note, orderDate: $orderDate, countryId: $countryId, store: $store, categoryId: $categoryId, price: $price, weight: $weight, size: $size, name: $name, status: $status, qty: $qty, cargoPrice: $cargoPrice, wareHouseId: $wareHouseId, userId: $userId, payment: $payment, urgent: $urgent, commission: $commission, fromReport: $fromReport, regNumber: $regNumber, wardrobe: $wardrobe, noInvoice: $noInvoice, currency: $currency, courier: $courier, width: $width, length: $length, height: $height, opened: $opened, pivot: $pivot}';
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
