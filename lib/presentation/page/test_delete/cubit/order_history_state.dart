
import '../order_history_model.dart';

abstract class OrderHistoryState {}

class OrderHistoryInitial extends OrderHistoryState {}

class OrderHistoryProgress extends OrderHistoryState {}

class OrderHistoryError extends OrderHistoryState {}

class OrderHistoryNetworkError extends OrderHistoryState {}

class OrderHistorySuccess extends OrderHistoryState {
  OrderHistorySuccess(this.list_history);

  final List<OrderHistoryModel>? list_history;
}
