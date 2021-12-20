class OrderHistoryModel {
  String? date;
  List<Orders>? orders;

  OrderHistoryModel({this.date, this.orders});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'OrderHistoryModel{date: $date, orders: $orders}';
  }
}

class Orders {
  int? id;
  String? deliveryStatus;
  String? clientName;
  String? totalPrice;
  String? deliveryDate;
  String? deliveryTimeFrom;
  String? deliveryTimeTo;

  Orders(
      {this.id,
        this.deliveryStatus,
        this.clientName,
        this.totalPrice,
        this.deliveryDate,
        this.deliveryTimeFrom,
        this.deliveryTimeTo});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deliveryStatus = json['delivery_status'];
    clientName = json['client_name'];
    totalPrice = json['total_price'];
    deliveryDate = json['delivery_date'];
    deliveryTimeFrom = json['delivery_time_from'];
    deliveryTimeTo = json['delivery_time_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['delivery_status'] = deliveryStatus;
    data['client_name'] = clientName;
    data['total_price'] = totalPrice;
    data['delivery_date'] = deliveryDate;
    data['delivery_time_from'] = deliveryTimeFrom;
    data['delivery_time_to'] = deliveryTimeTo;
    return data;
  }

  @override
  String toString() {
    return 'Orders{id: $id, deliveryStatus: $deliveryStatus, clientName: $clientName, totalPrice: $totalPrice, deliveryDate: $deliveryDate, deliveryTimeFrom: $deliveryTimeFrom, deliveryTimeTo: $deliveryTimeTo}';
  }
}