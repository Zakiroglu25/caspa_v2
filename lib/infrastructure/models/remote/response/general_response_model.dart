class GeneralResponse<T> {
  T? data;

  GeneralResponse({this.data});

  GeneralResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'data': this.data,
      'data': this.data,
    };
  }

  factory GeneralResponse.fromMap(Map<String, dynamic> map) {
    return GeneralResponse(
      data: map['data'] as T,
    );
  }

  @override
  String toString() {
    return 'GeneralResponse{data: $data}';
  }
}
