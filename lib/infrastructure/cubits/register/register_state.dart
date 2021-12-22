part of 'register_cubit.dart';

abstract class RegisterState  {
  const RegisterState();
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterButtonActive extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;

  RegisterSuccess(this.message);
  @override
  List<Object> get props => [message];
}

class RegisterError extends RegisterState {
  final String? message;

  RegisterError({this.message});

}
