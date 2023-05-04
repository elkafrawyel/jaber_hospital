import '../../general/models/doctor_model.dart';
import 'question_objects.dart';

class QuestionnaireModel {
  int? code;
  Message? message;
  bool? success;
  List<Data>? data;
  PageInfo? pageInfo;

  QuestionnaireModel({this.code, this.message, this.success, this.data, this.pageInfo});

  QuestionnaireModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    pageInfo = json['page_info'] != null
        ? new PageInfo.fromJson(json['page_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pageInfo != null) {
      data['page_info'] = this.pageInfo!.toJson();
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
  String? questionnaireNameAr;
  String? questionnaireNameEn;
  DoctorId? doctorId;
  List<QuestionsObjects>? questionsObjects;
  int? normalScoreStart;
  int? normalScoreEnd;
  int? mildScoreStart;
  int? mildScoreEnd;
  int? moderateScoreStart;
  int? moderateScoreEnd;
  int? severeScoreStart;
  int? severeScoreEnd;
  bool? status;
  String? adminCratedId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? adminUpdatedId;

  Data(
      {this.sId,
        this.questionnaireNameAr,
        this.questionnaireNameEn,
        this.doctorId,
        this.questionsObjects,
        this.normalScoreStart,
        this.normalScoreEnd,
        this.mildScoreStart,
        this.mildScoreEnd,
        this.moderateScoreStart,
        this.moderateScoreEnd,
        this.severeScoreStart,
        this.severeScoreEnd,
        this.status,
        this.adminCratedId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.adminUpdatedId});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    questionnaireNameAr = json['questionnaire_name_ar'];
    questionnaireNameEn = json['questionnaire_name_en'];
    doctorId = json['doctor_id'] != null
        ? new DoctorId.fromJson(json['doctor_id'])
        : null;
    if (json['questions_objects'] != null) {
      questionsObjects = <QuestionsObjects>[];
      json['questions_objects'].forEach((v) {
        questionsObjects!.add(new QuestionsObjects.fromJson(v));
      });
    }
    normalScoreStart = json['normal_score_start'];
    normalScoreEnd = json['normal_score_end'];
    mildScoreStart = json['mild_score_start'];
    mildScoreEnd = json['mild_score_end'];
    moderateScoreStart = json['moderate_score_start'];
    moderateScoreEnd = json['moderate_score_end'];
    severeScoreStart = json['severe_score_start'];
    severeScoreEnd = json['severe_score_end'];
    status = json['status'];
    adminCratedId = json['admin_crated_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    adminUpdatedId = json['admin_updated_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['questionnaire_name_ar'] = this.questionnaireNameAr;
    data['questionnaire_name_en'] = this.questionnaireNameEn;
    if (this.doctorId != null) {
      data['doctor_id'] = this.doctorId!.toJson();
    }
    if (this.questionsObjects != null) {
      data['questions_objects'] =
          this.questionsObjects!.map((v) => v.toJson()).toList();
    }
    data['normal_score_start'] = this.normalScoreStart;
    data['normal_score_end'] = this.normalScoreEnd;
    data['mild_score_start'] = this.mildScoreStart;
    data['mild_score_end'] = this.mildScoreEnd;
    data['moderate_score_start'] = this.moderateScoreStart;
    data['moderate_score_end'] = this.moderateScoreEnd;
    data['severe_score_start'] = this.severeScoreStart;
    data['severe_score_end'] = this.severeScoreEnd;
    data['status'] = this.status;
    data['admin_crated_id'] = this.adminCratedId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['admin_updated_id'] = this.adminUpdatedId;
    return data;
  }
}

class PageInfo {
  String? page;
  int? total;
  bool? hasPrevious;
  bool? hasNext;

  PageInfo({this.page, this.total, this.hasPrevious, this.hasNext});

  PageInfo.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    total = json['total'];
    hasPrevious = json['has_previous'];
    hasNext = json['has_next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total'] = this.total;
    data['has_previous'] = this.hasPrevious;
    data['has_next'] = this.hasNext;
    return data;
  }
}
