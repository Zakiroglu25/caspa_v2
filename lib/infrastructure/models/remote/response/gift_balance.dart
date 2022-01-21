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
  String? date;
  String? amount;

  GiftBalance({this.id, this.code, this.date, this.amount});

  GiftBalance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    date = json['date'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['date'] = this.date;
    data['amount'] = this.amount;
    return data;
  }

  @override
  String toString() {
    return 'GiftBalance{id: $id, code: $code, date: $date, amount: $amount}';
  }
}
