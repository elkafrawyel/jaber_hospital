class PatientNameModel {
  String? sId;
  String? fistNameAr;
  String? lastNameAr;
  String? firstNameEn;
  String? lastNameEn;

  PatientNameModel({
    this.sId,
    this.fistNameAr,
    this.lastNameAr,
    this.firstNameEn,
    this.lastNameEn,
  });

  PatientNameModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fistNameAr = json['first_name_ar'];
    lastNameAr = json['last_name_ar'];
    firstNameEn = json['first_name_en'];
    lastNameEn = json['last_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['first_name_en'] = this.fistNameAr;
    data['first_name_ar'] = this.lastNameAr;
    data['last_name_ar'] = this.firstNameEn;
    data['last_name_en'] = this.lastNameEn;
    return data;
  }
}
