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
  List<Notifications>? notifications;

  MyUser(
      {this.id,
      this.cashback_balance,
        this.notifications,
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
      this.packages_count,
      this.companyName});

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
    address = json['address'];
    balance = json['balance'];
    cashback_balance = json['cashback_balance'];
    packages_count = json['packages_count'];
    monthly = json['monthly'];
    cargoBalance = json['cargoBalance'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    business = json['business'];
    wareHouse = json['wareHouse'] != null
        ? new WareHouse.fromJson(json['wareHouse'])
        : null;
    taxNumber = json['taxNumber'];
    companyName = json['companyName'];
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(new Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['fullName'] = this.fullName;
    data['cashback_balance'] = this.cashback_balance;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['id_number'] = this.idNumber;
    data['fin'] = this.fin;
    data['birthday'] = this.birthday;
    data['packages_count'] = this.packages_count;
    data['monthly'] = this.monthly;
    data['gender'] = this.gender;
    data['avatar'] = this.avatar;
    data['address'] = address;
    data['balance'] = this.balance;
    data['cargoBalance'] = this.cargoBalance;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['business'] = this.business;
    if (this.wareHouse != null) {
      data['wareHouse'] = this.wareHouse!.toJson();
    }
    data['taxNumber'] = this.taxNumber;
    data['companyName'] = this.companyName;
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'MyUser{id: $id, username: $username, name: $name, surname: $surname, fullName: $fullName, email: $email, phone: $phone, idNumber: $idNumber, fin: $fin, birthday: $birthday, gender: $gender, avatar: $avatar, address: $address, balance: $balance, cashback_balance: $cashback_balance, cargoBalance: $cargoBalance, city: $city, business: $business, wareHouse: $wareHouse, taxNumber: $taxNumber, companyName: $companyName, monthly: $monthly, packages_count: $packages_count}';
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
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['price'] = this.price;
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
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['city_id'] = this.cityId;
    data['name'] = this.name;
    return data;
  }

  @override
  String toString() {
    return 'WareHouse{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, cityId: $cityId, name: $name}';
  }
}

class Notifications {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? userId;
  String? title;
  String? description;
  int? read;

  Notifications(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.title,
      this.description,
      this.read});

  Notifications.fromJson(Map<String, dynamic> json) {
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
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['read'] = this.read;
    return data;
  }
}
