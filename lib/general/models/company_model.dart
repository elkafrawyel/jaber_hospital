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