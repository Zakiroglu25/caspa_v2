class GiftBalanceData {
  List<GiftBalance>? giftBalanceList;

  GiftBalanceData({this.giftBalanceList});

  GiftBalanceData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      giftBalanceList = <GiftBalance>[];
      json['data'].forEach((v) {
        giftBalanceList!.add(new GiftBalance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.giftBalanceList != null) {
      data['data'] = this.giftBalanceList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'GiftBalanceData{giftBalanceList: $giftBalanceList}';
  }
}

class GiftBalance {
  int? id;
  String? code;

  GiftBalance({this.id, this.code});

  GiftBalance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    return data;
  }

  @override
  String toString() {
    return 'Data{id: $id, code: $code}';
  }
}
