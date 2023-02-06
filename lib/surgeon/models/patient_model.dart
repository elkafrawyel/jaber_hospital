class PatientModel {
  String? sId;
  String? fullNameAr;
  String? fullNameEn;
  String? image;
  String? operationStatus;
  String? operationDate;
  String? operationType;
  SurgeonId? surgeonId;
  SurgeonId? dietationId;
  bool? ultrasound;
  bool? egd;
  bool? surgionVisit;
  bool? isOpen ;

  PatientModel({
    this.sId,
    this.fullNameAr,
    this.fullNameEn,
    this.image,
    this.operationStatus,
    this.operationDate,
    this.operationType,
    this.surgeonId,
    this.dietationId,
    this.ultrasound,
    this.egd,
    this.surgionVisit,
    this.isOpen,
  });

  PatientModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullNameAr = json['full_name_ar'];
    fullNameEn = json['full_name_en'];
    image = json['image'];
    operationStatus = json['operation_status'];
    operationDate = json['operation_date'];
    operationType = json['operation_type'];
    surgeonId = json['surgeon_id'] != null
        ? new SurgeonId.fromJson(json['surgeon_id'])
        : null;
    dietationId = json['dietation_id'] != null
        ? new SurgeonId.fromJson(json['dietation_id'])
        : null;
    ultrasound = json['ultrasound'];
    egd = json['egd'];
    surgionVisit = json['surgion_visit'];
    isOpen = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['full_name_ar'] = this.fullNameAr;
    data['full_name_en'] = this.fullNameEn;
    data['image'] = this.image;
    data['operation_status'] = this.operationStatus;
    data['operation_date'] = this.operationDate;
    data['operation_type'] = this.operationType;
    if (this.surgeonId != null) {
      data['surgeon_id'] = this.surgeonId!.toJson();
    }
    if (this.dietationId != null) {
      data['dietation_id'] = this.dietationId!.toJson();
    }
    data['ultrasound'] = this.ultrasound;
    data['egd'] = this.egd;
    data['surgion_visit'] = this.surgionVisit;
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
