class AddPatientSecondDto {
  bool? dmType;
  bool? dmTypel;
  bool? dmTypell;
  bool? htn;
  bool? dyslipidemia;
  bool? alcohol;
  bool? osa;
  bool? fattyLiver;
  bool? pcos;
  bool? cardiacDiseaseIhd;
  bool? cardiacDiseaseHf;
  bool? respiratoryDisVte;
  bool? respiratoryDisAnticoag;
  bool? respiratoryDisAntiplate;
  bool? respiratory_dis;
  String? coMorbiditiesOtherNotes;

  AddPatientSecondDto(
      {this.dmType,
        this.dmTypel,
        this.dmTypell,
        this.htn,
        this.dyslipidemia,
        this.alcohol,
        this.osa,
        this.fattyLiver,
        this.pcos,
        this.cardiacDiseaseIhd,
        this.cardiacDiseaseHf,
        this.respiratoryDisVte,
        this.respiratoryDisAnticoag,
        this.respiratory_dis,
        this.respiratoryDisAntiplate,
        this.coMorbiditiesOtherNotes});

  AddPatientSecondDto.fromJson(Map<String, dynamic> json) {
    dmType = json['dm_type'];
    dmTypel = json['dm_typel'];
    dmTypell = json['dm_typell'];
    htn = json['htn'];
    dyslipidemia = json['dyslipidemia'];
    alcohol = json['alcohol'];
    osa = json['osa'];
    fattyLiver = json['fatty_liver'];
    pcos = json['pcos'];
    cardiacDiseaseIhd = json['cardiac_disease_ihd'];
    cardiacDiseaseHf = json['cardiac_disease_hf'];
    respiratoryDisVte = json['respiratory_dis_vte'];
    respiratory_dis = json['respiratory_dis'];
    respiratoryDisAnticoag = json['respiratory_dis_anticoag'];
    respiratoryDisAntiplate = json['respiratory_dis_antiplate'];
    coMorbiditiesOtherNotes = json['co_morbidities_other_notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dm_type'] = this.dmType;
    data['dm_typel'] = this.dmTypel;
    data['dm_typell'] = this.dmTypell;
    data['htn'] = this.htn;
    data['dyslipidemia'] = this.dyslipidemia;
    data['alcohol'] = this.alcohol;
    data['osa'] = this.osa;
    data['fatty_liver'] = this.fattyLiver;
    data['pcos'] = this.pcos;
    data['cardiac_disease_ihd'] = this.cardiacDiseaseIhd;
    data['cardiac_disease_hf'] = this.cardiacDiseaseHf;
    data['vte'] = this.respiratoryDisVte;
    data['anticoag'] = this.respiratoryDisAnticoag;
    data['antiplate'] = this.respiratoryDisAntiplate;
    data['co_morbidities_other_notes'] = this.coMorbiditiesOtherNotes;
    data['respiratory_dis'] = this.respiratory_dis;

    return data;
  }
}
