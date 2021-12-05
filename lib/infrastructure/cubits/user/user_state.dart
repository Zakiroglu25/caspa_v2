part of 'user_cubit.dart';

abstract class UserState  {
  const UserState();
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserButtonActive extends UserState {}

class UserSuccess extends UserState {
  final String message;

  UserSuccess(this.message);
  @override
  List<Object> get props => [message];
}

class UserFailed extends UserState {
  final String message;

  UserFailed(this.message);
  @override
  List<Object> get props => [message];
}
