class Branches {
  List<Branch>? data;

  Branches({this.data});

  Branches.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Branch>[];
      json['data'].forEach((v) {
        data!.add(new Branch.fromJson(v));
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

class Branch {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;

  Branch({this.id, this.createdAt, this.updatedAt, this.name});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    return data;
  }
}