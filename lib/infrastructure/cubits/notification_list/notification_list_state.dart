import '../../models/local/my_user.dart';

abstract class NotificationListState {}

class NotificationListInitial extends NotificationListState {}

class NotificationListInProgress extends NotificationListState {}

class NotificationListError extends NotificationListState {}

class NotificationNotFound extends NotificationListState {}

class NotificationSuccess extends NotificationListState {
  NotificationSuccess(this.notificationList);

  final List<MyNotification>? notificationList;
}
