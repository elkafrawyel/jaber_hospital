class Medications {
  String? sId;
  String? medicationName;
  String? description;
  bool? status;
  String? companyId;
  dynamic quantity;

  Medications(
      {this.sId,
        this.medicationName,
        this.description,
        this.status,
        this.companyId,
        this.quantity});

  Medications.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    medicationName = json['medication_name'];
    description = json['description'];
    status = json['status'];
    companyId = json['company_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['medication_name'] = this.medicationName;
    data['description'] = this.description;
    data['status'] = this.status;
    data['company_id'] = this.companyId;
    data['quantity'] = this.quantity;
    return data;
  }
}