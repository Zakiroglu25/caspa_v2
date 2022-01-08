class Contact {
  String? facebook;
  String? instagram;
  String? whatsapp;

  Contact({this.facebook, this.instagram, this.whatsapp});

  Contact.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    instagram = json['instagram'];
    whatsapp = json['whatsapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    data['whatsapp'] = whatsapp;
    return data;
  }

  @override
  String toString() {
    return 'Contact{facebook: $facebook, instagram: $instagram, whatsapp: $whatsapp}';
  }
}
