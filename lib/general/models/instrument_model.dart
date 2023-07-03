import 'company_model.dart';

class InstrumentModel {
  String? sId;
  String? description;
  String? code;
  CompanyId? companyId;
  String? image;
  String? publicId;
  String? adminCreatedId;
  bool? status;
  int? quantity;
  bool? checked;

  InstrumentModel(
      {this.sId,
        this.description,
        this.code,
        this.image,
        this.companyId,
        this.publicId,
        this.adminCreatedId,
        this.quantity = 1,
        this.checked = false,
        this.status});

  InstrumentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    code = json['code'];
    image = json['image'];
    companyId = json['company_id'] != null
        ? CompanyId.fromJson(json['company_id'])
        : null;
    publicId = json['public_id'];
    adminCreatedId = json['admin_created_id'];
    status = json['status'];
    checked = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['code'] = this.code;
    data['image'] = this.image;
    if (this.companyId != null) {
      data['company_id'] = this.companyId!.toJson();
    }
    data['public_id'] = this.publicId;
    data['admin_created_id'] = this.adminCreatedId;
    data['status'] = this.status;
    return data;
  }
}