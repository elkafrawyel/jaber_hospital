class TimeSlotsModelResponse {
  int? code;
  Message? message;
  bool? success;
  List<TimeSlot>? times;

  TimeSlotsModelResponse({this.code, this.message, this.success, this.times});

  TimeSlotsModelResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    success = json['success'];
    if (json['data'] != null) {
      times = <TimeSlot>[];
      json['data'].forEach((v) {
        times!.add(TimeSlot.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    data['success'] = this.success;
    if (this.times != null) {
      data['data'] = this.times!.map((v) => v.toJson()).toList();
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

class TimeSlot {
  String? sId;
  String? mdtDateTime;
  String? mdtTime;

  TimeSlot({this.sId, this.mdtDateTime,this.mdtTime});

  TimeSlot.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mdtDateTime = json['mdt_date_time'];
    mdtTime = json['mdt_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['mdt_date_time'] = this.mdtDateTime;
    data['mdt_time'] = this.mdtTime;
    return data;
  }
}