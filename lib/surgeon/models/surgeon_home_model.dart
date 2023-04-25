import 'package:base_flutter/surgeon/models/patient_model.dart';

class SurgeonHomeModel {
  List<Appointments>? appointments;
  int? doctorTotalNotification;

  SurgeonHomeModel({this.appointments, this.doctorTotalNotification});

  SurgeonHomeModel.fromJson(Map<String, dynamic> json) {
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(new Appointments.fromJson(v));
      });
    }
    doctorTotalNotification = json['doctor_total_notification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appointments != null) {
      data['appointments'] = this.appointments!.map((v) => v.toJson()).toList();
    }
    data['doctor_total_notification'] = this.doctorTotalNotification;
    return data;
  }
}

class Appointments {
  String? sId;
  PatientModel? patientId;
  String? appointmentDate;
  String? comments;
  String? actionsRequired;
  String? createdAt;
  String? updatedAt;

  Appointments(
      {this.sId,
      this.patientId,
      this.appointmentDate,
      this.comments,
      this.actionsRequired,
      this.createdAt,
      this.updatedAt});

  Appointments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    patientId = json['patient_id'] != null ? new PatientModel.fromJson(json['patient_id']) : null;
    appointmentDate = json['appointment_date'];
    comments = json['comments'];
    actionsRequired = json['actions_required'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.patientId != null) {
      data['patient_id'] = this.patientId!.toJson();
    }
    data['appointment_date'] = this.appointmentDate;
    data['comments'] = this.comments;
    data['actions_required'] = this.actionsRequired;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
