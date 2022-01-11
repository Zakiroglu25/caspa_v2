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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.promoCodeList != null) {
      data['data'] = this.promoCodeList!.map((v) => v.toJson()).toList();
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

  PromoCode({this.id, this.used, this.code});

  PromoCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    used = json['used'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['used'] = this.used;
    data['code'] = this.code;
    return data;
  }

  @override
  String toString() {
    return 'PromoCode{id: $id, used: $used, code: $code}';
  }
}