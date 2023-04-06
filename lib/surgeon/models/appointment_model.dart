import '../../general/models/doctor_model.dart';
import '../../general/models/patient_model.dart';

class AppointmentModel {
  String? sId;
  DoctorId? doctorId;
  PatientId? patientId;
  String? clinicNameEn;
  String? appointmentDate;
  bool? status;
  String? actionsRequired;
  String? adminCreatedId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? clinicNameAr;
  String? comments;

  AppointmentModel(
      {this.sId,
        this.doctorId,
        this.patientId,
        this.clinicNameEn,
        this.appointmentDate,
        this.status,
        this.actionsRequired,
        this.adminCreatedId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.clinicNameAr,
        this.comments});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    doctorId = json['doctor_id'] != null
        ? DoctorId.fromJson(json['doctor_id'])
        : null;
    patientId = json['patient_id'] != null
        ? PatientId.fromJson(json['patient_id'])
        : null;
    clinicNameEn = json['clinic_name_en'];
    appointmentDate = json['appointment_date'];
    status = json['status'];
    actionsRequired = json['actions_required'];
    adminCreatedId = json['admin_created_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    clinicNameAr = json['clinic_name_ar'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.doctorId != null) {
      data['doctor_id'] = this.doctorId!.toJson();
    }
    if (this.patientId != null) {
      data['patient_id'] = this.patientId!.toJson();
    }
    data['clinic_name_en'] = this.clinicNameEn;
    data['appointment_date'] = this.appointmentDate;
    data['status'] = this.status;
    data['actions_required'] = this.actionsRequired;
    data['admin_created_id'] = this.adminCreatedId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['clinic_name_ar'] = this.clinicNameAr;
    data['comments'] = this.comments;
    return data;
  }
}
