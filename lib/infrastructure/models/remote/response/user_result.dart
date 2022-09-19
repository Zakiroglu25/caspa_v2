import 'package:caspa_v2/infrastructure/models/local/my_user.dart';

class UserResult {
  MyUser? data;

//<editor-fold desc="Data Methods">

  UserResult({
    this.data,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserResult &&
          runtimeType == other.runtimeType &&
          data == other.data);

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() {
    return 'UserResult{' + ' data: $data,' + '}';
  }

  UserResult copyWith({
    MyUser? data,
  }) {
    return UserResult(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': this.data,
    };
  }

  factory UserResult.fromMap(Map<String, dynamic> map) {
    return UserResult(
      data: map['data'] as MyUser,
    );
  }



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
