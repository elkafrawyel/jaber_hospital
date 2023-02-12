import 'dart:io';


class ProfileModel {
  File? file;
  String? nameAr;
  String? nameEn;
  String? email;
  String? civilId;
  String? gender;
  String? title;
  String? age;

  ProfileModel({
    this.file,
    this.nameAr,
    this.nameEn,
    this.email,
    this.civilId,
    this.gender,
    this.title,
    this.age,
  });

  Map<String, dynamic> toJson() => {
        "file": file,
        "full_name_ar": nameAr,
        "full_name_en": nameEn,
        "email": email,
        "civil_id": civilId,
        "gender": gender,
        "title": title,
        "age": age,
      };
}
