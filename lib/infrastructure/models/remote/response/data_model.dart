import 'package:caspa_v2/infrastructure/models/remote/response/package_and_count_model.dart';

class DataModel {
  Map<String, Map<String, dynamic>>? data;

  DataModel({this.data});

  DataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new Map<String, Map<String, dynamic>>.from(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toString();
    }
    return data;
  }
}
