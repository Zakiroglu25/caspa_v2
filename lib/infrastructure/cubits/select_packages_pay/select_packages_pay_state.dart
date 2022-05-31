import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';

abstract class SelectPackagesPayState {}

class SelectPackagesPayInitial extends SelectPackagesPayState {}

class SelectPackagesPayInProgress extends SelectPackagesPayState {}

class SelectPackagesPayNetworkError extends SelectPackagesPayState {}

class SelectPackagesPayShowPaymentDialog extends SelectPackagesPayState {
  final List<int> selectedOrders;

  SelectPackagesPayShowPaymentDialog({required this.selectedOrders});
}

//error emeliyyatdan evvelki xetalar ucun
class SelectPackagesPayError extends SelectPackagesPayState {
  String? error;
  SelectPackagesPayError({this.error});
}

class SelectPackagesPaySuccess extends SelectPackagesPayState {
  final List<Package> packages;
  SelectPackagesPaySuccess({required this.packages});
}
