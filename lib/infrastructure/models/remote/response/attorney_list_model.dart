class AttorneyListModel {
  List<Attorney>? data;

  AttorneyListModel({required this.data});

  AttorneyListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Attorney>[];
      json['data'].forEach((v) {
        data!.add(Attorney.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attorney {
  int? id;
  String? fullName;
  String? fatherName;
  String? idNumber;
  String? fin;
  String? birthday;
  String? phone;

  Attorney(
      {this.id,
        this.fullName,
        this.fatherName,
        this.idNumber,
        this.fin,
        this.birthday,
        this.phone});

  Attorney.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    fatherName = json['father_name'];
    idNumber = json['id_number'];
    fin = json['fin'];
    birthday = json['birthday'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['father_name'] = fatherName;
    data['id_number'] = idNumber;
    data['fin'] = fin;
    data['birthday'] = birthday;
    data['phone'] = phone;
    return data;
  }

  @override
  String toString() {
    return 'Data{id: $id, fullName: $fullName, fatherName: $fatherName, idNumber: $idNumber, fin: $fin, birthday: $birthday, phone: $phone}';
  }
}