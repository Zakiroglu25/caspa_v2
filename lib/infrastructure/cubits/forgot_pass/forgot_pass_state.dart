abstract class ForgotPassState {}

class ForgotPassInitial extends ForgotPassState {}

class ForgotPassInProgress extends ForgotPassState {}

class ForgotPassError extends ForgotPassState {}
class ForgotPassEnterMail extends ForgotPassState {}
class ForgotPassEnterCode extends ForgotPassState {}
class ForgotPassNewPass extends ForgotPassState {}

class ForgotPassSuccess extends ForgotPassState {
  ForgotPassSuccess();
}
