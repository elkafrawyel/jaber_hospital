import 'package:base_flutter/surgeon/models/patient_model.dart';

class AllPatientPostOpResponse {
  AllPatientPostOpResponse({
    this.code,
    this.message,
    this.success,
    this.pageInfo,
    this.data,
  });

  AllPatientPostOpResponse.fromJson(Map<String,dynamic> json) {
    code = json['code'];
    message = json['message'] != null ? Message.fromJson(json['message']) : null;
    success = json['success'];
    pageInfo = json['page_info'] != null ? PageInfo.fromJson(json['page_info']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(PatientModel.fromJson(v));
      });
    }
  }

  int? code;
  Message? message;
  bool? success;
  PageInfo? pageInfo;
  List<PatientModel>? data;
}

class PageInfo {
  PageInfo({
    this.page,
    this.limit,
    this.total,
    this.hasPrevious,
    this.hasNext,
  });

  PageInfo.fromJson(dynamic json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    hasPrevious = json['has_previous'];
    hasNext = json['has_next'];
  }

  int? page;
  int? limit;
  int? total;
  bool? hasPrevious;
  bool? hasNext;

  PageInfo copyWith({
    int? page,
    int? limit,
    int? total,
    bool? hasPrevious,
    bool? hasNext,
  }) =>
      PageInfo(
        page: page ?? this.page,
        limit: limit ?? this.limit,
        total: total ?? this.total,
        hasPrevious: hasPrevious ?? this.hasPrevious,
        hasNext: hasNext ?? this.hasNext,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['limit'] = limit;
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
