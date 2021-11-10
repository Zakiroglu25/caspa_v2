part of 'tarif_cubit.dart';

abstract class TarifState extends Equatable {
  const TarifState();

  @override
  List<Object> get props => [];
}

class TarifInitial extends TarifState {}

class TarifLoading extends TarifState {}

class TarifSuccess extends TarifState {
  final PriceModel prices;

  const TarifSuccess(this.prices);

  @override
  List<Object> get props => [prices];
}

class TarifFailed extends TarifState {
  final String message;
  const TarifFailed(this.message);
  @override
  List<Object> get props => [message];
}
