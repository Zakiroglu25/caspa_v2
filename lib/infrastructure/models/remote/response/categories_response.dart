class CategoriesData {
  List<Category>? data;

  CategoriesData({this.data});

  CategoriesData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Category>[];
      json['data'].forEach((v) {
        data!.add(Category.fromJson(v));
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

  @override
  String toString() {
    return 'CategoriesData{data: $data}';
  }
}

class Category {
  int? id;
  String? name;
  int? parentId;
  List<SubCategory>? children;

  Category({this.id, this.name, this.parentId, this.children});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
    if (json['children'] != null) {
      children = <SubCategory>[];
      json['children'].forEach((v) {
        children!.add(SubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parent_id'] = this.parentId;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Data{id: $id, name: $name, parentId: $parentId, children: $children}';
  }
}

class SubCategory {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  int? parentId;
  int? goodsId;

  SubCategory(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.parentId,
      this.goodsId});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    parentId = json['parent_id'];
    goodsId = json['goods_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['parent_id'] = this.parentId;
    data['goods_id'] = this.goodsId;
    return data;
  }

  @override
  String toString() {
    //return 'Children{id: $id,  name: $name, parentId: $parentId, goodsId: $goodsId}';
    return 'Children{id: $id,  name: $name, parentId: $parentId, goodsId: $goodsId}\n';
  }
}
