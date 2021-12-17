class AddressModel {
  List<Data>? data;

  AddressModel({required this.data});

  AddressModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? icon;
  String? name;
  String? address;
  Fields? fields;

  Data({this.id, this.icon, this.name, this.address, this.fields});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
    address = json['address'];
    fields =
    json['fields'] != null ? Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['name'] = name;
    data['address'] = address;
    if (fields != null) {
      data['fields'] = fields!.toJson();
    }
    return data;
  }
}

class Fields {
  String? l;
  String? lE;
  String? mahalle;
  String? telefon;
  String? tcKimlik;
  String? postaKodu;
  String? adresBaL;

  Fields(
      {this.l,
        this.lE,
        this.mahalle,
        this.telefon,
        this.tcKimlik,
        this.postaKodu,
        this.adresBaL});

  Fields.fromJson(Map<String, dynamic> json) {
    l = json['İl'];
    lE = json['İlçe'];
    mahalle = json['Mahalle'];
    telefon = json['Telefon'];
    tcKimlik = json['Tc kimlik'];
    postaKodu = json['Posta Kodu'];
    adresBaL = json['Adres Başlığı'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['İl'] = l;
    data['İlçe'] = lE;
    data['Mahalle'] = mahalle;
    data['Telefon'] = telefon;
    data['Tc kimlik'] = tcKimlik;
    data['Posta Kodu'] = postaKodu;
    data['Adres Başlığı'] = adresBaL;
    return data;
  }
}