class InstrumentModel {
  String? sId;
  String? description;
  String? code;
  String? image;
  String? publicId;
  bool? status;

  InstrumentModel(
      {this.sId,
        this.description,
        this.code,
        this.image,
        this.publicId,
        this.status});

  InstrumentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    code = json['code'];
    image = json['image'];
    publicId = json['public_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['code'] = this.code;
    data['image'] = this.image;
    data['public_id'] = this.publicId;
    data['status'] = this.status;
    return data;
  }
}