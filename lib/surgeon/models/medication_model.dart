class MedicationModel {
  int? code;
  Message? message;
  bool? success;
  List<MedicationInfo>? medicationInfoList;
  PageInfo? pageInfo;

  MedicationModel(
      {this.code,
      this.message,
      this.success,
      this.medicationInfoList,
      this.pageInfo});

  MedicationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
    success = json['success'];
    if (json['data'] != null) {
      medicationInfoList = <MedicationInfo>[];
      json['data'].forEach((v) {
        medicationInfoList!.add(new MedicationInfo.fromJson(v));
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
    if (this.medicationInfoList != null) {
      data['data'] = this.medicationInfoList!.map((v) => v.toJson()).toList();
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

class MedicationInfo {
  String? sId;
  String? medicationName;
  String? description;
  bool? status;
  CompanyId? companyId;
  String? dose;
  String? adminCreatedId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? adminUpdatedId;
  int? quantity;
  bool? isSelected ;

  MedicationInfo({
    this.sId,
    this.medicationName,
    this.description,
    this.status,
    this.companyId,
    this.dose,
    this.adminCreatedId,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.adminUpdatedId,
    this.quantity,
    this.isSelected ,
  });

  MedicationInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    medicationName = json['medication_name'];
    description = json['description'];
    status = json['status'];
    companyId = json['company_id'] != null
        ? new CompanyId.fromJson(json['company_id'])
        : null;
    dose = json['dose'];
    adminCreatedId = json['admin_created_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    adminUpdatedId = json['admin_updated_id'];
    quantity = 1;
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['medication_name'] = this.medicationName;
    data['description'] = this.description;
    data['status'] = this.status;
    if (this.companyId != null) {
      data['company_id'] = this.companyId!.toJson();
    }
    data['dose'] = this.dose;
    data['admin_created_id'] = this.adminCreatedId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['admin_updated_id'] = this.adminUpdatedId;
    return data;
  }
}

class CompanyId {
  String? sId;
  String? email;
  String? image;
  String? publicId;
  bool? status;
  String? companyNameEn;
  String? landLine;
  String? companyContactMobile;
  String? companyContactPerson;
  String? companyAddress;

  CompanyId(
      {this.sId,
      this.email,
      this.image,
      this.publicId,
      this.status,
      this.companyNameEn,
      this.companyContactMobile,
      this.companyContactPerson,
      this.landLine,
      this.companyAddress});

  CompanyId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    image = json['image'];
    status = json['status'];
    publicId = json['public_id'];
    companyNameEn = json['company_name_en'];
    companyContactPerson = json['company_contact_person'];
    companyContactMobile = json['company_contact_mobile'];
    companyAddress = json['company_address'];
    landLine = json['land_line'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['image'] = this.image;
    data['public_id'] = this.publicId;
    data['status'] = this.status;
    data['company_contact_person'] = this.companyContactPerson;
    data['company_contact_mobile'] = this.companyContactMobile;
    data['company_address'] = this.companyAddress;
    data['land_line'] = this.landLine;
    return data;
  }
}

class PageInfo {
  int? page;
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
