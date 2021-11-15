class TariffData {
  List<Tariff>? tariffList;

  TariffData({this.tariffList});

  TariffData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      tariffList = <Tariff>[];
      json['data'].forEach((v) {
        tariffList!.add(Tariff.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tariffList != null) {
      data['data'] = tariffList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'PriceModel{data: $tariffList}';
  }
}

class Tariff {
  String? price;
  String? description;

  Tariff({this.price, this.description});

  Tariff.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['description'] = description;
    return data;
  }

  @override
  String toString() {
    return 'Data{price: $price, description: $description}';
  }
}