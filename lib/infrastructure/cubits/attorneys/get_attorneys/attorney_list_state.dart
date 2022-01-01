import 'package:caspa_v2/infrastructure/models/remote/response/address_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';

abstract class AttorneyListState {}

class AttorneyListInitial extends AttorneyListState {}

class AttorneyListInProgress extends AttorneyListState {}

class AttorneyListError extends AttorneyListState {

  final String? error;

  AttorneyListError({this.error});
}

class AttorneyListNetworkError extends AttorneyListState {}
class AttorneyDeleted extends AttorneyListState {}

class AttorneyListSuccess extends AttorneyListState {
  AttorneyListSuccess(this.attorney);

  final List<Attorney> attorney;
}
