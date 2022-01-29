class RegionData {
  List<Region>? data;

  RegionData({this.data});

  RegionData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Region>[];
      json['data'].forEach((v) {
        data!.add(new Region.fromJson(v));
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

class Region {
  int? id;
  String? name;
  String? price;

  Region({this.id, this.name, this.price});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}
