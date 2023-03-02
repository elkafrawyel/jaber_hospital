class MedicationsOrdersModel {
  String? sId;
  DoctorId? doctorId;
  CompanyId? companyId;
  PatientId? patientId;
  List<Medications>? medications;
  List<Instruments>? instruments;
  List<MedicationsDetails>? medicationsDetails;
  String? orderStartDate;
  String? orderCompletedDate;
  String? orderStatus;
  String? notes;
  bool? status;
  int? orderNum;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? adminUpdatedId;

  MedicationsOrdersModel(
      {this.sId,
        this.doctorId,
        this.companyId,
        this.patientId,
        this.medications,
        this.instruments,
        this.medicationsDetails,
        this.orderStartDate,
        this.orderCompletedDate,
        this.orderStatus,
        this.notes,
        this.status,
        this.orderNum,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.adminUpdatedId});

  MedicationsOrdersModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    doctorId = json['doctor_id'] != null
        ? new DoctorId.fromJson(json['doctor_id'])
        : null;
    companyId = json['company_id'] != null
        ? new CompanyId.fromJson(json['company_id'])
        : null;
    patientId = json['patient_id'] != null
        ? new PatientId.fromJson(json['patient_id'])
        : null;
    if (json['medications'] != null) {
      medications = <Medications>[];
      json['medications'].forEach((v) {
        medications!.add(new Medications.fromJson(v));
      });
    }
    if (json['instruments'] != null) {
      instruments = <Instruments>[];
      json['instruments'].forEach((v) {
        instruments!.add(new Instruments.fromJson(v));
      });
    }
    if (json['medications_details'] != null) {
      medicationsDetails = <MedicationsDetails>[];
      json['medications_details'].forEach((v) {
        medicationsDetails!.add(new MedicationsDetails.fromJson(v));
      });
    }
    orderStartDate = json['order_start_date'];
    orderCompletedDate = json['order_completed_date'];
    orderStatus = json['order_status'];
    notes = json['notes'];
    status = json['status'];
    orderNum = json['order_num'];
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
    if (this.companyId != null) {
      data['company_id'] = this.companyId!.toJson();
    }
    if (this.patientId != null) {
      data['patient_id'] = this.patientId!.toJson();
    }
    if (this.medications != null) {
      data['medications'] = this.medications!.map((v) => v.toJson()).toList();
    }
    if (this.instruments != null) {
      data['instruments'] = this.instruments!.map((v) => v.toJson()).toList();
    }
    if (this.medicationsDetails != null) {
      data['medications_details'] =
          this.medicationsDetails!.map((v) => v.toJson()).toList();
    }
    data['order_start_date'] = this.orderStartDate;
    data['order_completed_date'] = this.orderCompletedDate;
    data['order_status'] = this.orderStatus;
    data['notes'] = this.notes;
    data['status'] = this.status;
    data['order_num'] = this.orderNum;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['admin_updated_id'] = this.adminUpdatedId;
    return data;
  }
}

class DoctorId {
  String? sId;
  String? fullNameAr;
  String? fullNameEn;
  String? gender;
  String? civilId;
  String? title;

  DoctorId(
      {this.sId,
        this.fullNameAr,
        this.fullNameEn,
        this.gender,
        this.civilId,
        this.title});

  DoctorId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullNameAr = json['full_name_ar'];
    fullNameEn = json['full_name_en'];
    gender = json['gender'];
    civilId = json['civil_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['full_name_ar'] = this.fullNameAr;
    data['full_name_en'] = this.fullNameEn;
    data['gender'] = this.gender;
    data['civil_id'] = this.civilId;
    data['title'] = this.title;
    return data;
  }
}

class CompanyId {
  String? sId;
  String? companyNameAr;
  String? companyNameEn;
  String? companyContactPerson;
  String? companyAddress;
  String? companyContactMobile;

  CompanyId(
      {this.sId,
        this.companyNameAr,
        this.companyNameEn,
        this.companyContactPerson,
        this.companyAddress,
        this.companyContactMobile});

  CompanyId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    companyNameAr = json['company_name_ar'];
    companyNameEn = json['company_name_en'];
    companyContactPerson = json['company_contact_person'];
    companyAddress = json['company_address'];
    companyContactMobile = json['company_contact_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['company_name_ar'] = this.companyNameAr;
    data['company_name_en'] = this.companyNameEn;
    data['company_contact_person'] = this.companyContactPerson;
    data['company_address'] = this.companyAddress;
    data['company_contact_mobile'] = this.companyContactMobile;
    return data;
  }
}

class PatientId {
  String? sId;
  String? fullNameAr;
  String? fullNameEn;
  String? gender;
  String? civilId;
  int? age;
  int? weight;
  int? height;

  PatientId(
      {this.sId,
        this.fullNameAr,
        this.fullNameEn,
        this.gender,
        this.civilId,
        this.age,
        this.weight,
        this.height});

  PatientId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullNameAr = json['full_name_ar'];
    fullNameEn = json['full_name_en'];
    gender = json['gender'];
    civilId = json['civil_id'];
    age = json['age'];
    weight = json['weight'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['full_name_ar'] = this.fullNameAr;
    data['full_name_en'] = this.fullNameEn;
    data['gender'] = this.gender;
    data['civil_id'] = this.civilId;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['height'] = this.height;
    return data;
  }
}

class Medications {
  String? sId;
  String? medicationName;
  String? description;
  bool? status;
  String? companyId;

  Medications(
      {this.sId,
        this.medicationName,
        this.description,
        this.status,
        this.companyId});

  Medications.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    medicationName = json['medication_name'];
    description = json['description'];
    status = json['status'];
    companyId = json['company_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['medication_name'] = this.medicationName;
    data['description'] = this.description;
    data['status'] = this.status;
    data['company_id'] = this.companyId;
    return data;
  }
}

class Instruments {
  String? sId;
  String? description;
  String? code;
  bool? status;

  Instruments({this.sId, this.description, this.code, this.status});

  Instruments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['code'] = this.code;
    data['status'] = this.status;
    return data;
  }
}

class MedicationsDetails {
  String? id;
  int? quantity;

  MedicationsDetails({this.id, this.quantity});

  MedicationsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    return data;
  }
}
