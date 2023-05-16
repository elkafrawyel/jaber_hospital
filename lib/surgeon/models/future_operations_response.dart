class FutureOperationsResponse {
  FutureOperationsResponse({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  FutureOperationsResponse.fromJson(dynamic json) {
    code = json['code'];
    success = json['success'];
    message = json['message'] != null ? Message.fromJson(json['message']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(FutureOperationModel.fromJson(v));
      });
    }
  }

  num? code;
  bool? success;
  Message? message;
  List<FutureOperationModel>? data;
}

class FutureOperationModel {
  FutureOperationModel({
    this.id,
    this.image,
    this.operationStatus,
    this.operationDate,
    this.operationType,
    this.fileId,
    this.firstNameEn,
    this.firstNameAr,
    this.lastNameAr,
    this.lastNameEn,
  });

  FutureOperationModel.fromJson(dynamic json) {
    id = json['_id'];
    image = json['image'];
    operationStatus = json['operation_status'];
    operationDate = json['operation_date'];
    operationType = json['operation_type'];
    fileId = json['file_id'];
    firstNameEn = json['first_name_en'];
    firstNameAr = json['first_name_ar'];
    lastNameAr = json['last_name_ar'];
    lastNameEn = json['last_name_en'];
  }

  String? id;
  String? image;
  String? operationStatus;
  String? operationDate;
  String? operationType;
  String? fileId;
  String? firstNameEn;
  String? firstNameAr;
  String? lastNameAr;
  String? lastNameEn;

  FutureOperationModel copyWith({
    String? id,
    String? image,
    String? operationStatus,
    String? operationDate,
    String? operationType,
    String? fileId,
    String? firstNameEn,
    String? firstNameAr,
    String? lastNameAr,
    String? lastNameEn,
  }) =>
      FutureOperationModel(
        id: id ?? this.id,
        image: image ?? this.image,
        operationStatus: operationStatus ?? this.operationStatus,
        operationDate: operationDate ?? this.operationDate,
        operationType: operationType ?? this.operationType,
        fileId: fileId ?? this.fileId,
        firstNameEn: firstNameEn ?? this.firstNameEn,
        firstNameAr: firstNameAr ?? this.firstNameAr,
        lastNameAr: lastNameAr ?? this.lastNameAr,
        lastNameEn: lastNameEn ?? this.lastNameEn,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['image'] = image;
    map['operation_status'] = operationStatus;
    map['operation_date'] = operationDate;
    map['operation_type'] = operationType;
    map['file_id'] = fileId;
    map['first_name_en'] = firstNameEn;
    map['first_name_ar'] = firstNameAr;
    map['last_name_ar'] = lastNameAr;
    map['last_name_en'] = lastNameEn;
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
