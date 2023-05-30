import 'notification_model.dart';

class NotificationsResponse {
  int? code;
  Message? message;
  bool? success;
  List<NotificationModel>? notifications;

  NotificationsResponse({this.code, this.message, this.success, this.notifications});

  NotificationsResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    success = json['success'];
    if (json['data'] != null) {
      notifications = <NotificationModel>[];
      json['data'].forEach((v) {
        // data!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    data['success'] = this.success;
    if (this.notifications != null) {
      // data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  String? messageEn;
  String? messageAr;

  Message({this.messageEn, this.messageAr});

  Message.fromJson(Map<String, dynamic> json) {
    messageEn = json['message_en'];
    messageAr = json['message_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message_en'] = this.messageEn;
    data['message_ar'] = this.messageAr;
    return data;
  }
}