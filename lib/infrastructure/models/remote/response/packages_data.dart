class PackagesData {
  List<Package>? data;

  PackagesData({this.data});

  PackagesData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Package>[];
      json['data'].forEach((v) {
        data!.add(new Package.fromJson(v));
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
    return 'PackagesData{data: $data}';
  }
}

class Package {
  int? id;
  String? status;
  String? customStatus;
  String? cargoTracking;
  String? tracking;
  String? store;
  String? price;
  String? cargoPrice;
  num? weight;
  Category? category;
  Country? country;
  int? payment;
  String? note;
  String? regNumber;
  String? from_report;
  int? noInvoice;
  String? invoice;
  String? date;
  List<Archive>? archive;

  Package(
      {this.id,
      this.status,
      this.cargoTracking,
      this.tracking,
      this.store,
      this.customStatus,
      this.price,
      this.cargoPrice,
      this.weight,
      this.category,
      this.country,
      this.payment,
      this.from_report,
      this.note,
      this.regNumber,
      this.noInvoice,
      this.invoice,
      this.date,
      this.archive});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    cargoTracking = json['cargo_tracking'];
    tracking = json['tracking'];
    store = json['store'];
    from_report = json['from_report'];
    price = json['price'];
    cargoPrice = json['cargo_price'];
    weight = json['weight'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    payment = json['payment'];
    note = json['note'];
    regNumber = json['regNumber'];
    customStatus = json['customStatus'];
    noInvoice = json['no_invoice'];
    invoice = json['invoice'];
    date = json['date'];
    if (json['archive'] != null) {
      archive = <Archive>[];
      json['archive'].forEach((v) {
        archive!.add(new Archive.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['cargo_tracking'] = this.cargoTracking;
    data['tracking'] = this.tracking;
    data['store'] = this.store;
    data['from_report'] = this.from_report;
    data['customStatus'] = this.customStatus;
    data['price'] = this.price;
    data['cargo_price'] = this.cargoPrice;
    data['weight'] = this.weight;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['payment'] = this.payment;
    data['note'] = this.note;
    data['regNumber'] = this.regNumber;
    data['no_invoice'] = this.noInvoice;
    data['invoice'] = this.invoice;
    data['date'] = this.date;
    if (this.archive != null) {
      data['archive'] = this.archive!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Package{id: $id, status: $status, customStatus: $customStatus, cargoTracking: $cargoTracking, tracking: $tracking, store: $store, price: $price, cargoPrice: $cargoPrice, weight: $weight, category: $category, country: $country, payment_balance: $payment, note: $note, regNumber: $regNumber, from_report: $from_report, noInvoice: $noInvoice, invoice: $invoice, date: $date, archive: $archive}';
  }
}

class Category {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  int? parentId;
  int? goodsId;

  Category(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.parentId,
      this.goodsId});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    parentId = json['parent_id'];
    goodsId = json['goods_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['parent_id'] = this.parentId;
    data['goods_id'] = this.goodsId;
    return data;
  }

  @override
  String toString() {
    return 'Category{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, parentId: $parentId, goodsId: $goodsId}';
  }
}

class Country {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? icon;
  int? sortOrder;
  String? address;
  Fields? fields;
  int? active;

  Country(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.icon,
      this.sortOrder,
      this.address,
      this.fields,
      this.active});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    icon = json['icon'];
    sortOrder = json['sort_order'];
    address = json['address'];
    fields =
        json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['sort_order'] = this.sortOrder;
    data['address'] = this.address;
    if (this.fields != null) {
      data['fields'] = this.fields!.toJson();
    }
    data['active'] = this.active;
    return data;
  }

  @override
  String toString() {
    return 'Country{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, icon: $icon, sortOrder: $sortOrder, address: $address, fields: $fields, active: $active}';
  }
}

class Fields {
  String? l;
  String? lE;
  String? mahalle;
  String? telefon;
  String? tcKimlik;
  String? postaKodu;
  String? adresBaL;

  Fields(
      {this.l,
      this.lE,
      this.mahalle,
      this.telefon,
      this.tcKimlik,
      this.postaKodu,
      this.adresBaL});

  Fields.fromJson(Map<String, dynamic> json) {
    l = json['İl'];
    lE = json['İlçe'];
    mahalle = json['Mahalle'];
    telefon = json['Telefon'];
    tcKimlik = json['Tc kimlik'];
    postaKodu = json['Posta Kodu'];
    adresBaL = json['Adres Başlığı'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['İl'] = this.l;
    data['İlçe'] = this.lE;
    data['Mahalle'] = this.mahalle;
    data['Telefon'] = this.telefon;
    data['Tc kimlik'] = this.tcKimlik;
    data['Posta Kodu'] = this.postaKodu;
    data['Adres Başlığı'] = this.adresBaL;
    return data;
  }

  @override
  String toString() {
    return 'Fields{l: $l, lE: $lE, mahalle: $mahalle, telefon: $telefon, tcKimlik: $tcKimlik, postaKodu: $postaKodu, adresBaL: $adresBaL}';
  }
}

class Archive {
  String? status;
  String? date;

  Archive({this.status, this.date});

  Archive.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['date'] = this.date;
    return data;
  }

  @override
  String toString() {
    return 'Archive{status: $status, date: $date}';
  }
}
