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
  String? cargoTracking;
  String? tracking;
  String? store;
  String? price;
  String? cargoPrice;
  double? weight;
  Category? category;
  Country? country;
  int? payment;
  String? invoice;
  String? date;
  List<Archive>? archive;

  Package(
      {this.id,
      this.status,
      this.cargoTracking,
      this.tracking,
      this.store,
      this.price,
      this.cargoPrice,
      this.weight,
      this.category,
      this.country,
      this.payment,
      this.invoice,
      this.date,
      this.archive});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    cargoTracking = json['cargo_tracking'];
    tracking = json['tracking'];
    store = json['store'];
    price = json['price'];
    cargoPrice = json['cargo_price'];
    weight = json['weight'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    payment = json['payment'];
    invoice = json['invoice'];
    date = json['date'];
    if (json['archive'] != null) {
      archive = <Archive>[];
      json['archive'].forEach((v) {
        archive!.add(Archive.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['status'] = status;
    data['cargo_tracking'] = cargoTracking;
    data['tracking'] = tracking;
    data['store'] = store;
    data['price'] = price;
    data['cargo_price'] = cargoPrice;
    data['weight'] = weight;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (country != null) {
      data['country'] = country!.toJson();
    }
    data['payment'] = payment;
    data['invoice'] = invoice;
    data['date'] = date;
    if (archive != null) {
      data['archive'] = archive!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Package{id: $id, status: $status, cargoTracking: $cargoTracking, tracking: $tracking, store: $store, price: $price, cargoPrice: $cargoPrice, weight: $weight, category: $category, country: $country, payment: $payment, invoice: $invoice, date: $date, archive: $archive}';
  }
}

class Category {
  int? id;

  int? parentId;
  int? goodsId;
  String? createdAt;
  String? updatedAt;
  String? name;

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
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    data['parent_id'] = parentId;
    data['goods_id'] = goodsId;
    return data;
  }

  @override
  String toString() {
    return 'Category{id: $id, parentId: $parentId, goodsId: $goodsId, createdAt: $createdAt, updatedAt: $updatedAt, name: $name}';
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
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    data['icon'] = icon;
    data['sort_order'] = sortOrder;
    data['address'] = address;
    if (fields != null) {
      data['fields'] = fields!.toJson();
    }
    data['active'] = active;
    return data;
  }

  @override
  String toString() {
    return 'Country{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, icon: $icon, sortOrder: $sortOrder, address: $address, fields: $fields, active: $active}';
  }
}

class Fields {
  String? il;
  String? ilche;
  String? mahalle;
  String? telefon;
  String? tcKimlik;
  String? postaKodu;
  String? adresBaL;

  Fields(
      {this.il,
      this.ilche,
      this.mahalle,
      this.telefon,
      this.tcKimlik,
      this.postaKodu,
      this.adresBaL});

  Fields.fromJson(Map<String, dynamic> json) {
    il = json['İl'];
    ilche = json['İlçe'];
    mahalle = json['Mahalle'];
    telefon = json['Telefon'];
    tcKimlik = json['Tc kimlik'];
    postaKodu = json['Posta Kodu'];
    adresBaL = json['Adres Başlığı'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['İl'] = il;
    data['İlçe'] = ilche;
    data['Mahalle'] = mahalle;
    data['Telefon'] = telefon;
    data['Tc kimlik'] = tcKimlik;
    data['Posta Kodu'] = postaKodu;
    data['Adres Başlığı'] = adresBaL;
    return data;
  }

  @override
  String toString() {
    return 'Fields{il: $il, ilche: $ilche, mahalle: $mahalle, telefon: $telefon, tcKimlik: $tcKimlik, postaKodu: $postaKodu, adresBaL: $adresBaL}';
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
    data['status'] = status;
    data['date'] = date;
    return data;
  }

  @override
  String toString() {
    return 'Archive{status: $status, date: $date}';
  }
}
