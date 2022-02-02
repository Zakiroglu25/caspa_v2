class CalculateModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? min;
  int? max;
  String? price;
  int? countryId;
  num? discount;
  int? active;
  String? description;
  String? liquidPrice;
  int? cityId;

  CalculateModel(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.min,
        this.max,
        this.price,
        this.countryId,
        this.discount,
        this.active,
        this.description,
        this.liquidPrice,
        this.cityId});

  CalculateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    min = json['min'];
    max = json['max'];
    price = json['price'];
    countryId = json['country_id'];
    discount = json['discount'];
    active = json['active'];
    description = json['description'];
    liquidPrice = json['liquid_price'];
    cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['min'] = this.min;
    data['max'] = this.max;
    data['price'] = this.price;
    data['country_id'] = this.countryId;
    data['discount'] = this.discount;
    data['active'] = this.active;
    data['description'] = this.description;
    data['liquid_price'] = this.liquidPrice;
    data['city_id'] = this.cityId;
    return data;
  }

  @override
  String toString() {
    return 'CalculateModel{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, min: $min, max: $max, price: $price, countryId: $countryId, discount: $discount, active: $active, description: $description, liquidPrice: $liquidPrice, cityId: $cityId}';
  }
}