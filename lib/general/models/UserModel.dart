class UserModel {
  List<UserData>? userData;
  String? accessToken;
  String? refreshToken;

  UserModel({this.userData, this.accessToken, this.refreshToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      userData = <UserData>[];
      json['user'].forEach((v) {
        userData!.add(new UserData.fromJson(v));
      });
    }
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['user'] = this.userData!.map((v) => v.toJson()).toList();
    }
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}

class UserData {
  String? sId;
  String? email;
  bool? verified;
  String? fullNameAr;
  String? fullNameEn;
  String? gender;
  String? role;
  bool? status;
  DoctorRoleId? doctorRoleId;

  UserData(
      {this.sId,
        this.email,
        this.verified,
        this.fullNameAr,
        this.fullNameEn,
        this.gender,
        this.role,
        this.status,
        this.doctorRoleId});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    verified = json['verified'];
    fullNameAr = json['full_name_ar'];
    fullNameEn = json['full_name_en'];
    gender = json['gender'];
    role = json['role'];
    status = json['status'];
    doctorRoleId = json['doctor_role_id'] != null
        ? new DoctorRoleId.fromJson(json['doctor_role_id'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['verified'] = this.verified;
    data['full_name_ar'] = this.fullNameAr;
    data['full_name_en'] = this.fullNameEn;
    data['gender'] = this.gender;
    data['role'] = this.role;
    data['status'] = this.status;
    if (this.doctorRoleId != null) {
      data['doctor_role_id'] = this.doctorRoleId!.toJson();
    }
    return data;
  }
}

class DoctorRoleId {
  String? sId;
  String? roleNameAr;
  String? roleNameEn;
  bool? status;
  String? clinicNameAr;
  String? clinicNameEn;

  DoctorRoleId(
      {this.sId,
        this.roleNameAr,
        this.roleNameEn,
        this.status,
        this.clinicNameAr,
        this.clinicNameEn});

  DoctorRoleId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    roleNameAr = json['role_name_ar'];
    roleNameEn = json['role_name_en'];
    status = json['status'];
    clinicNameAr = json['clinic_name_ar'];
    clinicNameEn = json['clinic_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['role_name_ar'] = this.roleNameAr;
    data['role_name_en'] = this.roleNameEn;
    data['status'] = this.status;
    data['clinic_name_ar'] = this.clinicNameAr;
    data['clinic_name_en'] = this.clinicNameEn;
    return data;
  }
}

