class DoctorId {
  String? sId;
  String? firstNameEn;
  String? firstNameAr;
  String? lastNameAr;
  String? lastNameEn;
  String? gender;
  String? civilId;
  String? title;
  String? image;

  DoctorId(
      {this.sId,
        this.firstNameEn,
        this.firstNameAr,
        this.lastNameAr,
        this.lastNameEn,
        this.gender,
        this.civilId,
        this.image,
        this.title});

  DoctorId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstNameEn = json['first_name_en'];
    firstNameAr = json['first_name_ar'];
    lastNameAr = json['last_name_ar'];
    lastNameEn = json['last_name_en'];
    gender = json['gender'];
    civilId = json['civil_id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['first_name_en'] = this.firstNameEn;
    data['first_name_ar'] = this.firstNameAr;
    data['last_name_ar'] = this.lastNameAr;
    data['last_name_en'] = this.lastNameEn;
    data['gender'] = this.gender;
    data['civil_id'] = this.civilId;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}