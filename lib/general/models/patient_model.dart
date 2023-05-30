class PatientId {
  String? sId;
  String? image;
  String? fileId;
  String? firstNameEn;
  String? firstNameAr;
  String? lastNameAr;
  String? lastNameEn;
  String? operationType;
  String? mobile;
  String? gender;
  int? age;
  int? weight;
  int? height;

  PatientId(
      {this.sId,
        this.image,
        this.fileId,
        this.gender,
        this.mobile,
        this.firstNameEn,
        this.firstNameAr,
        this.lastNameAr,
        this.lastNameEn,
        this.operationType,
        this.age,
        this.weight,
        this.height});

  PatientId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    fileId = json['file_id'];
    firstNameEn = json['first_name_en'];
    firstNameAr = json['first_name_ar'];
    lastNameAr = json['last_name_ar'];
    lastNameEn = json['last_name_en'];
    operationType = json['operation_type'];
    gender = json['gender'];
    mobile = json['mobile'];
    age = json['age'];
    weight = json['weight'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['file_id'] = this.fileId;
    data['first_name_en'] = this.firstNameEn;
    data['first_name_ar'] = this.firstNameAr;
    data['last_name_ar'] = this.lastNameAr;
    data['last_name_en'] = this.lastNameEn;
    data['operation_type'] = this.operationType;
    data['gender'] = this.gender;
    data['mobile'] = this.mobile;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['height'] = this.height;
    return data;
  }
}
