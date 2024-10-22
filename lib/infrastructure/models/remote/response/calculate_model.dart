class CalculateModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  num? min;
  num? max;
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
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['min'] = min;
    data['max'] = max;
    data['price'] = price;
    data['country_id'] = countryId;
    data['discount'] = discount;
    data['active'] = active;
    data['description'] = description;
    data['liquid_price'] = liquidPrice;
    data['city_id'] = cityId;
    return data;
  }

  @override
  String toString() {
    return 'CalculateModel{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, min: $min, max: $max, price: $price, countryId: $countryId, discount: $discount, active: $active, description: $description, liquidPrice: $liquidPrice, cityId: $cityId}';
  }
}
