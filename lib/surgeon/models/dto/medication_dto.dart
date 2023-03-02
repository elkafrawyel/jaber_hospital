class MedicationDto {
  String? doctorId;
  String? companyId;
  String? patientId;
  String? mobileNumber;
  List<Medications>? medications;
  String? orderStartDate;
  bool? status;
  String? orderCompletedDate;
  String? orderStatus;
  String? notes;

  MedicationDto(
      {this.doctorId,
        this.companyId,
        this.patientId,
        this.mobileNumber,
        this.medications,
        this.orderStartDate,
        this.status,
        this.orderCompletedDate,
        this.orderStatus,
        this.notes});

  MedicationDto.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    companyId = json['company_id'];
    patientId = json['patient_id'];
    mobileNumber = json['mobile_number'];
    if (json['medications'] != null) {
      medications = <Medications>[];
      json['medications'].forEach((v) {
        medications!.add(new Medications.fromJson(v));
      });
    }
    orderStartDate = json['order_start_date'];
    status = json['status'];
    orderCompletedDate = json['order_completed_date'];
    orderStatus = json['order_status'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = this.doctorId;
    data['company_id'] = this.companyId;
    data['patient_id'] = this.patientId;
    data['mobile_number'] = this.mobileNumber;
    if (this.medications != null) {
      data['medications'] = this.medications!.map((v) => v.toJson()).toList();
    }
    data['order_start_date'] = this.orderStartDate;
    data['status'] = this.status;
    data['order_completed_date'] = this.orderCompletedDate;
    data['order_status'] = this.orderStatus;
    data['notes'] = this.notes;
    return data;
  }
}

class Medications {
  String? id;
  int? quantity;

  Medications({this.id, this.quantity});

  Medications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data['quantity'] = this.quantity;
    return data;
  }
}
