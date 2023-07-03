import '../../general/models/company_model.dart';
import '../../general/models/doctor_model.dart';
import '../../general/models/instrument_model.dart';
import '../../general/models/patient_model.dart';
import '../../surgeon/models/instrument_order_model.dart';
import '../../surgeon/models/medication_model.dart';

class OrderModel {
  String? sId;
  int? orderNum;
  DoctorId? doctorId;
  CompanyId? companyId;
  PatientId? patientId;
  List<MedicationInfo>? medications;
  List<InstrumentModel>? instruments;
  List<MedicationsDetails>? medicationsDetails;
  List<MedicationsDetails>? instrumentsDetails;
  String? orderStartDate;
  String? orderCompletedDate;
  String? orderStatus;
  String? notes;
  bool? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? adminUpdatedId;
  String? mobileNumber;

  OrderModel({
    this.sId,
    this.orderNum,
    this.doctorId,
    this.companyId,
    this.patientId,
    this.instruments,
    this.orderStartDate,
    this.orderCompletedDate,
    this.orderStatus,
    this.notes,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.adminUpdatedId,
    this.mobileNumber,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    orderNum = json['order_num'];
    doctorId = json['doctor_id'] != null ? new DoctorId.fromJson(json['doctor_id']) : null;
    companyId = json['company_id'] != null ? new CompanyId.fromJson(json['company_id']) : null;
    patientId = json['patient_id'] != null ? new PatientId.fromJson(json['patient_id']) : null;
    if (json['medications'] != null) {
      medications = <MedicationInfo>[];
      json['medications'].forEach((v) {
        medications!.add(MedicationInfo.fromJson(v));
      });
    }
    if (json['instruments'] != null) {
      instruments = <InstrumentModel>[];
      json['instruments'].forEach((v) {
        instruments!.add(InstrumentModel.fromJson(v));
      });
    }
    if (json['medications_details'] != null) {
      medicationsDetails = <MedicationsDetails>[];
      json['medications_details'].forEach((v) {
        medicationsDetails!.add(new MedicationsDetails.fromJson(v));
      });
    }
    if (json['instruments_details'] != null) {
      instrumentsDetails = <MedicationsDetails>[];
      json['instruments_details'].forEach((v) {
        instrumentsDetails!.add(MedicationsDetails.fromJson(v));
      });
    }
    orderStartDate = json['order_start_date'];
    orderCompletedDate = json['order_completed_date'];
    orderStatus = json['order_status'];
    notes = json['notes'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    adminUpdatedId = json['admin_updated_id'];
    mobileNumber = json['mobile_number'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['order_num'] = this.orderNum;
    if (this.doctorId != null) {
      data['doctor_id'] = this.doctorId!.toJson();
    }
    if (this.companyId != null) {
      data['company_id'] = this.companyId!.toJson();
    }
    if (this.patientId != null) {
      data['patient_id'] = this.patientId!.toJson();
    }
    if (this.medications != null) {
      data['medications'] = this.medications!.map((v) => v.toJson()).toList();
    }
    if (this.instruments != null) {
      data['instruments'] = this.instruments!.map((v) => v.toJson()).toList();
    }
    if (this.medicationsDetails != null) {
      data['medications_details'] = this.medicationsDetails!.map((v) => v.toJson()).toList();
    }
    if (this.instrumentsDetails != null) {
      data['instruments_details'] = this.instrumentsDetails!.map((v) => v.toJson()).toList();
    }
    data['order_start_date'] = this.orderStartDate;
    data['order_completed_date'] = this.orderCompletedDate;
    data['order_status'] = this.orderStatus;
    data['notes'] = this.notes;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['admin_updated_id'] = this.adminUpdatedId;
    return data;
  }
}
