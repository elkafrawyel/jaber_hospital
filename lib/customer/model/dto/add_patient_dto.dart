class AddPatientFirstDto {
  String? email;
  String? password;
  String? fNameAr;
  String? lNameAr;
  String? fNameEn;
  String? lNameEn;
  String? gender;
  String? civilId;
  String? image;
  String? publicId;
  String? telephone1;
  String? telephone2;
  int? age;
  num? weight;
  num? height;
  num? bmi;
  String? fileId;

  AddPatientFirstDto({
    this.email,
    this.password,
    this.fNameAr,
    this.lNameAr,
    this.fNameEn,
    this.lNameEn,
    this.gender,
    this.civilId,
    this.image,
    this.publicId,
    this.telephone1,
    this.telephone2,
    this.age,
    this.weight,
    this.height,
    this.bmi,
    this.fileId,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "first_name_ar": fNameAr,
        "last_name_ar": lNameAr,
        "first_name_en": fNameEn,
        "last_name_en": lNameEn,
        "gender": gender,
        "civil_id": civilId,
        "image": image,
        "public_id": publicId,
        "telephone_1": telephone1,
        "telephone_2": telephone2,
        "age": age,
        "weight": weight,
        "height": height,
        "bmi": bmi,
        "file_id": fileId,
      };
}
