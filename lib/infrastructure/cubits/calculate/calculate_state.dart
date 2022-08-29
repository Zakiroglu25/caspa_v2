abstract class CalculateKgState {}

class CalculateKgInitial extends CalculateKgState {}

class CalculateKgProgress extends CalculateKgState {}

class CalculateKgInAdding extends CalculateKgState {}

class CalculateKgError extends CalculateKgState {
  String? error;

  CalculateKgError({this.error});
}

class CalculateKgNetworkError extends CalculateKgState {}

class CalculateKgAdded extends CalculateKgState {
  CalculateKgAdded(this.calculate);

  final String calculate;
}

class CalculateKgNotAdded extends CalculateKgState {
  String? error;

  CalculateKgNotAdded({this.error});
}

// class CalculateKgSuccess extends CalculateKgState {
//   CalculateKgSuccess(this.promoList);
//
//   final List<PromoCode> promoList;
//}
