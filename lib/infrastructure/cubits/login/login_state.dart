// Project imports:


abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginInProgress extends LoginState {}
class LoginSocketError extends LoginState {}



class LoginError extends LoginState {
  String? error;
  LoginError({this.error});
}

class LoginSuccess extends LoginState {
  LoginSuccess(this.addComment);

  final String addComment;
}
