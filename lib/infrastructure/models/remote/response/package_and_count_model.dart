import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';

class PackageAndCount {
  int? count;
  List<Package>? packages;

  PackageAndCount({this.count, this.packages});

  PackageAndCount.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['packages'] != null) {
      packages = <Package>[];
      json['packages'].forEach((v) {
        packages!.add(new Package.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'PackageAndCount{count: $count, packages: $packages}';
  }
}
