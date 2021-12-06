class GeneralResponse {
  int? statusCode;
  String? message;
  var result;

  GeneralResponse({this.statusCode, this.message, this.result});

  GeneralResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    data['result'] = this.result;
    return data;
  }

  @override
  String toString() {
    return 'GeneralResponse{statusCode: $statusCode, message: $message, result: $result}';
  }
}