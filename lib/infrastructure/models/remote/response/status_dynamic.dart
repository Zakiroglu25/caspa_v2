class StatusDynamic {
  dynamic? data;
  int? statusCode;

  StatusDynamic({this.data, this.statusCode});

  @override
  String toString() {
    return 'StatusDynamic{data: $data, statusCode: $statusCode}';
  }
}
