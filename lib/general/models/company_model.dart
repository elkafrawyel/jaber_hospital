class CompanyId {
  String? sId;
  String? companyNameAr;
  String? companyNameEn;
  String? companyContactPerson;
  String? companyAddress;
  String? companyContactMobile;

  CompanyId(
      {this.sId,
        this.companyNameAr,
        this.companyNameEn,
        this.companyContactPerson,
        this.companyAddress,
        this.companyContactMobile});

  CompanyId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    companyNameAr = json['company_name_ar'];
    companyNameEn = json['company_name_en'];
    companyContactPerson = json['company_contact_person'];
    companyAddress = json['company_address'];
    companyContactMobile = json['company_contact_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['company_name_ar'] = this.companyNameAr;
    data['company_name_en'] = this.companyNameEn;
    data['company_contact_person'] = this.companyContactPerson;
    data['company_address'] = this.companyAddress;
    data['company_contact_mobile'] = this.companyContactMobile;
    return data;
  }
}