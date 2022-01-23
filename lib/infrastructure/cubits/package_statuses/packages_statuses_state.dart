import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';

abstract class PackageStatusesState {}

class PackageStatusesInitial extends PackageStatusesState {}

class PackageStatusesInProgress extends PackageStatusesState {}

class PackageStatusesError extends PackageStatusesState {
  String? error;

  PackageStatusesError({this.error});
}

class PackageStatusesNetworkError extends PackageStatusesState {}

class PackageStatusesSuccess extends PackageStatusesState {
  PackageStatusesSuccess(this.packageList);

  final Map<String, dynamic>? packageList;
}
