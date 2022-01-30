class Commission {
  String? commission;

  Commission({this.commission});

  Commission.fromJson(Map<String, dynamic> json) {
    commission = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.commission;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'commission': this.commission,
    };
  }

  factory Commission.fromMap(Map<String, dynamic> map) {
    return Commission(
      commission: map['commission'] as String,
    );
  }

  @override
  String toString() {
    return 'Commission{commission: $commission}';
  }
}
