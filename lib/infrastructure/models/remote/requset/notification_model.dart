class NotificationModel {
  int? statusCode;
  String? message;
  List<NotificationResult>? result;

  NotificationModel({this.statusCode, this.message, this.result});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['result'] != null) {
      result = <NotificationResult>[];
      json['result'].forEach((v) {
        result!.add(NotificationResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Notificarion{statusCode: $statusCode, message: $message, result: $result}';
  }
}

class NotificationResult {
  DateTime? date;
  List<NotificationBody>? notification;

  NotificationResult({this.date, this.notification});

  NotificationResult.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date'] ?? "2021-06-10T08:53:19.807");
    if (json['notification'] != null) {
      notification = <NotificationBody>[];
      json['notification'].forEach((v) {
        notification!.add(NotificationBody.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date!.toIso8601String();
    if (notification != null) {
      data['notification'] = notification!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Result{date: $date, notification: $notification}';
  }
}

class NotificationBody {
  int? id;
  String? title;
  String? text;

  NotificationBody({this.id, this.title, this.text});

  NotificationBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['text'] = text;
    return data;
  }

  @override
  String toString() {
    return 'Notification{id: $id, title: $title, text: $text}';
  }
}
