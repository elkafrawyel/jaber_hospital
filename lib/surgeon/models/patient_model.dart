import '../../general/models/doctor_model.dart';

class PatientModel {
  String? sId;
  String? fNameAr;
  String? lNameAr;
  String? fNameEn;
  String? lNameEn;
  String? image;
  String? operationStatus;
  String? operationDate;
  String? operationType;
  DoctorId? surgeonId;
  DoctorId? dietationId;
  bool? ultrasound;
  bool? egd;
  bool? surgionVisit;
  bool? watchedClip;
  String? dietationFeedbackDecision;
  String? finalFeedback;
  String? feedback;
  bool? isOpen;

  PatientModel({
    this.sId,
    this.fNameAr,
    this.lNameAr,
    this.fNameEn,
    this.lNameEn,
    this.image,
    this.operationStatus,
    this.operationDate,
    this.operationType,
    this.surgeonId,
    this.dietationId,
    this.ultrasound,
    this.egd,
    this.surgionVisit,
    this.watchedClip,
    this.dietationFeedbackDecision,
    this.finalFeedback,
    this.feedback,
    this.isOpen,
  });

  PatientModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fNameAr = json['first_name_ar'];
    lNameAr = json['last_name_ar'];
    fNameEn = json['first_name_en'];
    lNameEn = json['last_name_en'];
    image = json['image'];
    operationStatus = json['operation_status'];
    operationDate = json['operation_date'];
    operationType = json['operation_type'];
    surgeonId = json['surgeon_id'] != null ? new DoctorId.fromJson(json['surgeon_id']) : null;
    dietationId = json['dietation_id'] != null ? new DoctorId.fromJson(json['dietation_id']) : null;
    ultrasound = json['ultrasound'];
    egd = json['egd'];
    surgionVisit = json['surgion_visit'];
    watchedClip = json['watched_clip'];
    dietationFeedbackDecision = json['dietation_feedback_decision'];
    finalFeedback = json['final_feedback'];
    feedback = json['feedback'];
    isOpen = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['first_name_ar'] = fNameAr;
    data['last_name_ar'] = lNameAr;
    data['first_name_en'] = fNameEn;
    data['last_name_en'] = lNameEn;
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
    data['watched_clip'] = this.watchedClip;
    data['dietation_feedback_decision'] = this.dietationFeedbackDecision;
    data['final_feedback'] = this.finalFeedback;
    data['feedback'] = this.feedback;
    return data;
  }
}