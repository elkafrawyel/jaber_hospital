import 'mdt_patient_model.dart';

class MdtPatientsResponse {
  int? code;
  bool? success;
  Message? message;
  List<MdtPatientModel>? patients;

  MdtPatientsResponse({this.code, this.success, this.message, this.patients});

  MdtPatientsResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    if (json['data'] != null) {
      patients = <MdtPatientModel>[];
      json['data'].forEach((v) {
        patients!.add(MdtPatientModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    if (this.patients != null) {
      data['data'] = this.patients!.map((v) => v.toJson()).toList();
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