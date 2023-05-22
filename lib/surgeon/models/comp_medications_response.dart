import 'medication_model.dart';

class CompMedicationsResponse {
  int? code;
  Message? message;
  bool? success;
  List<MedicationInfo>? medications;
  PageInfo? pageInfo;

  CompMedicationsResponse({this.code, this.message, this.success, this.medications, this.pageInfo});

  CompMedicationsResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    success = json['success'];
    if (json['data'] != null) {
      medications = <MedicationInfo>[];
      json['data'].forEach((v) {
        medications!.add(MedicationInfo.fromJson(v));
      });
    }
    pageInfo = json['page_info'] != null
        ? new PageInfo.fromJson(json['page_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    data['success'] = this.success;
    if (this.medications != null) {
      data['data'] = this.medications!.map((v) => v.toJson()).toList();
    }
    if (this.pageInfo != null) {
      data['page_info'] = this.pageInfo!.toJson();
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