import '../../general/models/doctor_model.dart';
import '../../general/models/patient_model.dart';

class PatientAppointmentModel {
  String? sId;
  DoctorId? doctorId;
  PatientId? patientId;
  String? clinicNameAr;
  String? clinicNameEn;
  String? appointmentDate;
  String? comments;
  bool? status;
  String? actionsRequired;
  String? adminCreatedId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? adminUpdatedId;

  PatientAppointmentModel(
      {this.sId,
        this.doctorId,
        this.patientId,
        this.clinicNameAr,
        this.clinicNameEn,
        this.appointmentDate,
        this.comments,
        this.status,
        this.actionsRequired,
        this.adminCreatedId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.adminUpdatedId});

  PatientAppointmentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    doctorId = json['doctor_id'] != null
        ? DoctorId.fromJson(json['doctor_id'])
        : null;
    patientId = json['patient_id'] != null
        ? new PatientId.fromJson(json['patient_id'])
        : null;
    clinicNameAr = json['clinic_name_ar'];
    clinicNameEn = json['clinic_name_en'];
    appointmentDate = json['appointment_date'];
    comments = json['comments'];
    status = json['status'];
    actionsRequired = json['actions_required'];
    adminCreatedId = json['admin_created_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    adminUpdatedId = json['admin_updated_id'];
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
    data['clinic_name_ar'] = this.clinicNameAr;
    data['clinic_name_en'] = this.clinicNameEn;
    data['appointment_date'] = this.appointmentDate;
    data['comments'] = this.comments;
    data['status'] = this.status;
    data['actions_required'] = this.actionsRequired;
    data['admin_created_id'] = this.adminCreatedId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['admin_updated_id'] = this.adminUpdatedId;
    return data;
  }
}
