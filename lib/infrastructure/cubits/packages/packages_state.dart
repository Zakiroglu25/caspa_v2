import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';

abstract class PackageState {}

class PackagesInitial extends PackageState {}

class PackagesInProgress extends PackageState {}

class PackagesError extends PackageState {
  String? error;

  PackagesError({this.error});
}

class PackagesNetworkError extends PackageState {}

class PackagesDeleteSuccess extends PackageState {
  PackagesDeleteSuccess(this.messages);

  String? messages;
}

class PackagesSuccess extends PackageState {
  PackagesSuccess(this.packageList);

  final List<Package>? packageList;
}
