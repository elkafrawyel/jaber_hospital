class AddPatientSeventhDto {
  AddPatientSeventhDto({
    this.egd,
    this.egdOesophagusGradeType,
    this.egdHiatusHerniaSize,
    this.egdHiatusHerniaSizeCm,
    this.egdOesophagusNormal,
    this.egdOesophagusOesophagitis,
    this.egdOesophagusGrade,
    this.egdOesophagusBarrets,
    this.egdOesophagusOther,
    this.egdStomachHaitus,
    this.egdStomachGas,
    this.egdStomachAntral,
    this.egdStomachFundal,
    this.egdStomachBody,
    this.egdStomachPang,
    this.egdStomachGrastricUlcer,
    this.egdStomachHPylori,
    this.egdStomachPolyps,
    this.egdStomachOthers,
    this.egdPreviousSurgery,
    this.egdPreviousSurgeryTypeLsg,
    this.egdPreviousSurgeryTypeLagb,
    this.egdPreviousSurgeryTypeRygbp,
    this.egdPreviousSurgeryTypeMgbp,
    this.egdNormal,
    this.egdStructure,
    this.egdTwist,
    this.egdDilatedFundus,
    this.egdPanDilatation,
    this.egdUlcer,
    this.egdBile,
    this.egdPouchDialation,
    this.egdAnastomoticSize,
    this.egdAnastomoticSizeNumber,
    this.egdDuodenumNormal,
    this.egdDuodenumUlcer,
    this.egdDuodenumOthers,
  });

  AddPatientSeventhDto.fromJson(dynamic json) {
    egd = json['egd'];
    egdOesophagusGradeType = json['egd_oesophagus_grade_type'];
    egdHiatusHerniaSize = json['egd_hiatus_hernia_size'];
    egdHiatusHerniaSizeCm = json['egd_hiatus_hernia_size_cm'];
    egdOesophagusNormal = json['egd_oesophagus_normal'];
    egdOesophagusOesophagitis = json['egd_oesophagus_oesophagitis'];
    egdOesophagusGrade = json['egd_oesophagus_grade'];
    egdOesophagusBarrets = json['egd_oesophagus_barrets'];
    egdOesophagusOther = json['egd_oesophagus_other'];
    egdStomachHaitus = json['egd_stomach_haitus'];
    egdStomachGas = json['egd_stomach_gas'];
    egdStomachAntral = json['egd_stomach_antral'];
    egdStomachFundal = json['egd_stomach_fundal'];
    egdStomachBody = json['egd_stomach_body'];
    egdStomachPang = json['egd_stomach_pang'];
    egdStomachGrastricUlcer = json['egd_stomach_grastric_ulcer'];
    egdStomachHPylori = json['egd_stomach_h_pylori'];
    egdStomachPolyps = json['egd_stomach_polyps'];
    egdStomachOthers = json['egd_stomach_others'];
    egdPreviousSurgery = json['egd_previous_surgery'];
    egdPreviousSurgeryTypeLsg = json['egd_previous_surgery_type_lsg'];
    egdPreviousSurgeryTypeLagb = json['egd_previous_surgery_type_lagb'];
    egdPreviousSurgeryTypeRygbp = json['egd_previous_surgery_type_rygbp'];
    egdPreviousSurgeryTypeMgbp = json['egd_previous_surgery_type_mgbp'];
    egdNormal = json['egd_normal'];
    egdStructure = json['egd_structure'];
    egdTwist = json['egd_twist'];
    egdDilatedFundus = json['egd_dilated_fundus'];
    egdPanDilatation = json['egd_pan_dilatation'];
    egdUlcer = json['egd_ulcer'];
    egdBile = json['egd_bile'];
    egdPouchDialation = json['egd_pouch_dialation'];
    egdAnastomoticSize = json['egd_anastomotic_size'];
    egdAnastomoticSizeNumber = json['egd_anastomotic_size_number'];
    egdDuodenumNormal = json['egd_duodenum_normal'];
    egdDuodenumUlcer = json['egd_duodenum_ulcer'];
    egdDuodenumOthers = json['egd_duodenum_others'];
  }

  bool? egd;
  String? egdOesophagusGradeType;
  String? egdHiatusHerniaSize;
  String? egdHiatusHerniaSizeCm;
  bool? egdOesophagusNormal;
  bool? egdOesophagusOesophagitis;
  bool? egdOesophagusGrade;
  bool? egdOesophagusBarrets;
  String? egdOesophagusOther;
  bool? egdStomachHaitus;
  bool? egdStomachGas;
  bool? egdStomachAntral;
  bool? egdStomachFundal;
  bool? egdStomachBody;
  bool? egdStomachPang;
  bool? egdStomachGrastricUlcer;
  bool? egdStomachHPylori;
  bool? egdStomachPolyps;
  String? egdStomachOthers;
  bool? egdPreviousSurgery;
  bool? egdPreviousSurgeryTypeLsg;
  bool? egdPreviousSurgeryTypeLagb;
  bool? egdPreviousSurgeryTypeRygbp;
  bool? egdPreviousSurgeryTypeMgbp;
  bool? egdNormal;
  bool? egdStructure;
  bool? egdTwist;
  bool? egdDilatedFundus;
  bool? egdPanDilatation;
  bool? egdUlcer;
  bool? egdBile;
  bool? egdPouchDialation;
  bool? egdAnastomoticSize;
  String? egdAnastomoticSizeNumber;
  bool? egdDuodenumNormal;
  bool? egdDuodenumUlcer;
  String? egdDuodenumOthers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['egd'] = egd;
    map['egd_oesophagus_grade_type'] = egdOesophagusGradeType;
    map['egd_hiatus_hernia_size'] = egdHiatusHerniaSize;
    map['egd_hiatus_hernia_size_cm'] = egdHiatusHerniaSizeCm;
    map['egd_oesophagus_normal'] = egdOesophagusNormal;
    map['egd_oesophagus_oesophagitis'] = egdOesophagusOesophagitis;
    map['egd_oesophagus_grade'] = egdOesophagusGrade;
    map['egd_oesophagus_barrets'] = egdOesophagusBarrets;
    map['egd_oesophagus_other'] = egdOesophagusOther;
    map['egd_stomach_haitus'] = egdStomachHaitus;
    map['egd_stomach_gas'] = egdStomachGas;
    map['egd_stomach_antral'] = egdStomachAntral;
    map['egd_stomach_fundal'] = egdStomachFundal;
    map['egd_stomach_body'] = egdStomachBody;
    map['egd_stomach_pang'] = egdStomachPang;
    map['egd_stomach_grastric_ulcer'] = egdStomachGrastricUlcer;
    map['egd_stomach_h_pylori'] = egdStomachHPylori;
    map['egd_stomach_polyps'] = egdStomachPolyps;
    map['egd_stomach_others'] = egdStomachOthers;
    map['egd_previous_surgery'] = egdPreviousSurgery;
    map['egd_previous_surgery_type_lsg'] = egdPreviousSurgeryTypeLsg;
    map['egd_previous_surgery_type_lagb'] = egdPreviousSurgeryTypeLagb;
    map['egd_previous_surgery_type_rygbp'] = egdPreviousSurgeryTypeRygbp;
    map['egd_previous_surgery_type_mgbp'] = egdPreviousSurgeryTypeMgbp;
    map['egd_normal'] = egdNormal;
    map['egd_structure'] = egdStructure;
    map['egd_twist'] = egdTwist;
    map['egd_dilated_fundus'] = egdDilatedFundus;
    map['egd_pan_dilatation'] = egdPanDilatation;
    map['egd_ulcer'] = egdUlcer;
    map['egd_bile'] = egdBile;
    map['egd_pouch_dialation'] = egdPouchDialation;
    map['egd_anastomotic_size'] = egdAnastomoticSize;
    map['egd_anastomotic_size_number'] = egdAnastomoticSizeNumber;
    map['egd_duodenum_normal'] = egdDuodenumNormal;
    map['egd_duodenum_ulcer'] = egdDuodenumUlcer;
    map['egd_duodenum_others'] = egdDuodenumOthers;
    return map;
  }
}
