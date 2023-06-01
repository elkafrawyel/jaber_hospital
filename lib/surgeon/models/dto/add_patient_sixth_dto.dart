class AddPatientSixthDto {
  bool? ultrasound;
  bool? ultrasound_finding_fatty_liver;
  bool? ultrasound_finding_gbs;
  bool? ultrasound_finding_hernia;
  bool? ultrasound_finding_cirrhos;
  bool? ultrasound_finding_others;
  String? ultrasound_finding_others_note;
  String? other_notes;
  List<PatientLabs>? labs;

  AddPatientSixthDto({
    this.ultrasound,
    this.ultrasound_finding_fatty_liver,
    this.ultrasound_finding_gbs,
    this.ultrasound_finding_hernia,
    this.ultrasound_finding_cirrhos,
    this.ultrasound_finding_others,
    this.ultrasound_finding_others_note,
    this.other_notes,
    this.labs,
  });

  AddPatientSixthDto.fromJson(Map<String, dynamic> json) {
    ultrasound = json['ultrasound'];
    ultrasound_finding_fatty_liver = json['ultrasound_finding_fatty_liver'];
    ultrasound_finding_gbs = json['ultrasound_finding_gbs'];
    ultrasound_finding_hernia = json['ultrasound_finding_hernia'];
    ultrasound_finding_cirrhos = json['ultrasound_finding_cirrhos'];
    ultrasound_finding_others = json['ultrasound_finding_others'];
    ultrasound_finding_others_note = json['ultrasound_finding_others_note'];
    other_notes = json['other_notes'];
    if (json['patient_labs'] != null) {
      labs = [];
      json['patient_labs'].forEach((v) {
        labs?.add(PatientLabs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ultrasound'] = this.ultrasound;
    data['ultrasound_finding_fatty_liver'] = this.ultrasound_finding_fatty_liver;
    data['ultrasound_finding_gbs'] = this.ultrasound_finding_gbs;
    data['ultrasound_finding_hernia'] = this.ultrasound_finding_hernia;
    data['ultrasound_finding_cirrhos'] = this.ultrasound_finding_cirrhos;
    data['ultrasound_finding_others'] = this.ultrasound_finding_others;
    data['ultrasound_finding_others_note'] = this.ultrasound_finding_others_note;
    data['other_notes'] = this.other_notes;

    data['patient_labs'] = this.labs;
    if (this.labs != null) {
      data['patient_labs'] = labs?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PatientLabs {
  String? labId;
  bool? status;
  String? result;
  String? level;

  PatientLabs({this.labId, this.status, this.result,this.level});

  PatientLabs.fromJson(Map<String, dynamic> json) {
    labId = json['lab_id'];
    status = json['status'];
    result = json['result'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lab_id'] = this.labId;
    data['status'] = this.status;
    data['result'] = this.result;
    data['level'] = this.level;

    return data;
  }
}
