class GeneralProgressResponse {
  bool? success;
  Message? message;
  Data? data;

  GeneralProgressResponse({this.success, this.message, this.data});

  GeneralProgressResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? fullNameAr;
  String? fullNameEn;
  String? image;
  bool? surgionVisit;
  bool? ultrasound;
  bool? egd;
  String? dietationFeedbackDecision;
  String? finalFeedback;
  String? feedback;
  bool? watchedClip;

  Data(
      {this.sId,
        this.fullNameAr,
        this.fullNameEn,
        this.image,
        this.surgionVisit,
        this.ultrasound,
        this.egd,
        this.dietationFeedbackDecision,
        this.finalFeedback,
        this.feedback,
        this.watchedClip});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullNameAr = json['full_name_ar'];
    fullNameEn = json['full_name_en'];
    image = json['image'];
    surgionVisit = json['surgion_visit'];
    ultrasound = json['ultrasound'];
    egd = json['egd'];
    dietationFeedbackDecision = json['dietation_feedback_decision'];
    finalFeedback = json['final_feedback'];
    feedback = json['feedback'];
    watchedClip = json['watched_clip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['full_name_ar'] = this.fullNameAr;
    data['full_name_en'] = this.fullNameEn;
    data['image'] = this.image;
    data['surgion_visit'] = this.surgionVisit;
    data['ultrasound'] = this.ultrasound;
    data['egd'] = this.egd;
    data['dietation_feedback_decision'] = this.dietationFeedbackDecision;
    data['final_feedback'] = this.finalFeedback;
    data['feedback'] = this.feedback;
    data['watched_clip'] = this.watchedClip;
    return data;
  }
}