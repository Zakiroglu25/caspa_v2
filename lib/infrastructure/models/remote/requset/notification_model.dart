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
        result!.add(new NotificationResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
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
        notification!.add(new NotificationBody.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date!.toIso8601String();
    if (this.notification != null) {
      data['notification'] = this.notification!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['text'] = this.text;
    return data;
  }

  @override
  String toString() {
    return 'Notification{id: $id, title: $title, text: $text}';
  }
}
