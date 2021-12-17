class ShopList {
  List<Shop>? data;

  ShopList({this.data});

  ShopList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Shop>[];

      json['data'].forEach((v) {
        data?.add(Shop.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'ShopList{data: $data}';
  }
}

class Shop {
  int? id;
  String? name;
  String? logo;
  String? link;
  String? type;
  String? youtube;

  Shop({this.id, this.name, this.logo, this.link, this.type, this.youtube});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    link = json['link'];
    type = json['type'];
    youtube = json['youtube'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['link'] = this.link;
    data['type'] = this.type;
    data['youtube'] = this.youtube;
    return data;
  }

  @override
  String toString() {
    return 'Shop{id: $id, name: $name, logo: $logo, link: $link, type: $type, youtube: $youtube}';
  }
}
