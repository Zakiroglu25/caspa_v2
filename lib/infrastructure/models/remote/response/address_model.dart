class AddressList {
  List<Adress>? adress;

  AddressList({required this.adress});

  AddressList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      adress = <Adress>[];
      json['data'].forEach((v) {
        adress!.add(Adress.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.adress != null) {
      data['data'] = this.adress!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Adress {
  int? id;
  String? icon;
  String? name;
  String? address;
  Fields? fields;

  Adress({this.id, this.icon, this.name, this.address, this.fields});

  Adress.fromJson(Map<String, dynamic> json) {
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

  @override
  String toString() {
    return 'Data{id: $id, icon: $icon, name: $name, address: $address, fields: $fields}';
  }
}

class Fields {
  String? il;
  String? ilce;
  String? mahalle;
  String? telefon;
  String? tcKimlik;
  String? postaKodu;
  String? adresBashligi;

  Fields(
      {this.il,
        this.ilce,
        this.mahalle,
        this.telefon,
        this.tcKimlik,
        this.postaKodu,
        this.adresBashligi});

  Fields.fromJson(Map<String, dynamic> json) {
    il = json['İl'];
    ilce = json['İlçe'];
    mahalle = json['Mahalle'];
    telefon = json['Telefon'];
    tcKimlik = json['Tc kimlik'];
    postaKodu = json['Posta Kodu'];
    adresBashligi = json['Adres Başlığı'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['İl'] = il;
    data['İlçe'] = ilce;
    data['Mahalle'] = mahalle;
    data['Telefon'] = telefon;
    data['Tc kimlik'] = tcKimlik;
    data['Posta Kodu'] = postaKodu;
    data['Adres Başlığı'] = adresBashligi;
    return data;
  }

  @override
  String toString() {
    return 'Fields{l: $il, lE: $ilce, mahalle: $mahalle, telefon: $telefon, tcKimlik: $tcKimlik, postaKodu: $postaKodu, adresBaL: $adresBashligi}';
  }
}