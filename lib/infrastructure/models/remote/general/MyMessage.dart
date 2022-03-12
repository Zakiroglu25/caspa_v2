class ResponseMessage {
  String? message;

  ResponseMessage({this.message});

  ResponseMessage.fromJson(Map<String, dynamic> json) {
    message = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.message;
    return data;
  }

  @override
  String toString() {
    return 'MessageResponse{message: $message}';
  }
}
