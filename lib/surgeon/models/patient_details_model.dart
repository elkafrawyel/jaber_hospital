class PatientDetailsModel {
  Patient? patient;
  List<Appointments>? appointments;

  PatientDetailsModel({this.patient, this.appointments});

  PatientDetailsModel.fromJson(Map<String, dynamic> json) {
    patient =
    json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(new Appointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    if (this.appointments != null) {
      data['appointments'] = this.appointments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Patient {
  String? sId;
  String? email;
  bool? verified;
  String? fullNameAr;
  String? fullNameEn;
  String? gender;
  String? civilId;
  String? image;
  String? publicId;
  String? telephone1;
  String? telephone2;
  String? role;
  String? operationStatus;
  String? operationDate;
  String? operationType;
  SurgeonId? surgeonId;
  SurgeonId? surgeon2Id;
  SurgeonId? physiotherapyId;
  SurgeonId? psychologistId;
  SurgeonId? dietationId;

  Patient(
      {this.sId,
        this.email,
        this.verified,
        this.fullNameAr,
        this.fullNameEn,
        this.gender,
        this.civilId,
        this.image,
        this.publicId,
        this.telephone1,
        this.telephone2,
        this.role,
        this.operationStatus,
        this.operationDate,
        this.operationType,
        this.surgeonId,
        this.surgeon2Id,
        this.physiotherapyId,
        this.psychologistId,
        this.dietationId});

  Patient.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    verified = json['verified'];
    fullNameAr = json['full_name_ar'];
    fullNameEn = json['full_name_en'];
    gender = json['gender'];
    civilId = json['civil_id'];
    image = json['image'];
    publicId = json['public_id'];
    telephone1 = json['telephone_1'];
    telephone2 = json['telephone_2'];
    role = json['role'];
    operationStatus = json['operation_status'];
    operationDate = json['operation_date'];
    operationType = json['operation_type'];
    surgeonId = json['surgeon_id'] != null
        ? new SurgeonId.fromJson(json['surgeon_id'])
        : null;
    surgeon2Id = json['surgeon2_id'] != null
        ? new SurgeonId.fromJson(json['surgeon2_id'])
        : null;
    physiotherapyId = json['physiotherapy_id'] != null
        ? new SurgeonId.fromJson(json['physiotherapy_id'])
        : null;
    psychologistId = json['psychologist_id'] != null
        ? new SurgeonId.fromJson(json['psychologist_id'])
        : null;
    dietationId = json['dietation_id'] != null
        ? new SurgeonId.fromJson(json['dietation_id'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['verified'] = this.verified;
    data['full_name_ar'] = this.fullNameAr;
    data['full_name_en'] = this.fullNameEn;
    data['gender'] = this.gender;
    data['civil_id'] = this.civilId;
    data['image'] = this.image;
    data['public_id'] = this.publicId;
    data['telephone_1'] = this.telephone1;
    data['telephone_2'] = this.telephone2;
    data['role'] = this.role;
    data['operation_status'] = this.operationStatus;
    data['operation_date'] = this.operationDate;
    data['operation_type'] = this.operationType;
    if (this.surgeonId != null) {
      data['surgeon_id'] = this.surgeonId!.toJson();
    }
    if (this.surgeon2Id != null) {
      data['surgeon2_id'] = this.surgeon2Id!.toJson();
    }
    if (this.physiotherapyId != null) {
      data['physiotherapy_id'] = this.physiotherapyId!.toJson();
    }
    if (this.psychologistId != null) {
      data['psychologist_id'] = this.psychologistId!.toJson();
    }
    if (this.dietationId != null) {
      data['dietation_id'] = this.dietationId!.toJson();
    }
    return data;
  }
}

class SurgeonId {
  String? sId;
  String? fullNameAr;
  String? fullNameEn;
  String? image;

  SurgeonId({this.sId, this.fullNameAr, this.fullNameEn, this.image});

  SurgeonId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullNameAr = json['full_name_ar'];
    fullNameEn = json['full_name_en'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['full_name_ar'] = this.fullNameAr;
    data['full_name_en'] = this.fullNameEn;
    data['image'] = this.image;
    return data;
  }
}

class Appointments {
  String? sId;
  String? doctorId;
  String? patientId;
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

  Appointments(
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

  Appointments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
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
    data['doctor_id'] = this.doctorId;
    data['patient_id'] = this.patientId;
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
