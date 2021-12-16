import 'package:caspa_v2/infrastructure/models/local/my_user.dart';

class StatusDynamic {
  dynamic? data;
  int? statusCode;

  StatusDynamic({this.data, this.statusCode});

  @override
  String toString() {
    return 'StatusDynamic{data: $data, statusCode: $statusCode}';
  }
}
