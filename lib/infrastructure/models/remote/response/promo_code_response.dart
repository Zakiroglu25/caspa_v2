class PromoCodeData {
  List<PromoCode>? promoCodeList;

  PromoCodeData({this.promoCodeList});

  PromoCodeData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      promoCodeList = <PromoCode>[];
      json['data'].forEach((v) {
        promoCodeList!.add(new PromoCode.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (promoCodeList != null) {
      data['data'] = promoCodeList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'PromoCodeData{promoCodeList: $promoCodeList}';
  }
}

class PromoCode {
  int? id;
  int? used;
  String? code;
  String? date;

  PromoCode({this.id, this.used, this.code, this.date});

  PromoCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    used = json['used'];
    code = json['code'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['used'] = used;
    data['code'] = code;
    data['date'] = date;
    return data;
  }

  @override
  String toString() {
    return 'PromoCode{id: $id, used: $used, code: $code, date: $date}';
  }
}
