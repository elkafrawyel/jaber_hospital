import 'package:base_flutter/general/models/company_model.dart';

class InstrumentModel {
  String? sId;
  String? description;
  String? code;
  CompanyId? companyId;
  String? image;
  bool? status;
  String? adminCreatedId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? publicId;

  InstrumentModel(
      {this.sId,
        this.description,
        this.code,
        this.companyId,
        this.image,
        this.status,
        this.adminCreatedId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.publicId});

  InstrumentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    code = json['code'];
    companyId = json['company_id'] != null
        ? new CompanyId.fromJson(json['company_id'])
        : null;
    image = json['image'];
    status = json['status'];
    adminCreatedId = json['admin_created_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    publicId = json['public_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['code'] = this.code;
    if (this.companyId != null) {
      data['company_id'] = this.companyId!.toJson();
    }
    data['image'] = this.image;
    data['status'] = this.status;
    data['admin_created_id'] = this.adminCreatedId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['public_id'] = this.publicId;
    return data;
  }
}