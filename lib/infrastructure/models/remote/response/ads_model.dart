class AdsModel {
  List<Data>? data;

  AdsModel({this.data});

  AdsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? image;
  String? title;
  String? description;
  bool? is_active;

  Data({this.image, this.title, this.description});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    is_active = json['is_active'];
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = image;
    data['title'] = title;
    data['id'] = id;
    data['is_active'] = is_active;
    data['description'] = description;
    return data;
  }
}
