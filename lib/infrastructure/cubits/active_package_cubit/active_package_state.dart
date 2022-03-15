import '../../models/local/my_user.dart';
import '../../models/remote/response/packages_data.dart';

abstract class ActivePackageState {}

class ActivePackageInitial extends ActivePackageState {}

class ActivePackageInProgress extends ActivePackageState {}

class ActivePackageError extends ActivePackageState {}

class ActivePackageStatusUpdated extends ActivePackageState {}

class ActivePackageNotFound extends ActivePackageState {}

class ActivePackageRemoveSuccess extends ActivePackageState {}

class ActivePackageNetworkError extends ActivePackageState {}

class ActivePackageSuccess extends ActivePackageState {
  ActivePackageSuccess(this.activePackagesList);

  final List<Package>? activePackagesList;
}
