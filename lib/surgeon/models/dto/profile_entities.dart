import 'dart:io';

class ProfileModel {
  File? file;
  String? firstNameAr;
  String? firstNameEn;
  String? lastNameAr;
  String? lastNameEn;
  String? nameAr;
  String? nameEn;
  String? email;
  String? civilId;
  String? gender;
  String? title;
  String? age;

  ProfileModel({
    this.file,
    this.firstNameAr,
    this.firstNameEn,
    this.lastNameEn,
    this.lastNameAr,
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
        "first_name_ar": firstNameAr,
        "first_name_en": firstNameEn,
        "last_name_ar": lastNameAr,
        "last_name_en": lastNameEn,
        "full_name_ar": nameAr,
        "full_name_en": nameEn,
        "email": email,
        "civil_id": civilId,
        "gender": gender,
        "title": title,
        "age": age,
      };
}
