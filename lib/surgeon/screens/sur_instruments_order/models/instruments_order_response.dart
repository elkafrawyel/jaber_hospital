class InstrumentsOrderResponse {
  int? code;
  bool? success;
  OrderData? orderData;
  Message? message;

  InstrumentsOrderResponse({this.code, this.success, this.orderData, this.message});

  InstrumentsOrderResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    orderData = json['data'] != null ? OrderData.fromJson(json['data']) : null;
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    if (this.orderData != null) {
      data['data'] = this.orderData!.toJson();
    }
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class OrderData {
  String? doctorId;
  String? companyId;
  String? patientId;
  String? mobileNumber;
  String? orderStartDate;
  String? orderCompletedDate;
  String? orderStatus;
  bool? status;
  String? sId;
  int? orderNum;
  String? createdAt;
  String? updatedAt;
  int? iV;

  OrderData(
      {this.doctorId,
        this.companyId,
        this.patientId,
        this.mobileNumber,
        this.orderStartDate,
        this.orderCompletedDate,
        this.orderStatus,
        this.status,
        this.sId,
        this.orderNum,
        this.createdAt,
        this.updatedAt,
        this.iV});

  OrderData.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    companyId = json['company_id'];
    patientId = json['patient_id'];
    mobileNumber = json['mobile_number'];
    orderStartDate = json['order_start_date'];
    orderCompletedDate = json['order_completed_date'];
    orderStatus = json['order_status'];
    status = json['status'];
    sId = json['_id'];
    orderNum = json['order_num'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = this.doctorId;
    data['company_id'] = this.companyId;
    data['patient_id'] = this.patientId;
    data['mobile_number'] = this.mobileNumber;
    data['order_start_date'] = this.orderStartDate;
    data['order_completed_date'] = this.orderCompletedDate;
    data['order_status'] = this.orderStatus;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['order_num'] = this.orderNum;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
