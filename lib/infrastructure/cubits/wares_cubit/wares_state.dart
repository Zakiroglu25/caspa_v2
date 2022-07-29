import 'package:caspa_v2/infrastructure/models/remote/response/categories_response.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/wares.dart';

abstract class WaresState {}

class WaresInitial extends WaresState {}

class WaresInProgress extends WaresState {}

class WaresError extends WaresState {
  String? error;

  WaresError({this.error});
}

class WaresSuccess extends WaresState {
  WaresSuccess(this.wares);

  List<Data> wares;
}

class WaresNetworkError extends WaresState {}
