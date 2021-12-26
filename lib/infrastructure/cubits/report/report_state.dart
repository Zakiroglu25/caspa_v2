

abstract class ReportState {}

class ReportInitial extends ReportState {}

class ReportInProgress extends ReportState {}


class ReportError extends ReportState {

  String? error;

  ReportError({this.error});
}
class TarifNetworkError extends ReportState {}

class ReportSuccess extends ReportState {
  // ReportSuccess(this.tarifList);
  // final List<Tariff>  tarifList;
}
