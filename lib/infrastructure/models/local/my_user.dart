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
  String? cargoBalance;
  City? city;
  int? business;
  WareHouse? wareHouse;
  int? taxNumber;
  String? companyName;

  MyUser(
      {this.id,
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
    cargoBalance = json['cargoBalance'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    business = json['business'];
    wareHouse = json['wareHouse'] != null
        ? new WareHouse.fromJson(json['wareHouse'])
        : null;
    taxNumber = json['taxNumber'];
    companyName = json['companyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['id_number'] = this.idNumber;
    data['fin'] = this.fin;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['avatar'] = this.avatar;
    data['address'] = this.address;
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
    return data;
  }

  @override
  String toString() {
    return 'MyUser{id: $id, username: $username, name: $name, surname: $surname, fullName: $fullName, email: $email, phone: $phone, idNumber: $idNumber, fin: $fin, birthday: $birthday, gender: $gender, avatar: $avatar, address: $address, balance: $balance, cargoBalance: $cargoBalance, city: $city, business: $business, wareHouse: $wareHouse, taxNumber: $taxNumber, companyName: $companyName}';
  }
}

class City {
  int    ?id;
  String ?createdAt;
  String ?updatedAt;
  String ?name;
  String ?price;

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
  int ?id;
  String? createdAt;
  String ?updatedAt;
  int    ?cityId;
  String ?name;

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