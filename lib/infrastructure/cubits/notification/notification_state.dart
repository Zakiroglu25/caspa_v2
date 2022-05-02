import '../../models/local/my_user.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationInProgress extends NotificationState {}

class NotificationError extends NotificationState {
  String? error;

  NotificationError(this.error);
}

class NotificationStatusUpdated extends NotificationState {}

class NotificationNotFound extends NotificationState {}

class NotificationRemoveSuccess extends NotificationState {}

class NotificationNetworkError extends NotificationState {}

class NotificationSuccess extends NotificationState {
  NotificationSuccess(this.notificationList);

  final List<MyNotification> notificationList;
}
