import '../remote/response/packages_data.dart';

class MyUser {
  int? id;
  String? username;
  String? name;
  String? surname;
  String? fullName;
  String? email;
  String? phone;
  String? idNumber;
  String? fin;
  String? birthday;
  String? gender;
  String? avatar;
  String? address;
  String? balance;
  num? cashback_balance;
  String? cargoBalance;
  City? city;
  int? business;
  WareHouse? wareHouse;
  String? taxNumber;
  String? companyName;
  String? monthly;
  int? packages_count;
  int? active_package_count;
  List<MyNotification>? notifications;
  // List<ActivePackages>? activePackages;
  List<Package>? activePackages;

  MyUser(
      {this.id,
      this.active_package_count,
      this.cashback_balance,
      this.username,
      this.name,
      this.surname,
      this.fullName,
      this.email,
      this.phone,
      this.idNumber,
      this.fin,
      this.birthday,
      this.gender,
      this.avatar,
      this.address,
      this.balance,
      this.cargoBalance,
      this.city,
      this.business,
      this.wareHouse,
      this.taxNumber,
      this.monthly,
      this.notifications,
      this.packages_count,
      this.companyName,
      this.activePackages});

  MyUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    surname = json['surname'];
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    idNumber = json['id_number'];
    fin = json['fin'];
    birthday = json['birthday'];
    gender = json['gender'];
    avatar = json['avatar'];
    if (json['notifications'] != null) {
      notifications = <MyNotification>[];
      json['notifications'].forEach((v) {
        notifications!.add(MyNotification.fromJson(v));
      });
    } else {
      notifications = <MyNotification>[];
    }
    ;
    address = json['address'];
    balance = json['balance'];
    cashback_balance = json['cashback_balance'];
    packages_count = json['packages_count'];
    monthly = json['monthly'];
    cargoBalance = json['cargoBalance'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    business = json['business'];
    wareHouse = json['wareHouse'] != null
        ? WareHouse.fromJson(json['wareHouse'])
        : null;
    taxNumber = json['taxNumber'];
    companyName = json['companyName'];
    active_package_count = json['active_package_count'];
    if (json['active_packages'] != null) {
      activePackages = <Package>[];
      // json['active_packages'].forEach((v) {
      //   activePackages!.add(new ActivePackages.fromJson(v));
      // });

      json['active_packages'].forEach((v) {
        activePackages!.add(Package.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['username'] = username;
    data['name'] = name;
    data['surname'] = surname;
    data['fullName'] = fullName;
    data['cashback_balance'] = cashback_balance;
    data['email'] = email;
    data['phone'] = phone;
    data['id_number'] = idNumber;
    data['fin'] = fin;
    data['birthday'] = birthday;
    data['notifications'] = notifications;
    data['packages_count'] = packages_count;
    data['monthly'] = monthly;
    data['gender'] = gender;
    data['avatar'] = avatar;
    data['address'] = address;
    data['balance'] = balance;
    data['cargoBalance'] = cargoBalance;
    data['active_package_count'] = active_package_count;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    data['business'] = business;
    if (wareHouse != null) {
      data['wareHouse'] = wareHouse!.toJson();
    }
    data['taxNumber'] = taxNumber;
    data['companyName'] = companyName;
    if (notifications != null) {
      data['notifications'] = notifications!.map((v) => v.toJson()).toList();
    }
    ;
    if (activePackages != null) {
      data['active_packages'] = activePackages!.map((v) => v.toJson()).toList();
    }
    ;
    return data;
  }

  @override
  String toString() {
    return 'MyUser{id: $id, username: $username, name: $name, surname: $surname, fullName: $fullName, email: $email, phone: $phone, idNumber: $idNumber, fin: $fin, birthday: $birthday, gender: $gender, avatar: $avatar, address: $address, balance: $balance, cashback_balance: $cashback_balance, cargoBalance: $cargoBalance, city: $city, business: $business, wareHouse: $wareHouse, taxNumber: $taxNumber, companyName: $companyName, monthly: $monthly, packages_count: $packages_count, notifications: $notifications}';
  }
}

class City {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? price;

  City({this.id, this.createdAt, this.updatedAt, this.name, this.price});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    data['price'] = price;
    return data;
  }

  @override
  String toString() {
    return 'City{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, price: $price}';
  }
}

class WareHouse {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? cityId;
  String? name;

  WareHouse({this.id, this.createdAt, this.updatedAt, this.cityId, this.name});

  WareHouse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cityId = json['city_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['city_id'] = cityId;
    data['name'] = name;
    return data;
  }

  @override
  String toString() {
    return 'WareHouse{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, cityId: $cityId, name: $name}';
  }
}

class MyNotification {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? userId;
  String? title;
  String? description;
  int? read;

  MyNotification(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.title,
      this.description,
      this.read});

  MyNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    read = json['read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_id'] = userId;
    data['title'] = title;
    data['description'] = description;
    data['read'] = read;
    return data;
  }

  @override
  String toString() {
    return 'MyNotification{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, title: $title, description: $description, read: $read}';
  }
}

class ActivePackages {
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
  String? note;
  Null? regNumber;
  int? noInvoice;
  String? fromReport;
  int? categoryId;
  String? invoice;
  String? date;
  List<Archive>? archive;

  ActivePackages(
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
      this.note,
      this.regNumber,
      this.noInvoice,
      this.fromReport,
      this.categoryId,
      this.invoice,
      this.date,
      this.archive});

  ActivePackages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    cargoTracking = json['cargo_tracking'];
    tracking = json['tracking'];
    store = json['store'];
    price = json['price'];
    cargoPrice = json['cargo_price'];
    weight = json['weight'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    payment = json['payment'];
    note = json['note'];
    regNumber = json['regNumber'];
    noInvoice = json['no_invoice'];
    fromReport = json['from_report'];
    categoryId = json['category_id'];
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data['note'] = note;
    data['regNumber'] = regNumber;
    data['no_invoice'] = noInvoice;
    data['from_report'] = fromReport;
    data['category_id'] = categoryId;
    data['invoice'] = invoice;
    data['date'] = date;
    if (archive != null) {
      data['archive'] = archive!.map((v) => v.toJson()).toList();
    }
    return data;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    data['parent_id'] = parentId;
    data['goods_id'] = goodsId;
    return data;
  }
}
