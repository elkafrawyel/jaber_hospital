import 'package:base_flutter/surgeon/models/patient_model.dart';

class PatientSearchResponse {
  PatientSearchResponse({
    this.code,
    this.message,
    this.success,
    this.data,
    this.pageInfo,
  });

  PatientSearchResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'] != null ? Message.fromJson(json['message']) : null;
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(PatientModel.fromJson(v));
      });
    }
    pageInfo = json['page_info'] != null ? PageInfo.fromJson(json['page_info']) : null;
  }

  num? code;
  Message? message;
  bool? success;
  List<PatientModel>? data;
  PageInfo? pageInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (message != null) {
      map['message'] = message?.toJson();
    }
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (pageInfo != null) {
      map['page_info'] = pageInfo?.toJson();
    }
    return map;
  }
}

class PageInfo {
  PageInfo({
    this.page,
    this.total,
    this.hasPrevious,
    this.hasNext,
  });

  PageInfo.fromJson(dynamic json) {
    page = json['page'];
    total = json['total'];
    hasPrevious = json['has_previous'];
    hasNext = json['has_next'];
  }

  num? page;
  num? total;
  bool? hasPrevious;
  bool? hasNext;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['total'] = total;
    map['has_previous'] = hasPrevious;
    map['has_next'] = hasNext;
    return map;
  }
}

class Message {
  Message({
    this.messageEn,
    this.messageAr,
  });

  Message.fromJson(dynamic json) {
    messageEn = json['message_en'];
    messageAr = json['message_ar'];
  }

  String? messageEn;
  String? messageAr;

  Message copyWith({
    String? messageEn,
    String? messageAr,
  }) =>
      Message(
        messageEn: messageEn ?? this.messageEn,
        messageAr: messageAr ?? this.messageAr,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message_en'] = messageEn;
    map['message_ar'] = messageAr;
    return map;
  }
}
