import 'package:caspa_v2/infrastructure/models/local/my_user.dart';

class UserResult {
  MyUser? data;

  UserResult({this.data});

  UserResult.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new MyUser.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
