import 'company_model.dart';

class InstrumentModel {
  String? sId;
  String? description;
  String? code;
  String? companyId;
  String? image;
  String? publicId;
  String? adminCreatedId;
  bool? status;
  int? quantity;
  bool? checked;

  InstrumentModel({
    this.sId,
    this.description,
    this.code,
    this.image,
    this.companyId,
    this.publicId,
    this.adminCreatedId,
    this.quantity,
    this.checked = false,
    this.status,
  });

  InstrumentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    code = json['code'];
    image = json['image'];
    companyId = json['company_id'];
    publicId = json['public_id'];
    adminCreatedId = json['admin_created_id'];
    status = json['status'];
    quantity = json['quantity'];
    checked = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['code'] = this.code;
    data['image'] = this.image;
    data['company_id'] = this.companyId;
    data['public_id'] = this.publicId;
    data['admin_created_id'] = this.adminCreatedId;
    data['status'] = this.status;
    return data;
  }
}
