import '../../general/models/doctor_model.dart';

class MdtPatientModel {
  String? id;
  String? firstNameEn;
  String? firstNameAr;
  String? lastNameAr;
  String? lastNameEn;
  String? image;
  String? fileId;
  String? mdtStatus;
  DoctorId? surgeonId;
  DoctorId? dietationId;
  String? mdtDateTime;
  String? mdtResults;

  MdtPatientModel(
      {this.id,
        this.firstNameEn,
        this.firstNameAr,
        this.lastNameAr,
        this.lastNameEn,
        this.image,
        this.fileId,
        this.mdtStatus,
        this.surgeonId,
        this.dietationId,
        this.mdtDateTime,
        this.mdtResults});

  MdtPatientModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstNameEn = json['first_name_en'];
    firstNameAr = json['first_name_ar'];
    lastNameAr = json['last_name_ar'];
    lastNameEn = json['last_name_en'];
    image = json['image'];
    fileId = json['file_id'];
    mdtStatus = json['mdt_status'];
    surgeonId = json['surgeon_id'] != null
        ? DoctorId.fromJson(json['surgeon_id'])
        : null;
    dietationId = json['dietation_id'] != null
        ? DoctorId.fromJson(json['dietation_id'])
        : null;
    mdtDateTime = json['mdt_date_time'];
    mdtResults = json['mdt_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['first_name_ar'] = this.firstNameAr;
    data['last_name_ar'] = this.lastNameAr;
    data['first_name_en'] = this.firstNameEn;
    data['last_name_en'] = this.lastNameEn;
    data['image'] = this.image;
    data['file_id'] = this.fileId;
    data['mdt_status'] = this.mdtStatus;
    if (this.surgeonId != null) {
      data['surgeon_id'] = this.surgeonId!.toJson();
    }
    if (this.dietationId != null) {
      data['dietation_id'] = this.dietationId!.toJson();
    }
    data['mdt_date_time'] = this.mdtDateTime;
    data['mdt_results'] = this.mdtResults;
    return data;
  }
}