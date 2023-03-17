import 'package:flutter/material.dart';

class LabsResponse {
  LabsResponse({
    this.code,
    this.message,
    this.success,
    this.data,
    this.pageInfo,
  });

  LabsResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'] != null ? Message.fromJson(json['message']) : null;
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(LabModel.fromJson(v));
      });
    }
    pageInfo = json['page_info'] != null ? PageInfo.fromJson(json['page_info']) : null;
  }

  num? code;
  Message? message;
  bool? success;
  List<LabModel>? data;
  PageInfo? pageInfo;

  LabsResponse copyWith({
    num? code,
    Message? message,
    bool? success,
    List<LabModel>? data,
    PageInfo? pageInfo,
  }) =>
      LabsResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        success: success ?? this.success,
        data: data ?? this.data,
        pageInfo: pageInfo ?? this.pageInfo,
      );

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

  num? page;
  num? limit;
  num? total;
  bool? hasPrevious;
  bool? hasNext;

  PageInfo copyWith({
    num? page,
    num? limit,
    num? total,
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

class LabModel {
  LabModel({
    this.id,
    this.labName,
    this.normalRange,
    this.status,
    this.adminCreatedId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  LabModel.fromJson(dynamic json) {
    id = json['_id'];
    labName = json['lab_name'];
    normalRange = json['normal_range'];
    status = json['status'];
    adminCreatedId = json['admin_created_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? labName;
  String? normalRange;
  bool? status;
  String? adminCreatedId;
  String? createdAt;
  String? updatedAt;
  num? v;

  bool isSelected = false;
  final TextEditingController? resultController = TextEditingController(text: '');

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['lab_name'] = labName;
    map['normal_range'] = normalRange;
    map['status'] = status;
    map['admin_created_id'] = adminCreatedId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
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
