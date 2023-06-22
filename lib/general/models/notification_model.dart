import 'company_model.dart';
import 'doctor_model.dart';

class NotificationModel {
  String? sId;
  dynamic patientId;
  DoctorId? doctorId;
  String? notifcationPatientAr;
  String? notifcationCompanyEn;
  String? createdDate;
  bool? status;
  bool? isRead;
  dynamic orderId;
  dynamic appointmentId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  CompanyId? companyId;

  NotificationModel({
    this.sId,
    this.patientId,
    this.doctorId,
    this.notifcationPatientAr,
    this.notifcationCompanyEn,
    this.createdDate,
    this.status,
    this.isRead,
    this.orderId,
    this.appointmentId,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.companyId,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    patientId = json['patient_id'];
    doctorId = json['doctor_id'] != null ? DoctorId.fromJson(json['doctor_id']) : null;
    notifcationPatientAr = json['notifcation_patient_ar'];
    notifcationCompanyEn = json['notifcation_company_en'];
    createdDate = json['created_date'];
    status = json['status'];
    isRead = json['is_read'];
    orderId = json['order_id'];
    appointmentId = json['appointment_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    companyId = json['company_id'] != null ? CompanyId.fromJson(json['company_id']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['patient_id'] = this.patientId;
    if (this.doctorId != null) {
      data['doctor_id'] = this.doctorId!.toJson();
    }
    data['notifcation_patient_ar'] = this.notifcationPatientAr;
    data['notifcation_company_en'] = this.notifcationCompanyEn;
    data['created_date'] = this.createdDate;
    data['status'] = this.status;
    data['is_read'] = this.isRead;
    data['order_id'] = this.orderId;
    data['appointment_id'] = this.appointmentId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.companyId != null) {
      data['company_id'] = this.companyId!.toJson();
    }
    return data;
  }
}
