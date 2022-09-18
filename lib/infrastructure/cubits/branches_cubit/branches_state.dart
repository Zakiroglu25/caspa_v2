import '../../models/remote/response/branches_model.dart';

abstract class BranchesState {}

class BranchesInitial extends BranchesState {}

class BranchesProgress extends BranchesState {}

class BranchesError extends BranchesState {
  String? error;

  BranchesError({this.error});
}

class BranchesSuccess extends BranchesState {
  BranchesSuccess(this.branches);

  List<Branch> branches;
}

class BranchesNetworkError extends BranchesState {}
