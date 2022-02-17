class LinkOrderResponse {
  List<LinkOrder>? data;

  LinkOrderResponse({this.data});

  LinkOrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LinkOrder>[];
      json['data'].forEach((v) {
        data!.add(new LinkOrder.fromJson(v));
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

  @override
  String toString() {
    return 'LinkOrderResponse{data: $data}';
  }
}

class LinkOrder {
  int? id;
  String? link;
  String? date;
  int? qty;
  int? payment;
  String? price;
  String? cargoPrice;
  String? note;

  LinkOrder(
      {this.id,
      this.link,
      this.date,
      this.qty,
      this.payment,
      this.price,
      this.cargoPrice,
      this.note});

  LinkOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    date = json['date'];
    qty = json['qty'];
    payment = json['payment'];
    price = json['price'];
    cargoPrice = json['cargo_price'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    data['date'] = this.date;
    data['qty'] = this.qty;
    data['payment'] = this.payment;
    data['price'] = this.price;
    data['cargo_price'] = this.cargoPrice;
    data['note'] = this.note;
    return data;
  }

  @override
  String toString() {
    return 'LinkOrder{id: $id, link: $link, date: $date, qty: $qty, payment: $payment, price: $price, cargoPrice: $cargoPrice, note: $note}';
  }
}
