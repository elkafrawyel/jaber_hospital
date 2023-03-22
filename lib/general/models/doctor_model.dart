class DoctorId {
  String? sId;
  String? fullNameAr;
  String? fullNameEn;
  String? gender;
  String? civilId;
  String? title;
  String? image;

  DoctorId(
      {this.sId,
        this.fullNameAr,
        this.fullNameEn,
        this.gender,
        this.civilId,
        this.image,
        this.title});

  DoctorId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullNameAr = json['full_name_ar'];
    fullNameEn = json['full_name_en'];
    gender = json['gender'];
    civilId = json['civil_id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['full_name_ar'] = this.fullNameAr;
    data['full_name_en'] = this.fullNameEn;
    data['gender'] = this.gender;
    data['civil_id'] = this.civilId;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}