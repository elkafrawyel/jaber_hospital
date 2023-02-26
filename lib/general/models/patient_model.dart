class PatientId {
  String? sId;
  String? fullNameAr;
  String? fullNameEn;
  String? gender;
  String? civilId;
  int? age;
  int? weight;
  int? height;

  PatientId(
      {this.sId,
        this.fullNameAr,
        this.fullNameEn,
        this.gender,
        this.civilId,
        this.age,
        this.weight,
        this.height});

  PatientId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullNameAr = json['full_name_ar'];
    fullNameEn = json['full_name_en'];
    gender = json['gender'];
    civilId = json['civil_id'];
    age = json['age'];
    weight = json['weight'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['full_name_ar'] = this.fullNameAr;
    data['full_name_en'] = this.fullNameEn;
    data['gender'] = this.gender;
    data['civil_id'] = this.civilId;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['height'] = this.height;
    return data;
  }
}
