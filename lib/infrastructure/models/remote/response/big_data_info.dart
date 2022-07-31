class BigDataCloudResponse {
  double? latitude;
  double? longitude;
  String? continent;
  String? lookupSource;
  String? continentCode;
  String? localityLanguageRequested;
  String? city;
  String? countryName;
  String? countryCode;
  String? postcode;
  String? principalSubdivision;
  String? principalSubdivisionCode;
  String? plusCode;
  String? locality;
  LocalityInfo? localityInfo;

  BigDataCloudResponse(
      {this.latitude,
      this.longitude,
      this.continent,
      this.lookupSource,
      this.continentCode,
      this.localityLanguageRequested,
      this.city,
      this.countryName,
      this.countryCode,
      this.postcode,
      this.principalSubdivision,
      this.principalSubdivisionCode,
      this.plusCode,
      this.locality,
      this.localityInfo});

  BigDataCloudResponse.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    continent = json['continent'];
    lookupSource = json['lookupSource'];
    continentCode = json['continentCode'];
    localityLanguageRequested = json['localityLanguageRequested'];
    city = json['city'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
    postcode = json['postcode'];
    principalSubdivision = json['principalSubdivision'];
    principalSubdivisionCode = json['principalSubdivisionCode'];
    plusCode = json['plusCode'];
    locality = json['locality'];
    localityInfo = json['localityInfo'] != null
        ? new LocalityInfo.fromJson(json['localityInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['continent'] = this.continent;
    data['lookupSource'] = this.lookupSource;
    data['continentCode'] = this.continentCode;
    data['localityLanguageRequested'] = this.localityLanguageRequested;
    data['city'] = this.city;
    data['countryName'] = this.countryName;
    data['countryCode'] = this.countryCode;
    data['postcode'] = this.postcode;
    data['principalSubdivision'] = this.principalSubdivision;
    data['principalSubdivisionCode'] = this.principalSubdivisionCode;
    data['plusCode'] = this.plusCode;
    data['locality'] = this.locality;
    if (this.localityInfo != null) {
      data['localityInfo'] = this.localityInfo!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'BigDataCloudResponse{latitude: $latitude, longitude: $longitude, continent: $continent, lookupSource: $lookupSource, continentCode: $continentCode, localityLanguageRequested: $localityLanguageRequested, city: $city, countryName: $countryName, countryCode: $countryCode, postcode: $postcode, principalSubdivision: $principalSubdivision, principalSubdivisionCode: $principalSubdivisionCode, plusCode: $plusCode, locality: $locality, localityInfo: $localityInfo}';
  }
}

class LocalityInfo {
  List<Administrative>? administrative;
  List<Informative>? informative;

  LocalityInfo({this.administrative, this.informative});

  LocalityInfo.fromJson(Map<String, dynamic> json) {
    if (json['administrative'] != null) {
      administrative = <Administrative>[];
      json['administrative'].forEach((v) {
        administrative!.add(new Administrative.fromJson(v));
      });
    }
    if (json['informative'] != null) {
      informative = <Informative>[];
      json['informative'].forEach((v) {
        informative!.add(new Informative.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.administrative != null) {
      data['administrative'] =
          this.administrative!.map((v) => v.toJson()).toList();
    }
    if (this.informative != null) {
      data['informative'] = this.informative!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'LocalityInfo{administrative: $administrative, informative: $informative}';
  }
}

class Administrative {
  String? name;
  String? description;
  String? isoName;
  int? order;
  int? adminLevel;
  String? isoCode;
  String? wikidataId;
  int? geonameId;

  Administrative(
      {this.name,
      this.description,
      this.isoName,
      this.order,
      this.adminLevel,
      this.isoCode,
      this.wikidataId,
      this.geonameId});

  Administrative.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    isoName = json['isoName'];
    order = json['order'];
    adminLevel = json['adminLevel'];
    isoCode = json['isoCode'];
    wikidataId = json['wikidataId'];
    geonameId = json['geonameId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['isoName'] = this.isoName;
    data['order'] = this.order;
    data['adminLevel'] = this.adminLevel;
    data['isoCode'] = this.isoCode;
    data['wikidataId'] = this.wikidataId;
    data['geonameId'] = this.geonameId;
    return data;
  }

  @override
  String toString() {
    return 'Administrative{name: $name, description: $description, isoName: $isoName, order: $order, adminLevel: $adminLevel, isoCode: $isoCode, wikidataId: $wikidataId, geonameId: $geonameId}';
  }
}

class Informative {
  String? name;
  String? description;
  int? order;
  String? isoCode;
  String? wikidataId;
  int? geonameId;

  Informative(
      {this.name,
      this.description,
      this.order,
      this.isoCode,
      this.wikidataId,
      this.geonameId});

  Informative.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    order = json['order'];
    isoCode = json['isoCode'];
    wikidataId = json['wikidataId'];
    geonameId = json['geonameId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['order'] = this.order;
    data['isoCode'] = this.isoCode;
    data['wikidataId'] = this.wikidataId;
    data['geonameId'] = this.geonameId;
    return data;
  }

  @override
  String toString() {
    return 'Informative{name: $name, description: $description, order: $order, isoCode: $isoCode, wikidataId: $wikidataId, geonameId: $geonameId}';
  }
}
