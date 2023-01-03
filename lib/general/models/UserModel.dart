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
  bool? status;
  String? id;
  String? name;
  String? email;
  bool? verified;
  String? image;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? adminUpdatedId;
  String? civilId;
  String? fullNameAr;
  String? fullNameEn;
  String? title;
  String? doctorRoleId;

  UserData(
      {this.status,
        this.id,
        this.name,
        this.email,
        this.verified,
        this.image,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.adminUpdatedId,
        this.civilId,
        this.fullNameAr,
        this.fullNameEn,
        this.title,
        this.doctorRoleId});

  UserData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    verified = json['verified'];
    image = json['image'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    adminUpdatedId = json['admin_updated_id'];
    civilId = json['civil_id'];
    fullNameAr = json['full_name_ar'];
    fullNameEn = json['full_name_en'];
    title = json['title'];
    doctorRoleId = json['doctor_role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['_id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['verified'] = this.verified;
    data['image'] = this.image;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['admin_updated_id'] = this.adminUpdatedId;
    data['civil_id'] = this.civilId;
    data['full_name_ar'] = this.fullNameAr;
    data['full_name_en'] = this.fullNameEn;
    data['title'] = this.title;
    data['doctor_role_id'] = this.doctorRoleId;
    return data;
  }
}
