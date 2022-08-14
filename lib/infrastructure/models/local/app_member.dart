import 'package:caspa_v2/infrastructure/models/local/my_user.dart';

class AppMember {
  String? token;
  MyUser? user;

  AppMember({this.token, this.user});

  AppMember.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new MyUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'AppMember{token: $token, user: $user}';
  }
}
