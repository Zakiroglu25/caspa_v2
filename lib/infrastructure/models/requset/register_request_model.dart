
class RegisterRequestModel {
  String? name;
  String? surname;
  String? address;
  String? email;
  String? password;
  String? password_confirmation;
  String? phone;
  String? id_number;
  String? fin;
  DateTime? birthday;
  String? gender;
  int? wareHouse;
  int? accept;

  RegisterRequestModel({
      this.name,
      this.surname,
      this.address,
      this.email,
      this.password,
      this.password_confirmation,
      this.phone,
      this.id_number,
      this.fin,
      this.birthday,
      this.gender,
      this.wareHouse,
      this.accept});

  RegisterRequestModel.fromJson(Map<String,dynamic> json){
    name = json['name'] as String;
    name = json['surname'] as String;
    name = json['address'] as String;
    email = json['name'] as String;
    password = json['name'] as String;
    password_confirmation = json['name'] as String;
    phone = json['name'] as String;
    id_number = json['name'] as String;
    fin = json['name'] as String;
    birthday = DateTime.parse(json["birthday"].toString());
    gender = json['name'] as String;
    wareHouse = json['name'] as int;
    accept = json['name'] as int;
}

Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data['name'] =name;
    data['surname'] =surname;
    data['address'] =address;
    data['email'] =email;
    data['password_confirmation'] =password_confirmation;
    data['phone'] =phone;
    data['id_number'] =id_number;
    data['fin'] =fin;
    data['birthday'] =birthday;
    data['gender'] =gender;
    data['ware_house'] =wareHouse;
    data['accept'] =accept;
    return data;
}
}
