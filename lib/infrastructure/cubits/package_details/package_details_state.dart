abstract class PackageDetailsState {}

class PackageDetailsInitial extends PackageDetailsState {}

class PackageDetailsInProgress extends PackageDetailsState {}

class PackageDetailsPaid extends PackageDetailsState {}

class PackageDetailsError extends PackageDetailsState {
  String? error;

  PackageDetailsError({this.error});
}

class PackageDetailsPayError extends PackageDetailsState {
  String error;

  PackageDetailsPayError({required this.error});
}

class PackageDetailsNetworkError extends PackageDetailsState {}

class PackageDetailsSuccess extends PackageDetailsState {
  PackageDetailsSuccess(this.packageList);

  final Map<String, dynamic>? packageList;
}

class PackageDetailsUrlFetched extends PackageDetailsState {
  String url;
  PackageDetailsUrlFetched({required this.url});
}
