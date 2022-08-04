class Bonus {
  List<Data>? data;

  Bonus({this.data});

  Bonus.fromJson(Map<String, dynamic> json) {
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
  num? amount;
  int? used;
  String? type;
  String? deleteDays;

  Data({this.id, this.amount, this.used, this.type, this.deleteDays});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    used = json['used'];
    type = json['type'];
    deleteDays = json['delete_days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['used'] = this.used;
    data['type'] = this.type;
    data['delete_days'] = this.deleteDays;
    return data;
  }
}