import 'patient_appointment_model.dart';

class AppointmentsResponse {
  int? code;
  bool? success;
  Message? message;
  List<PatientAppointmentModel>? appointments;

  AppointmentsResponse({this.code, this.success, this.message, this.appointments});

  AppointmentsResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    if (json['data'] != null) {
      appointments = <PatientAppointmentModel>[];
      json['data'].forEach((v) {
        appointments!.add(PatientAppointmentModel.fromJson(v));
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
    if (this.appointments != null) {
      data['data'] = this.appointments!.map((v) => v.toJson()).toList();
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
