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
  String? date;
  String? code;

  SmsCode({this.date, this.code});

  SmsCode.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['date'] = date;
    data['code'] = code;
    return data;
  }
}
