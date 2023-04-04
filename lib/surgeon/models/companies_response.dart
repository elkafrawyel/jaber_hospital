import 'package:base_flutter/surgeon/models/medication_model.dart';

class CompaniesResponse {
  int? code;
  Message? message;
  bool? success;
  List<CompanyId>? companies;

  CompaniesResponse({this.code, this.message, this.success, this.companies});

  CompaniesResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    success = json['success'];
    if (json['data'] != null) {
      companies = <CompanyId>[];
      json['data'].forEach((v) {
        companies!.add(CompanyId.fromJson(v));
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
    if (this.companies != null) {
      data['data'] = this.companies!.map((v) => v.toJson()).toList();
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