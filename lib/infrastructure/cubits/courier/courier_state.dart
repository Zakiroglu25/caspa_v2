abstract class CourierState {}

class CourierInitial extends CourierState {}

class CourierInProgress extends CourierState {}

class CourierError extends CourierState {}
class CourierEnterMail extends CourierState {}
class CourierEnterCode extends CourierState {}
class CourierNewPass extends CourierState {}
class CourierContinueButtonActive extends CourierState {}
class CourierContinueButtonPassive extends CourierState {}

class CourierSuccess extends CourierState {
  CourierSuccess();
}
