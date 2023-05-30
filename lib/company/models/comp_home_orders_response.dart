import 'order_model.dart';

class CompOrdersResponse {
  int? code;
  bool? success;
  Message? message;
  Data? data;

  CompOrdersResponse({this.code, this.success, this.message, this.data});

  CompOrdersResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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

class Data {
  List<OrderModel>? companyOrdersCompleted;
  List<OrderModel>? companyOrdersInProgress;

  Data({this.companyOrdersCompleted, this.companyOrdersInProgress});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['company_orders_completed'] != null) {
      companyOrdersCompleted = <OrderModel>[];
      json['company_orders_completed'].forEach((v) {
        companyOrdersCompleted!.add(new OrderModel.fromJson(v));
      });
    }
    if (json['company_orders_in_progress'] != null) {
      companyOrdersInProgress = <OrderModel>[];
      json['company_orders_in_progress'].forEach((v) {
        companyOrdersInProgress!.add(new OrderModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.companyOrdersCompleted != null) {
      data['company_orders_completed'] =
          this.companyOrdersCompleted!.map((v) => v.toJson()).toList();
    }
    if (this.companyOrdersInProgress != null) {
      data['company_orders_in_progress'] =
          this.companyOrdersInProgress!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}