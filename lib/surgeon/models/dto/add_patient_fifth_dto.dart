class AddPatientFifthDto {
  bool? previousBariatric;
  int? bariatricOutcomeResult;
  String? bariatricOutcomeDate;
  bool? surgeryTypeLsg;
  bool? surgeryTypeLagb;
  bool? surgeryTypePilication;
  bool? surgeryTypeRygbp;
  bool? surgeryTypeMgbp;
  bool? surgeryTypeSadiS;
  bool? surgeryTypeSasi;

  AddPatientFifthDto({
    this.previousBariatric,
    this.bariatricOutcomeResult,
    this.bariatricOutcomeDate,
    this.surgeryTypeLsg,
    this.surgeryTypeLagb,
    this.surgeryTypePilication,
    this.surgeryTypeRygbp,
    this.surgeryTypeMgbp,
    this.surgeryTypeSadiS,
    this.surgeryTypeSasi,
  });

  AddPatientFifthDto.fromJson(Map<String, dynamic> json) {
    previousBariatric = json['previous_bariatric'];
    bariatricOutcomeResult = json['bariatric_outcome_result'];
    bariatricOutcomeDate = json['bariatric_outcome_date'];
    surgeryTypeLsg = json['surgery_type_lsg'];
    surgeryTypeLagb = json['surgery_type_lagb'];
    surgeryTypePilication = json['surgery_type_pilication'];
    surgeryTypeRygbp = json['surgery_type_rygbp'];
    surgeryTypeMgbp = json['surgery_type_mgbp'];
    surgeryTypeSadiS = json['surgery_type_sadi_s'];
    surgeryTypeSasi = json['surgery_type_sasi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['previous_bariatric'] = this.previousBariatric;
    data['bariatric_outcome_result'] = this.bariatricOutcomeResult;
    data['bariatric_outcome_date'] = this.bariatricOutcomeDate;
    data['surgery_type_lsg'] = this.surgeryTypeLsg;
    data['surgery_type_lagb'] = this.surgeryTypeLagb;
    data['surgery_type_pilication'] = this.surgeryTypePilication;
    data['surgery_type_rygbp'] = this.surgeryTypeRygbp;
    data['surgery_type_mgbp'] = this.surgeryTypeMgbp;
    data['surgery_type_sadi_s'] = this.surgeryTypeSadiS;
    data['surgery_type_sasi'] = this.surgeryTypeSasi;
    return data;
  }
}
