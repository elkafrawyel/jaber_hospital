import 'package:base_flutter/general/models/doctor_model.dart';

class PatientDetailsModel {
  PatientDetailsModel({
    this.patient,
    this.appointments,
  });

  PatientDetailsModel.fromJson(dynamic json) {
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    if (json['appointments'] != null) {
      appointments = [];
      json['appointments'].forEach((v) {
        appointments?.add(Appointments.fromJson(v));
      });
    }
  }

  Patient? patient;
  List<Appointments>? appointments;

  PatientDetailsModel copyWith({
    Patient? patient,
    List<Appointments>? appointments,
  }) =>
      PatientDetailsModel(
        patient: patient ?? this.patient,
        appointments: appointments ?? this.appointments,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (patient != null) {
      map['patient'] = patient?.toJson();
    }
    if (appointments != null) {
      map['appointments'] = appointments?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Appointments {
  Appointments({
    this.id,
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
    this.v,
  });

  Appointments.fromJson(dynamic json) {
    id = json['_id'];
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
    v = json['__v'];
  }

  String? id;
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
  num? v;

  Appointments copyWith({
    String? id,
    String? doctorId,
    String? patientId,
    String? clinicNameAr,
    String? clinicNameEn,
    String? appointmentDate,
    String? comments,
    bool? status,
    String? actionsRequired,
    String? adminCreatedId,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      Appointments(
        id: id ?? this.id,
        doctorId: doctorId ?? this.doctorId,
        patientId: patientId ?? this.patientId,
        clinicNameAr: clinicNameAr ?? this.clinicNameAr,
        clinicNameEn: clinicNameEn ?? this.clinicNameEn,
        appointmentDate: appointmentDate ?? this.appointmentDate,
        comments: comments ?? this.comments,
        status: status ?? this.status,
        actionsRequired: actionsRequired ?? this.actionsRequired,
        adminCreatedId: adminCreatedId ?? this.adminCreatedId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['doctor_id'] = doctorId;
    map['patient_id'] = patientId;
    map['clinic_name_ar'] = clinicNameAr;
    map['clinic_name_en'] = clinicNameEn;
    map['appointment_date'] = appointmentDate;
    map['comments'] = comments;
    map['status'] = status;
    map['actions_required'] = actionsRequired;
    map['admin_created_id'] = adminCreatedId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

class Patient {
  Patient({
    this.mdtStatus,
    this.egdResults,
    this.id,
    this.email,
    this.verified,
    this.fNameAr,
    this.lNameAr,
    this.fNameEn,
    this.lNameEn,
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
    this.consent,
    this.age,
    this.weight,
    this.height,
    this.bmi,
    this.fileId,
    this.surgionVisit,
    this.dmType,
    this.htn,
    this.osa,
    this.fattyLiver,
    this.pcos,
    this.cardiacDiseaseIhd,
    this.cardiacDiseaseHf,
    this.respiratoryDisVte,
    this.respiratoryDisAnticoag,
    this.respiratoryDisAntiplate,
    this.coMorbiditiesOtherNotes,
    this.reflux,
    this.refluxMedRegular,
    this.refluxMedOcc,
    this.refluxMedNone,
    this.nonSmoker,
    this.exSmoker,
    this.occationalSmoker,
    this.vape,
    this.lessThan20Cigg,
    this.moreThan20Cigg,
    this.shisha,
    this.historyOfBallon,
    this.ballonWeightLossFrom,
    this.ballonWeightLossTo,
    this.ballonDateOfInsertion,
    this.ballonDateOfRemoval,
    this.historyOfWeightLoss,
    this.weightLossOutcomeResult,
    this.weightLossOutcomeDate,
    this.medicationTypeVictoza,
    this.medicationTypeSaxenda,
    this.medicationTypeOzempic,
    this.medicationTypeWegovo,
    this.medicationTypeTrulicity,
    this.medicationTypeMounjaro,
    this.previousBariatric,
    this.bariatricOutcomeResult,
    this.bariatricOutcomeDate,
    this.surgeryTypeLsg,
    this.surgeryTypeLagb,
    this.surgeryTypePilication,
    this.surgeryTypeRygbp,
    this.surgeryTypeMgbp,
    this.surgeryTypeSadiS,
    this.ultrasound,
    this.surgeryTypeSasi,
    this.ultrasoundFindingFattyLiver,
    this.ultrasoundFindingGbs,
    this.ultrasoundFindingHernia,
    this.ultrasoundFindingCirrhos,
    this.ultrasoundFindingOthers,
    this.ultrasoundFindingOthersNote,
    this.egd,
    this.egbResults,
    this.fluoroscopyResult,
    this.otherNotes,
    this.bulkEater,
    this.sweetEater,
    this.fizzyDrinks,
    this.frequentMeals,
    this.lateTime,
    this.nippler,
    this.junkFood,
    this.iron,
    this.vitB12,
    this.vitD,
    this.protein,
    this.attemptLoseNotes,
    this.dietationFeedbackDecision,
    this.dietationFeedbackDecisionDate,
    this.proteinInTake,
    this.takingSupplements,
    this.fiberInTake,
    this.physicallyActive,
    this.dietPlan,
    this.postFeedback,
    this.avgStepCount,
    this.physicalFitness,
    this.cardiovascular,
    this.lungEndurance,
    this.feedback,
    this.feedbackDate,
    this.watchedClip,
    this.eduFeedbackDate,
    this.eduFeedback,
    this.notes,
    this.mdtDateTime,
    this.mdtSessionDuration,
    this.mdtResults,
    this.mdtComments,
    this.status,
    this.adminCreatedId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.overallStatus,
    this.adminUpdatedId,
    this.alcohol,
    this.anticoag,
    this.antiplate,
    this.anxietyResult,
    this.anxietyScore,
    this.depressionResult,
    this.depressionScore,
    this.dietaryIntake,
    this.dietationId,
    this.dmTypel,
    this.dmTypell,
    this.dyslipidemia,
    this.egdAnastomoticSize,
    this.egdAnastomoticSizeNumber,
    this.egdBile,
    this.egdDilatedFundus,
    this.egdDuodenumNormal,
    this.egdDuodenumOthers,
    this.egdDuodenumUlcer,
    this.egdHiatusHerniaSize,
    this.egdHiatusHerniaSizeCm,
    this.egdNormal,
    this.egdOesophagusBarrets,
    this.egdOesophagusGrade,
    this.egdOesophagusGradeType,
    this.egdOesophagusNormal,
    this.egdOesophagusOesophagitis,
    this.egdOesophagusOther,
    this.egdPanDilatation,
    this.egdPouchDialation,
    this.egdPreviousSurgery,
    this.egdPreviousSurgeryTypeLagb,
    this.egdPreviousSurgeryTypeLsg,
    this.egdPreviousSurgeryTypeMgbp,
    this.egdPreviousSurgeryTypeRygbp,
    this.egdStomachAntral,
    this.egdStomachBody,
    this.egdStomachFundal,
    this.egdStomachGas,
    this.egdStomachGrastricUlcer,
    this.egdStomachHPylori,
    this.egdStomachHaitus,
    this.egdStomachOthers,
    this.egdStomachPang,
    this.egdStomachPolyps,
    this.egdStructure,
    this.egdTwist,
    this.egdUlcer,
    this.finalFeedback,
    this.finalFeedbackDate,
    this.followUpFeedback,
    this.physiotherapyId,
    this.psychologistId,
    this.pythiscalLimitation,
    this.questionnaireId,
    this.respiratoryDis,
    this.stepName,
    this.surgeon2Id,
    this.surgeonId,
    this.vte,
    this.dietation_feedback_decision,
  });

  Patient.fromJson(dynamic json) {
    mdtStatus = json['mdt_status'];
    egdResults = json['egd_results'];
    id = json['_id'];
    email = json['email'];
    verified = json['verified'];
    fNameAr = json['first_name_ar'];
    lNameAr = json['last_name_ar'];
    fNameEn = json['first_name_en'];
    lNameEn = json['last_name_en'];
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
    consent = json['consent'];
    age = json['age'];
    weight = json['weight'];
    height = json['height'];
    bmi = json['bmi'];
    fileId = json['file_id'];
    surgionVisit = json['surgion_visit'];
    dmType = json['dm_type'];
    htn = json['htn'];
    osa = json['osa'];
    fattyLiver = json['fatty_liver'];
    pcos = json['pcos'];
    cardiacDiseaseIhd = json['cardiac_disease_ihd'];
    cardiacDiseaseHf = json['cardiac_disease_hf'];
    respiratoryDisVte = json['respiratory_dis_vte'];
    respiratoryDisAnticoag = json['respiratory_dis_anticoag'];
    respiratoryDisAntiplate = json['respiratory_dis_antiplate'];
    coMorbiditiesOtherNotes = json['co_morbidities_other_notes'];
    reflux = json['reflux'];
    refluxMedRegular = json['reflux_med_regular'];
    refluxMedOcc = json['reflux_med_occ'];
    refluxMedNone = json['reflux_med_none'];
    nonSmoker = json['non_smoker'];
    exSmoker = json['ex_smoker'];
    occationalSmoker = json['occational_smoker'];
    vape = json['vape'];
    lessThan20Cigg = json['less_than_20_cigg'];
    moreThan20Cigg = json['more_than_20_cigg'];
    shisha = json['shisha'];
    historyOfBallon = json['history_of_ballon'];
    ballonWeightLossFrom = json['ballon_weight_loss_from'];
    ballonWeightLossTo = json['ballon_weight_loss_to'];
    ballonDateOfInsertion = json['ballon_date_of_insertion'];
    ballonDateOfRemoval = json['ballon_date_of_removal'];
    historyOfWeightLoss = json['history_of_weight_loss'];
    weightLossOutcomeResult = json['weight_loss_outcome_result'];
    weightLossOutcomeDate = json['weight_loss_outcome_date'];
    medicationTypeVictoza = json['medication_type_victoza'];
    medicationTypeSaxenda = json['medication_type_saxenda'];
    medicationTypeOzempic = json['medication_type_ozempic'];
    medicationTypeWegovo = json['medication_type_wegovo'];
    medicationTypeTrulicity = json['medication_type_trulicity'];
    medicationTypeMounjaro = json['medication_type_mounjaro'];
    previousBariatric = json['previous_bariatric'];
    bariatricOutcomeResult = json['bariatric_outcome_result'];
    bariatricOutcomeDate = json['bariatric_outcome_date'];
    surgeryTypeLsg = json['surgery_type_lsg'];
    surgeryTypeLagb = json['surgery_type_lagb'];
    surgeryTypePilication = json['surgery_type_pilication'];
    surgeryTypeRygbp = json['surgery_type_rygbp'];
    surgeryTypeMgbp = json['surgery_type_mgbp'];
    surgeryTypeSadiS = json['surgery_type_sadi_s'];
    ultrasound = json['ultrasound'];
    surgeryTypeSasi = json['surgery_type_sasi'];
    ultrasoundFindingFattyLiver = json['ultrasound_finding_fatty_liver'];
    ultrasoundFindingGbs = json['ultrasound_finding_gbs'];
    ultrasoundFindingHernia = json['ultrasound_finding_hernia'];
    ultrasoundFindingCirrhos = json['ultrasound_finding_cirrhos'];
    ultrasoundFindingOthers = json['ultrasound_finding_others'];
    ultrasoundFindingOthersNote = json['ultrasound_finding_others_note'];
    egd = json['egd'];
    egbResults = json['egb_results'];
    fluoroscopyResult = json['fluoroscopy_result'];
    otherNotes = json['other_notes'];
    bulkEater = json['bulk_eater'];
    sweetEater = json['sweet_eater'];
    fizzyDrinks = json['fizzy_drinks'];
    frequentMeals = json['frequent_meals'];
    lateTime = json['late_time'];
    nippler = json['nippler'];
    junkFood = json['junk_food'];
    iron = json['iron'];
    vitB12 = json['vit_b12'];
    vitD = json['vit_d'];
    protein = json['protein'];
    attemptLoseNotes = json['attempt_lose_notes'];
    dietationFeedbackDecision = json['dietation_feedback_decision'];
    dietationFeedbackDecisionDate = json['dietation_feedback_decision_date'];
    proteinInTake = json['protein_in_take'];
    takingSupplements = json['taking_supplements'];
    fiberInTake = json['fiber_in_take'];
    physicallyActive = json['physically_active'];
    dietPlan = json['diet_plan'];
    postFeedback = json['post_feedback'];
    avgStepCount = json['avg_step_count'];
    physicalFitness = json['physical_fitness'];
    cardiovascular = json['cardiovascular'];
    lungEndurance = json['lung_endurance'];
    feedback = json['feedback'];
    feedbackDate = json['feedback_date'];
    watchedClip = json['watched_clip'];
    eduFeedbackDate = json['edu_feedback_date'];
    eduFeedback = json['edu_feedback'];
    notes = json['notes'];
    mdtDateTime = json['mdt_date_time'];
    mdtSessionDuration = json['mdt_session_duration'];
    mdtResults = json['mdt_results'];
    mdtComments = json['mdt_comments'];
    status = json['status'];
    adminCreatedId = json['admin_created_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    overallStatus = json['overall_status'];
    adminUpdatedId = json['admin_updated_id'];
    alcohol = json['alcohol'];
    anticoag = json['anticoag'];
    antiplate = json['antiplate'];
    anxietyResult = json['anxiety_result'];
    anxietyScore = json['anxiety_score'];
    depressionResult = json['depression_result'];
    depressionScore = json['depression_score'];
    dietaryIntake = json['dietary_intake'];
    dietationId = json['dietation_id'] != null ? DoctorId.fromJson(json['dietation_id']) : null;
    dmTypel = json['dm_typel'];
    dmTypell = json['dm_typell'];
    dyslipidemia = json['dyslipidemia'];
    egdAnastomoticSize = json['egd_anastomotic_size'];
    egdAnastomoticSizeNumber = json['egd_anastomotic_size_number'];
    egdBile = json['egd_bile'];
    egdDilatedFundus = json['egd_dilated_fundus'];
    egdDuodenumNormal = json['egd_duodenum_normal'];
    egdDuodenumOthers = json['egd_duodenum_others'];
    egdDuodenumUlcer = json['egd_duodenum_ulcer'];
    egdHiatusHerniaSize = json['egd_hiatus_hernia_size'];
    egdHiatusHerniaSizeCm = json['egd_hiatus_hernia_size_cm'];
    egdNormal = json['egd_normal'];
    egdOesophagusBarrets = json['egd_oesophagus_barrets'];
    egdOesophagusGrade = json['egd_oesophagus_grade'];
    egdOesophagusGradeType = json['egd_oesophagus_grade_type'];
    egdOesophagusNormal = json['egd_oesophagus_normal'];
    egdOesophagusOesophagitis = json['egd_oesophagus_oesophagitis'];
    egdOesophagusOther = json['egd_oesophagus_other'];
    egdPanDilatation = json['egd_pan_dilatation'];
    egdPouchDialation = json['egd_pouch_dialation'];
    egdPreviousSurgery = json['egd_previous_surgery'];
    egdPreviousSurgeryTypeLagb = json['egd_previous_surgery_type_lagb'];
    egdPreviousSurgeryTypeLsg = json['egd_previous_surgery_type_lsg'];
    egdPreviousSurgeryTypeMgbp = json['egd_previous_surgery_type_mgbp'];
    egdPreviousSurgeryTypeRygbp = json['egd_previous_surgery_type_rygbp'];
    egdStomachAntral = json['egd_stomach_antral'];
    egdStomachBody = json['egd_stomach_body'];
    egdStomachFundal = json['egd_stomach_fundal'];
    egdStomachGas = json['egd_stomach_gas'];
    egdStomachGrastricUlcer = json['egd_stomach_grastric_ulcer'];
    egdStomachHPylori = json['egd_stomach_h_pylori'];
    egdStomachHaitus = json['egd_stomach_haitus'];
    egdStomachOthers = json['egd_stomach_others'];
    egdStomachPang = json['egd_stomach_pang'];
    egdStomachPolyps = json['egd_stomach_polyps'];
    egdStructure = json['egd_structure'];
    egdTwist = json['egd_twist'];
    egdUlcer = json['egd_ulcer'];
    finalFeedback = json['final_feedback'];
    finalFeedbackDate = json['final_feedback_date'];
    followUpFeedback = json['follow_up_feedback'];
    physiotherapyId = json['physiotherapy_id'] != null ? DoctorId.fromJson(json['physiotherapy_id']) : null;
    psychologistId = json['psychologist_id'] != null ? DoctorId.fromJson(json['psychologist_id']) : null;
    pythiscalLimitation = json['pythiscal_limitation'];
    questionnaireId = json['questionnaire_id'];
    respiratoryDis = json['respiratory_dis'];
    stepName = json['step_name'];
    surgeon2Id = json['surgeon2_id'] != null ? DoctorId.fromJson(json['surgeon2_id']) : null;
    surgeonId = json['surgeon_id'] != null ? DoctorId.fromJson(json['surgeon_id']) : null;
    vte = json['vte'];
    dietation_feedback_decision = json['dietation_feedback_decision'];
  }

  String? mdtStatus;
  String? egdResults;
  String? id;
  String? email;
  bool? verified;
  String? fNameAr;
  String? lNameAr;
  String? fNameEn;
  String? lNameEn;
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
  bool? consent;
  num? age;
  num? weight;
  num? height;
  num? bmi;
  String? fileId;
  bool? surgionVisit;
  bool? dmType;
  bool? htn;
  bool? osa;
  bool? fattyLiver;
  bool? pcos;
  bool? cardiacDiseaseIhd;
  bool? cardiacDiseaseHf;
  bool? respiratoryDisVte;
  bool? respiratoryDisAnticoag;
  bool? respiratoryDisAntiplate;
  String? coMorbiditiesOtherNotes;
  bool? reflux;
  bool? refluxMedRegular;
  bool? refluxMedOcc;
  bool? refluxMedNone;
  bool? nonSmoker;
  bool? exSmoker;
  bool? occationalSmoker;
  bool? vape;
  bool? lessThan20Cigg;
  bool? moreThan20Cigg;
  bool? shisha;
  bool? historyOfBallon;
  num? ballonWeightLossFrom;
  num? ballonWeightLossTo;
  String? ballonDateOfInsertion;
  String? ballonDateOfRemoval;
  bool? historyOfWeightLoss;
  num? weightLossOutcomeResult;
  String? weightLossOutcomeDate;
  bool? medicationTypeVictoza;
  bool? medicationTypeSaxenda;
  bool? medicationTypeOzempic;
  bool? medicationTypeWegovo;
  bool? medicationTypeTrulicity;
  bool? medicationTypeMounjaro;
  bool? previousBariatric;
  num? bariatricOutcomeResult;
  String? bariatricOutcomeDate;
  bool? surgeryTypeLsg;
  bool? surgeryTypeLagb;
  bool? surgeryTypePilication;
  bool? surgeryTypeRygbp;
  bool? surgeryTypeMgbp;
  bool? surgeryTypeSadiS;
  bool? ultrasound;
  bool? surgeryTypeSasi;
  bool? ultrasoundFindingFattyLiver;
  bool? ultrasoundFindingGbs;
  bool? ultrasoundFindingHernia;
  bool? ultrasoundFindingCirrhos;
  bool? ultrasoundFindingOthers;
  String? ultrasoundFindingOthersNote;
  bool? egd;
  String? egbResults;
  String? fluoroscopyResult;
  String? otherNotes;
  bool? bulkEater;
  bool? sweetEater;
  bool? fizzyDrinks;
  bool? frequentMeals;
  bool? lateTime;
  bool? nippler;
  bool? junkFood;
  bool? iron;
  bool? vitB12;
  bool? vitD;
  bool? protein;
  String? attemptLoseNotes;
  String? dietationFeedbackDecision;
  String? dietationFeedbackDecisionDate;
  bool? proteinInTake;
  bool? takingSupplements;
  bool? fiberInTake;
  bool? physicallyActive;
  String? dietPlan;
  String? postFeedback;
  num? avgStepCount;
  String? physicalFitness;
  String? cardiovascular;
  String? lungEndurance;
  String? feedback;
  String? feedbackDate;
  bool? watchedClip;
  String? eduFeedbackDate;
  String? eduFeedback;
  String? notes;
  String? mdtDateTime;
  dynamic mdtSessionDuration;
  String? mdtResults;
  String? mdtComments;
  bool? status;
  String? adminCreatedId;
  String? createdAt;
  String? updatedAt;
  num? v;
  bool? overallStatus;
  String? adminUpdatedId;
  bool? alcohol;
  bool? anticoag;
  bool? antiplate;
  String? anxietyResult;
  num? anxietyScore;
  String? depressionResult;
  num? depressionScore;
  String? dietaryIntake;
  DoctorId? dietationId;
  bool? dmTypel;
  bool? dmTypell;
  bool? dyslipidemia;
  bool? egdAnastomoticSize;
  String? egdAnastomoticSizeNumber;
  bool? egdBile;
  bool? egdDilatedFundus;
  bool? egdDuodenumNormal;
  String? egdDuodenumOthers;
  bool? egdDuodenumUlcer;
  String? egdHiatusHerniaSize;
  String? egdHiatusHerniaSizeCm;
  bool? egdNormal;
  bool? egdOesophagusBarrets;
  bool? egdOesophagusGrade;
  String? egdOesophagusGradeType;
  bool? egdOesophagusNormal;
  bool? egdOesophagusOesophagitis;
  String? egdOesophagusOther;
  bool? egdPanDilatation;
  bool? egdPouchDialation;
  bool? egdPreviousSurgery;
  bool? egdPreviousSurgeryTypeLagb;
  bool? egdPreviousSurgeryTypeLsg;
  bool? egdPreviousSurgeryTypeMgbp;
  bool? egdPreviousSurgeryTypeRygbp;
  bool? egdStomachAntral;
  bool? egdStomachBody;
  bool? egdStomachFundal;
  bool? egdStomachGas;
  bool? egdStomachGrastricUlcer;
  bool? egdStomachHPylori;
  bool? egdStomachHaitus;
  String? egdStomachOthers;
  bool? egdStomachPang;
  bool? egdStomachPolyps;
  bool? egdStructure;
  bool? egdTwist;
  bool? egdUlcer;
  String? finalFeedback;
  String? finalFeedbackDate;
  String? followUpFeedback;
  DoctorId? physiotherapyId;
  DoctorId? psychologistId;
  String? pythiscalLimitation;
  String? questionnaireId;
  bool? respiratoryDis;
  String? stepName;
  DoctorId? surgeon2Id;
  DoctorId? surgeonId;
  bool? vte;
  String? dietation_feedback_decision;

  Patient copyWith({
    String? mdtStatus,
    String? egdResults,
    String? id,
    String? email,
    bool? verified,
    String? fNameAr,
    String? lNameAr,
    String? fNameEn,
    String? lNameEn,
    String? gender,
    String? civilId,
    String? image,
    String? publicId,
    String? telephone1,
    String? telephone2,
    String? role,
    String? operationStatus,
    String? operationDate,
    String? operationType,
    bool? consent,
    num? age,
    num? weight,
    num? height,
    num? bmi,
    String? fileId,
    bool? surgionVisit,
    bool? dmType,
    bool? htn,
    bool? osa,
    bool? fattyLiver,
    bool? pcos,
    bool? cardiacDiseaseIhd,
    bool? cardiacDiseaseHf,
    bool? respiratoryDisVte,
    bool? respiratoryDisAnticoag,
    bool? respiratoryDisAntiplate,
    String? coMorbiditiesOtherNotes,
    bool? reflux,
    bool? refluxMedRegular,
    bool? refluxMedOcc,
    bool? refluxMedNone,
    bool? nonSmoker,
    bool? exSmoker,
    bool? occationalSmoker,
    bool? vape,
    bool? lessThan20Cigg,
    bool? moreThan20Cigg,
    bool? shisha,
    bool? historyOfBallon,
    num? ballonWeightLossFrom,
    num? ballonWeightLossTo,
    String? ballonDateOfInsertion,
    String? ballonDateOfRemoval,
    bool? historyOfWeightLoss,
    num? weightLossOutcomeResult,
    String? weightLossOutcomeDate,
    bool? medicationTypeVictoza,
    bool? medicationTypeSaxenda,
    bool? medicationTypeOzempic,
    bool? medicationTypeWegovo,
    bool? medicationTypeTrulicity,
    bool? medicationTypeMounjaro,
    bool? previousBariatric,
    num? bariatricOutcomeResult,
    String? bariatricOutcomeDate,
    bool? surgeryTypeLsg,
    bool? surgeryTypeLagb,
    bool? surgeryTypePilication,
    bool? surgeryTypeRygbp,
    bool? surgeryTypeMgbp,
    bool? surgeryTypeSadiS,
    bool? ultrasound,
    bool? surgeryTypeSasi,
    bool? ultrasoundFindingFattyLiver,
    bool? ultrasoundFindingGbs,
    bool? ultrasoundFindingHernia,
    bool? ultrasoundFindingCirrhos,
    bool? ultrasoundFindingOthers,
    String? ultrasoundFindingOthersNote,
    bool? egd,
    String? egbResults,
    String? fluoroscopyResult,
    String? otherNotes,
    bool? bulkEater,
    bool? sweetEater,
    bool? fizzyDrinks,
    bool? frequentMeals,
    bool? lateTime,
    bool? nippler,
    bool? junkFood,
    bool? iron,
    bool? vitB12,
    bool? vitD,
    bool? protein,
    String? attemptLoseNotes,
    String? dietationFeedbackDecision,
    String? dietationFeedbackDecisionDate,
    bool? proteinInTake,
    bool? takingSupplements,
    bool? fiberInTake,
    bool? physicallyActive,
    String? dietPlan,
    String? postFeedback,
    num? avgStepCount,
    String? physicalFitness,
    String? cardiovascular,
    String? lungEndurance,
    String? feedback,
    String? feedbackDate,
    bool? watchedClip,
    String? eduFeedbackDate,
    String? eduFeedback,
    String? notes,
    String? mdtDateTime,
    num? mdtSessionDuration,
    String? mdtResults,
    String? mdtComments,
    bool? status,
    String? adminCreatedId,
    String? createdAt,
    String? updatedAt,
    num? v,
    bool? overallStatus,
    String? adminUpdatedId,
    bool? alcohol,
    bool? anticoag,
    bool? antiplate,
    String? anxietyResult,
    num? anxietyScore,
    String? depressionResult,
    num? depressionScore,
    String? dietaryIntake,
    DoctorId? dietationId,
    bool? dmTypel,
    bool? dmTypell,
    bool? dyslipidemia,
    bool? egdAnastomoticSize,
    String? egdAnastomoticSizeNumber,
    bool? egdBile,
    bool? egdDilatedFundus,
    bool? egdDuodenumNormal,
    String? egdDuodenumOthers,
    bool? egdDuodenumUlcer,
    String? egdHiatusHerniaSize,
    String? egdHiatusHerniaSizeCm,
    bool? egdNormal,
    bool? egdOesophagusBarrets,
    bool? egdOesophagusGrade,
    String? egdOesophagusGradeType,
    bool? egdOesophagusNormal,
    bool? egdOesophagusOesophagitis,
    String? egdOesophagusOther,
    bool? egdPanDilatation,
    bool? egdPouchDialation,
    bool? egdPreviousSurgery,
    bool? egdPreviousSurgeryTypeLagb,
    bool? egdPreviousSurgeryTypeLsg,
    bool? egdPreviousSurgeryTypeMgbp,
    bool? egdPreviousSurgeryTypeRygbp,
    bool? egdStomachAntral,
    bool? egdStomachBody,
    bool? egdStomachFundal,
    bool? egdStomachGas,
    bool? egdStomachGrastricUlcer,
    bool? egdStomachHPylori,
    bool? egdStomachHaitus,
    String? egdStomachOthers,
    bool? egdStomachPang,
    bool? egdStomachPolyps,
    bool? egdStructure,
    bool? egdTwist,
    bool? egdUlcer,
    String? finalFeedback,
    String? finalFeedbackDate,
    String? followUpFeedback,
    DoctorId? physiotherapyId,
    DoctorId? psychologistId,
    String? pythiscalLimitation,
    String? questionnaireId,
    bool? respiratoryDis,
    String? stepName,
    DoctorId? surgeon2Id,
    DoctorId? surgeonId,
    bool? vte,
    String? dietation_feedback_decision,
  }) =>
      Patient(
          mdtStatus: mdtStatus ?? this.mdtStatus,
          egdResults: egdResults ?? this.egdResults,
          id: id ?? this.id,
          email: email ?? this.email,
          verified: verified ?? this.verified,
          fNameAr: fNameAr ?? this.fNameAr,
          lNameAr: lNameAr ?? this.lNameAr,
          fNameEn: fNameEn ?? this.fNameEn,
          lNameEn: lNameEn ?? this.lNameEn,
          gender: gender ?? this.gender,
          civilId: civilId ?? this.civilId,
          image: image ?? this.image,
          publicId: publicId ?? this.publicId,
          telephone1: telephone1 ?? this.telephone1,
          telephone2: telephone2 ?? this.telephone2,
          role: role ?? this.role,
          operationStatus: operationStatus ?? this.operationStatus,
          operationDate: operationDate ?? this.operationDate,
          operationType: operationType ?? this.operationType,
          consent: consent ?? this.consent,
          age: age ?? this.age,
          weight: weight ?? this.weight,
          height: height ?? this.height,
          bmi: bmi ?? this.bmi,
          fileId: fileId ?? this.fileId,
          surgionVisit: surgionVisit ?? this.surgionVisit,
          dmType: dmType ?? this.dmType,
          htn: htn ?? this.htn,
          osa: osa ?? this.osa,
          fattyLiver: fattyLiver ?? this.fattyLiver,
          pcos: pcos ?? this.pcos,
          cardiacDiseaseIhd: cardiacDiseaseIhd ?? this.cardiacDiseaseIhd,
          cardiacDiseaseHf: cardiacDiseaseHf ?? this.cardiacDiseaseHf,
          respiratoryDisVte: respiratoryDisVte ?? this.respiratoryDisVte,
          respiratoryDisAnticoag: respiratoryDisAnticoag ?? this.respiratoryDisAnticoag,
          respiratoryDisAntiplate: respiratoryDisAntiplate ?? this.respiratoryDisAntiplate,
          coMorbiditiesOtherNotes: coMorbiditiesOtherNotes ?? this.coMorbiditiesOtherNotes,
          reflux: reflux ?? this.reflux,
          refluxMedRegular: refluxMedRegular ?? this.refluxMedRegular,
          refluxMedOcc: refluxMedOcc ?? this.refluxMedOcc,
          refluxMedNone: refluxMedNone ?? this.refluxMedNone,
          nonSmoker: nonSmoker ?? this.nonSmoker,
          exSmoker: exSmoker ?? this.exSmoker,
          occationalSmoker: occationalSmoker ?? this.occationalSmoker,
          vape: vape ?? this.vape,
          lessThan20Cigg: lessThan20Cigg ?? this.lessThan20Cigg,
          moreThan20Cigg: moreThan20Cigg ?? this.moreThan20Cigg,
          shisha: shisha ?? this.shisha,
          historyOfBallon: historyOfBallon ?? this.historyOfBallon,
          ballonWeightLossFrom: ballonWeightLossFrom ?? this.ballonWeightLossFrom,
          ballonWeightLossTo: ballonWeightLossTo ?? this.ballonWeightLossTo,
          ballonDateOfInsertion: ballonDateOfInsertion ?? this.ballonDateOfInsertion,
          ballonDateOfRemoval: ballonDateOfRemoval ?? this.ballonDateOfRemoval,
          historyOfWeightLoss: historyOfWeightLoss ?? this.historyOfWeightLoss,
          weightLossOutcomeResult: weightLossOutcomeResult ?? this.weightLossOutcomeResult,
          weightLossOutcomeDate: weightLossOutcomeDate ?? this.weightLossOutcomeDate,
          medicationTypeVictoza: medicationTypeVictoza ?? this.medicationTypeVictoza,
          medicationTypeSaxenda: medicationTypeSaxenda ?? this.medicationTypeSaxenda,
          medicationTypeOzempic: medicationTypeOzempic ?? this.medicationTypeOzempic,
          medicationTypeWegovo: medicationTypeWegovo ?? this.medicationTypeWegovo,
          medicationTypeTrulicity: medicationTypeTrulicity ?? this.medicationTypeTrulicity,
        medicationTypeMounjaro: medicationTypeMounjaro ?? this.medicationTypeMounjaro,
          previousBariatric: previousBariatric ?? this.previousBariatric,
          bariatricOutcomeResult: bariatricOutcomeResult ?? this.bariatricOutcomeResult,
          bariatricOutcomeDate: bariatricOutcomeDate ?? this.bariatricOutcomeDate,
          surgeryTypeLsg: surgeryTypeLsg ?? this.surgeryTypeLsg,
          surgeryTypeLagb: surgeryTypeLagb ?? this.surgeryTypeLagb,
          surgeryTypePilication: surgeryTypePilication ?? this.surgeryTypePilication,
          surgeryTypeRygbp: surgeryTypeRygbp ?? this.surgeryTypeRygbp,
          surgeryTypeMgbp: surgeryTypeMgbp ?? this.surgeryTypeMgbp,
          surgeryTypeSadiS: surgeryTypeSadiS ?? this.surgeryTypeSadiS,
          ultrasound: ultrasound ?? this.ultrasound,
          surgeryTypeSasi: surgeryTypeSasi ?? this.surgeryTypeSasi,
          ultrasoundFindingFattyLiver: ultrasoundFindingFattyLiver ?? this.ultrasoundFindingFattyLiver,
          ultrasoundFindingGbs: ultrasoundFindingGbs ?? this.ultrasoundFindingGbs,
          ultrasoundFindingHernia: ultrasoundFindingHernia ?? this.ultrasoundFindingHernia,
          ultrasoundFindingCirrhos: ultrasoundFindingCirrhos ?? this.ultrasoundFindingCirrhos,
          ultrasoundFindingOthers: ultrasoundFindingOthers ?? this.ultrasoundFindingOthers,
          ultrasoundFindingOthersNote: ultrasoundFindingOthersNote ?? this.ultrasoundFindingOthersNote,
          egd: egd ?? this.egd,
          egbResults: egbResults ?? this.egbResults,
          fluoroscopyResult: fluoroscopyResult ?? this.fluoroscopyResult,
          otherNotes: otherNotes ?? this.otherNotes,
          bulkEater: bulkEater ?? this.bulkEater,
          sweetEater: sweetEater ?? this.sweetEater,
          fizzyDrinks: fizzyDrinks ?? this.fizzyDrinks,
          frequentMeals: frequentMeals ?? this.frequentMeals,
          lateTime: lateTime ?? this.lateTime,
          nippler: nippler ?? this.nippler,
          junkFood: junkFood ?? this.junkFood,
          iron: iron ?? this.iron,
          vitB12: vitB12 ?? this.vitB12,
          vitD: vitD ?? this.vitD,
          protein: protein ?? this.protein,
          attemptLoseNotes: attemptLoseNotes ?? this.attemptLoseNotes,
          dietationFeedbackDecision: dietationFeedbackDecision ?? this.dietationFeedbackDecision,
          dietationFeedbackDecisionDate: dietationFeedbackDecisionDate ?? this.dietationFeedbackDecisionDate,
          proteinInTake: proteinInTake ?? this.proteinInTake,
          takingSupplements: takingSupplements ?? this.takingSupplements,
          fiberInTake: fiberInTake ?? this.fiberInTake,
          physicallyActive: physicallyActive ?? this.physicallyActive,
          dietPlan: dietPlan ?? this.dietPlan,
          postFeedback: postFeedback ?? this.postFeedback,
          avgStepCount: avgStepCount ?? this.avgStepCount,
          physicalFitness: physicalFitness ?? this.physicalFitness,
          cardiovascular: cardiovascular ?? this.cardiovascular,
          lungEndurance: lungEndurance ?? this.lungEndurance,
          feedback: feedback ?? this.feedback,
          feedbackDate: feedbackDate ?? this.feedbackDate,
          watchedClip: watchedClip ?? this.watchedClip,
          eduFeedbackDate: eduFeedbackDate ?? this.eduFeedbackDate,
          eduFeedback: eduFeedback ?? this.eduFeedback,
          notes: notes ?? this.notes,
          mdtDateTime: mdtDateTime ?? this.mdtDateTime,
          mdtSessionDuration: mdtSessionDuration ?? this.mdtSessionDuration,
          mdtResults: mdtResults ?? this.mdtResults,
          mdtComments: mdtComments ?? this.mdtComments,
          status: status ?? this.status,
          adminCreatedId: adminCreatedId ?? this.adminCreatedId,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          v: v ?? this.v,
          overallStatus: overallStatus ?? this.overallStatus,
          adminUpdatedId: adminUpdatedId ?? this.adminUpdatedId,
          alcohol: alcohol ?? this.alcohol,
          anticoag: anticoag ?? this.anticoag,
          antiplate: antiplate ?? this.antiplate,
          anxietyResult: anxietyResult ?? this.anxietyResult,
          anxietyScore: anxietyScore ?? this.anxietyScore,
          depressionResult: depressionResult ?? this.depressionResult,
          depressionScore: depressionScore ?? this.depressionScore,
          dietaryIntake: dietaryIntake ?? this.dietaryIntake,
          dietationId: dietationId ?? this.dietationId,
          dmTypel: dmTypel ?? this.dmTypel,
          dmTypell: dmTypell ?? this.dmTypell,
          dyslipidemia: dyslipidemia ?? this.dyslipidemia,
          egdAnastomoticSize: egdAnastomoticSize ?? this.egdAnastomoticSize,
          egdAnastomoticSizeNumber: egdAnastomoticSizeNumber ?? this.egdAnastomoticSizeNumber,
          egdBile: egdBile ?? this.egdBile,
          egdDilatedFundus: egdDilatedFundus ?? this.egdDilatedFundus,
          egdDuodenumNormal: egdDuodenumNormal ?? this.egdDuodenumNormal,
          egdDuodenumOthers: egdDuodenumOthers ?? this.egdDuodenumOthers,
          egdDuodenumUlcer: egdDuodenumUlcer ?? this.egdDuodenumUlcer,
          egdHiatusHerniaSize: egdHiatusHerniaSize ?? this.egdHiatusHerniaSize,
          egdHiatusHerniaSizeCm: egdHiatusHerniaSizeCm ?? this.egdHiatusHerniaSizeCm,
          egdNormal: egdNormal ?? this.egdNormal,
          egdOesophagusBarrets: egdOesophagusBarrets ?? this.egdOesophagusBarrets,
          egdOesophagusGrade: egdOesophagusGrade ?? this.egdOesophagusGrade,
          egdOesophagusGradeType: egdOesophagusGradeType ?? this.egdOesophagusGradeType,
          egdOesophagusNormal: egdOesophagusNormal ?? this.egdOesophagusNormal,
          egdOesophagusOesophagitis: egdOesophagusOesophagitis ?? this.egdOesophagusOesophagitis,
          egdOesophagusOther: egdOesophagusOther ?? this.egdOesophagusOther,
          egdPanDilatation: egdPanDilatation ?? this.egdPanDilatation,
          egdPouchDialation: egdPouchDialation ?? this.egdPouchDialation,
          egdPreviousSurgery: egdPreviousSurgery ?? this.egdPreviousSurgery,
          egdPreviousSurgeryTypeLagb: egdPreviousSurgeryTypeLagb ?? this.egdPreviousSurgeryTypeLagb,
          egdPreviousSurgeryTypeLsg: egdPreviousSurgeryTypeLsg ?? this.egdPreviousSurgeryTypeLsg,
          egdPreviousSurgeryTypeMgbp: egdPreviousSurgeryTypeMgbp ?? this.egdPreviousSurgeryTypeMgbp,
          egdPreviousSurgeryTypeRygbp: egdPreviousSurgeryTypeRygbp ?? this.egdPreviousSurgeryTypeRygbp,
          egdStomachAntral: egdStomachAntral ?? this.egdStomachAntral,
          egdStomachBody: egdStomachBody ?? this.egdStomachBody,
          egdStomachFundal: egdStomachFundal ?? this.egdStomachFundal,
          egdStomachGas: egdStomachGas ?? this.egdStomachGas,
          egdStomachGrastricUlcer: egdStomachGrastricUlcer ?? this.egdStomachGrastricUlcer,
          egdStomachHPylori: egdStomachHPylori ?? this.egdStomachHPylori,
          egdStomachHaitus: egdStomachHaitus ?? this.egdStomachHaitus,
          egdStomachOthers: egdStomachOthers ?? this.egdStomachOthers,
          egdStomachPang: egdStomachPang ?? this.egdStomachPang,
          egdStomachPolyps: egdStomachPolyps ?? this.egdStomachPolyps,
          egdStructure: egdStructure ?? this.egdStructure,
          egdTwist: egdTwist ?? this.egdTwist,
          egdUlcer: egdUlcer ?? this.egdUlcer,
          finalFeedback: finalFeedback ?? this.finalFeedback,
          finalFeedbackDate: finalFeedbackDate ?? this.finalFeedbackDate,
          followUpFeedback: followUpFeedback ?? this.followUpFeedback,
          physiotherapyId: physiotherapyId ?? this.physiotherapyId,
          psychologistId: psychologistId ?? this.psychologistId,
          pythiscalLimitation: pythiscalLimitation ?? this.pythiscalLimitation,
          questionnaireId: questionnaireId ?? this.questionnaireId,
          respiratoryDis: respiratoryDis ?? this.respiratoryDis,
          stepName: stepName ?? this.stepName,
          surgeon2Id: surgeon2Id ?? this.surgeon2Id,
          surgeonId: surgeonId ?? this.surgeonId,
          vte: vte ?? this.vte,
          dietation_feedback_decision: dietation_feedback_decision ?? this.dietation_feedback_decision,);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mdt_status'] = mdtStatus;
    map['egd_results'] = egdResults;
    map['_id'] = id;
    map['email'] = email;
    map['verified'] = verified;
    map['first_name_ar'] = fNameAr;
    map['last_name_ar'] = lNameAr;
    map['first_name_en'] = fNameEn;
    map['last_name_en'] = lNameEn;
    map['gender'] = gender;
    map['civil_id'] = civilId;
    map['image'] = image;
    map['public_id'] = publicId;
    map['telephone_1'] = telephone1;
    map['telephone_2'] = telephone2;
    map['role'] = role;
    map['operation_status'] = operationStatus;
    map['operation_date'] = operationDate;
    map['operation_type'] = operationType;
    map['consent'] = consent;
    map['age'] = age;
    map['weight'] = weight;
    map['height'] = height;
    map['bmi'] = bmi;
    map['file_id'] = fileId;
    map['surgion_visit'] = surgionVisit;
    map['dm_type'] = dmType;
    map['htn'] = htn;
    map['osa'] = osa;
    map['fatty_liver'] = fattyLiver;
    map['pcos'] = pcos;
    map['cardiac_disease_ihd'] = cardiacDiseaseIhd;
    map['cardiac_disease_hf'] = cardiacDiseaseHf;
    map['respiratory_dis_vte'] = respiratoryDisVte;
    map['respiratory_dis_anticoag'] = respiratoryDisAnticoag;
    map['respiratory_dis_antiplate'] = respiratoryDisAntiplate;
    map['co_morbidities_other_notes'] = coMorbiditiesOtherNotes;
    map['reflux'] = reflux;
    map['reflux_med_regular'] = refluxMedRegular;
    map['reflux_med_occ'] = refluxMedOcc;
    map['reflux_med_none'] = refluxMedNone;
    map['non_smoker'] = nonSmoker;
    map['ex_smoker'] = exSmoker;
    map['occational_smoker'] = occationalSmoker;
    map['vape'] = vape;
    map['less_than_20_cigg'] = lessThan20Cigg;
    map['more_than_20_cigg'] = moreThan20Cigg;
    map['shisha'] = shisha;
    map['history_of_ballon'] = historyOfBallon;
    map['ballon_weight_loss_from'] = ballonWeightLossFrom;
    map['ballon_weight_loss_to'] = ballonWeightLossTo;
    map['ballon_date_of_insertion'] = ballonDateOfInsertion;
    map['ballon_date_of_removal'] = ballonDateOfRemoval;
    map['history_of_weight_loss'] = historyOfWeightLoss;
    map['weight_loss_outcome_result'] = weightLossOutcomeResult;
    map['weight_loss_outcome_date'] = weightLossOutcomeDate;
    map['medication_type_victoza'] = medicationTypeVictoza;
    map['medication_type_saxenda'] = medicationTypeSaxenda;
    map['medication_type_ozempic'] = medicationTypeOzempic;
    map['medication_type_wegovo'] = medicationTypeWegovo;
    map['medication_type_trulicity'] = medicationTypeTrulicity;
    map['medication_type_mounjaro'] = medicationTypeMounjaro;
    map['previous_bariatric'] = previousBariatric;
    map['bariatric_outcome_result'] = bariatricOutcomeResult;
    map['bariatric_outcome_date'] = bariatricOutcomeDate;
    map['surgery_type_lsg'] = surgeryTypeLsg;
    map['surgery_type_lagb'] = surgeryTypeLagb;
    map['surgery_type_pilication'] = surgeryTypePilication;
    map['surgery_type_rygbp'] = surgeryTypeRygbp;
    map['surgery_type_mgbp'] = surgeryTypeMgbp;
    map['surgery_type_sadi_s'] = surgeryTypeSadiS;
    map['ultrasound'] = ultrasound;
    map['surgery_type_sasi'] = surgeryTypeSasi;
    map['ultrasound_finding_fatty_liver'] = ultrasoundFindingFattyLiver;
    map['ultrasound_finding_gbs'] = ultrasoundFindingGbs;
    map['ultrasound_finding_hernia'] = ultrasoundFindingHernia;
    map['ultrasound_finding_cirrhos'] = ultrasoundFindingCirrhos;
    map['ultrasound_finding_others'] = ultrasoundFindingOthers;
    map['ultrasound_finding_others_note'] = ultrasoundFindingOthersNote;
    map['egd'] = egd;
    map['egb_results'] = egbResults;
    map['fluoroscopy_result'] = fluoroscopyResult;
    map['other_notes'] = otherNotes;
    map['bulk_eater'] = bulkEater;
    map['sweet_eater'] = sweetEater;
    map['fizzy_drinks'] = fizzyDrinks;
    map['frequent_meals'] = frequentMeals;
    map['late_time'] = lateTime;
    map['nippler'] = nippler;
    map['junk_food'] = junkFood;
    map['iron'] = iron;
    map['vit_b12'] = vitB12;
    map['vit_d'] = vitD;
    map['protein'] = protein;
    map['attempt_lose_notes'] = attemptLoseNotes;
    map['dietation_feedback_decision'] = dietationFeedbackDecision;
    map['dietation_feedback_decision_date'] = dietationFeedbackDecisionDate;
    map['protein_in_take'] = proteinInTake;
    map['taking_supplements'] = takingSupplements;
    map['fiber_in_take'] = fiberInTake;
    map['physically_active'] = physicallyActive;
    map['diet_plan'] = dietPlan;
    map['post_feedback'] = postFeedback;
    map['avg_step_count'] = avgStepCount;
    map['physical_fitness'] = physicalFitness;
    map['cardiovascular'] = cardiovascular;
    map['lung_endurance'] = lungEndurance;
    map['feedback'] = feedback;
    map['feedback_date'] = feedbackDate;
    map['watched_clip'] = watchedClip;
    map['edu_feedback_date'] = eduFeedbackDate;
    map['edu_feedback'] = eduFeedback;
    map['notes'] = notes;
    map['mdt_date_time'] = mdtDateTime;
    map['mdt_session_duration'] = mdtSessionDuration;
    map['mdt_results'] = mdtResults;
    map['mdt_comments'] = mdtComments;
    map['status'] = status;
    map['admin_created_id'] = adminCreatedId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['overall_status'] = overallStatus;
    map['admin_updated_id'] = adminUpdatedId;
    map['alcohol'] = alcohol;
    map['anticoag'] = anticoag;
    map['antiplate'] = antiplate;
    map['anxiety_result'] = anxietyResult;
    map['anxiety_score'] = anxietyScore;
    map['depression_result'] = depressionResult;
    map['depression_score'] = depressionScore;
    map['dietary_intake'] = dietaryIntake;
    if (dietationId != null) {
      map['dietation_id'] = dietationId?.toJson();
    }
    map['dm_typel'] = dmTypel;
    map['dm_typell'] = dmTypell;
    map['dyslipidemia'] = dyslipidemia;
    map['egd_anastomotic_size'] = egdAnastomoticSize;
    map['egd_anastomotic_size_number'] = egdAnastomoticSizeNumber;
    map['egd_bile'] = egdBile;
    map['egd_dilated_fundus'] = egdDilatedFundus;
    map['egd_duodenum_normal'] = egdDuodenumNormal;
    map['egd_duodenum_others'] = egdDuodenumOthers;
    map['egd_duodenum_ulcer'] = egdDuodenumUlcer;
    map['egd_hiatus_hernia_size'] = egdHiatusHerniaSize;
    map['egd_hiatus_hernia_size_cm'] = egdHiatusHerniaSizeCm;
    map['egd_normal'] = egdNormal;
    map['egd_oesophagus_barrets'] = egdOesophagusBarrets;
    map['egd_oesophagus_grade'] = egdOesophagusGrade;
    map['egd_oesophagus_grade_type'] = egdOesophagusGradeType;
    map['egd_oesophagus_normal'] = egdOesophagusNormal;
    map['egd_oesophagus_oesophagitis'] = egdOesophagusOesophagitis;
    map['egd_oesophagus_other'] = egdOesophagusOther;
    map['egd_pan_dilatation'] = egdPanDilatation;
    map['egd_pouch_dialation'] = egdPouchDialation;
    map['egd_previous_surgery'] = egdPreviousSurgery;
    map['egd_previous_surgery_type_lagb'] = egdPreviousSurgeryTypeLagb;
    map['egd_previous_surgery_type_lsg'] = egdPreviousSurgeryTypeLsg;
    map['egd_previous_surgery_type_mgbp'] = egdPreviousSurgeryTypeMgbp;
    map['egd_previous_surgery_type_rygbp'] = egdPreviousSurgeryTypeRygbp;
    map['egd_stomach_antral'] = egdStomachAntral;
    map['egd_stomach_body'] = egdStomachBody;
    map['egd_stomach_fundal'] = egdStomachFundal;
    map['egd_stomach_gas'] = egdStomachGas;
    map['egd_stomach_grastric_ulcer'] = egdStomachGrastricUlcer;
    map['egd_stomach_h_pylori'] = egdStomachHPylori;
    map['egd_stomach_haitus'] = egdStomachHaitus;
    map['egd_stomach_others'] = egdStomachOthers;
    map['egd_stomach_pang'] = egdStomachPang;
    map['egd_stomach_polyps'] = egdStomachPolyps;
    map['egd_structure'] = egdStructure;
    map['egd_twist'] = egdTwist;
    map['egd_ulcer'] = egdUlcer;
    map['final_feedback'] = finalFeedback;
    map['final_feedback_date'] = finalFeedbackDate;
    map['follow_up_feedback'] = followUpFeedback;
    if (physiotherapyId != null) {
      map['physiotherapy_id'] = physiotherapyId?.toJson();
    }
    if (psychologistId != null) {
      map['psychologist_id'] = psychologistId?.toJson();
    }
    map['pythiscal_limitation'] = pythiscalLimitation;
    map['questionnaire_id'] = questionnaireId;
    map['respiratory_dis'] = respiratoryDis;
    map['step_name'] = stepName;
    if (surgeon2Id != null) {
      map['surgeon2_id'] = surgeon2Id?.toJson();
    }
    if (surgeonId != null) {
      map['surgeon_id'] = surgeonId?.toJson();
    }
    map['vte'] = vte;
    map['dietation_feedback_decision'] = dietation_feedback_decision;
    return map;
  }
}
