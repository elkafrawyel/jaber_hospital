import '../../general/models/patient_model.dart';
import 'answer_model.dart';

class QuesAnswerResponse {
  int? code;
  bool? success;
  Message? message;
  List<Data>? data;

  QuesAnswerResponse({this.code, this.success, this.message, this.data});

  QuesAnswerResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  String? messageEn;
  String? messageAr;

  Message({this.messageEn, this.messageAr});

  Message.fromJson(Map<String, dynamic> json) {
    messageEn = json['message_en'];
    messageAr = json['message_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message_en'] = this.messageEn;
    data['message_ar'] = this.messageAr;
    return data;
  }
}

class Data {
  String? sId;
  QuestionnaireId? questionnaireId;
  PatientId? patientId;
  List<AnswerModel>? answersObjects;
  bool? status;
  String? adminCratedId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? depressionScore;
  String? depressionScoreLevel;
  String? questionnaireType;
  String? anxietyScore;
  String? anxietyScoreLevel;

  Data(
      {this.sId,
        this.questionnaireId,
        this.patientId,
        this.answersObjects,
        this.status,
        this.adminCratedId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.depressionScore,
        this.depressionScoreLevel,
        this.questionnaireType,
        this.anxietyScore,
        this.anxietyScoreLevel});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    questionnaireId = json['questionnaire_id'] != null
        ? new QuestionnaireId.fromJson(json['questionnaire_id'])
        : null;
    patientId = json['patient_id'] != null
        ? PatientId.fromJson(json['patient_id'])
        : null;
    if (json['answers_objects'] != null) {
      answersObjects = <AnswerModel>[];
      json['answers_objects'].forEach((v) {
        answersObjects!.add(AnswerModel.fromJson(v));
      });
    }
    status = json['status'];
    adminCratedId = json['admin_crated_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    depressionScore = json['depressionScore'];
    depressionScoreLevel = json['depressionScoreLevel'];
    questionnaireType = json['questionnaire_type'];
    anxietyScore = json['anxietyScore'];
    anxietyScoreLevel = json['anxietyScoreLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.questionnaireId != null) {
      data['questionnaire_id'] = this.questionnaireId!.toJson();
    }
    if (this.patientId != null) {
      data['patient_id'] = this.patientId!.toJson();
    }
    if (this.answersObjects != null) {
      data['answers_objects'] =
          this.answersObjects!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['admin_crated_id'] = this.adminCratedId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['depressionScore'] = this.depressionScore;
    data['depressionScoreLevel'] = this.depressionScoreLevel;
    data['questionnaire_type'] = this.questionnaireType;
    data['anxietyScore'] = this.anxietyScore;
    data['anxietyScoreLevel'] = this.anxietyScoreLevel;
    return data;
  }
}

class QuestionnaireId {
  String? sId;
  String? questionnaireNameAr;
  String? questionnaireNameEn;

  QuestionnaireId(
      {this.sId, this.questionnaireNameAr, this.questionnaireNameEn});

  QuestionnaireId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    questionnaireNameAr = json['questionnaire_name_ar'];
    questionnaireNameEn = json['questionnaire_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['questionnaire_name_ar'] = this.questionnaireNameAr;
    data['questionnaire_name_en'] = this.questionnaireNameEn;
    return data;
  }
}