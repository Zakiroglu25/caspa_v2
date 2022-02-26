class SmsCodeData {
  List<SmsCode>? data;

  SmsCodeData({this.data});

  SmsCodeData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SmsCode>[];
      json['data'].forEach((v) {
        data!.add(new SmsCode.fromJson(v));
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

class SmsCode {
  int? id;
  String? time;
  String? code;

  SmsCode({this.id, this.time, this.code});

  SmsCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['name'];
    code = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = time;
    data['price'] = code;
    return data;
  }
}
