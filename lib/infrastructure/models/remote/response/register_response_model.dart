class RegisterResponseModel {
  String? message;
  Errors? errors;

  RegisterResponseModel({this.message, this.errors});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'RegisterResponseModel{message: $message, errors: $errors}';
  }
}

class Errors {
  List<String>? email;
  List<String>? phone;
  List<String>? idNumber;
  List<String>? fin;

  Errors({this.email, this.phone, this.idNumber, this.fin});

  Errors.fromJson(Map<String, dynamic> json) {
    email = json['email'].cast<String>();
    phone = json['phone'].cast<String>();
    idNumber = json['id_number'].cast<String>();
    fin = json['fin'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['id_number'] = this.idNumber;
    data['fin'] = this.fin;
    return data;
  }

  @override
  String toString() {
    return 'Errors{email: $email, phone: $phone, idNumber: $idNumber, fin: $fin}';
  }
}