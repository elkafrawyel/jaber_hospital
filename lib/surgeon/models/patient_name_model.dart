class PatientNameModel {
  String? sId;
  String? fullNameAr;
  String? fullNameEn;

  PatientNameModel({
    this.sId,
    this.fullNameAr,
    this.fullNameEn,
  });

  PatientNameModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullNameAr = json['full_name_ar'];
    fullNameEn = json['full_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['full_name_ar'] = this.fullNameAr;
    data['full_name_en'] = this.fullNameEn;
    return data;
  }
}
