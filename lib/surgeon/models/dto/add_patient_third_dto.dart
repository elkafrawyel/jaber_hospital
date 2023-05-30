class AddPatientThirdDto {
  bool? reflux;
  bool? refluxMedRegular;
  bool? refluxMedOcc;
  bool? refluxMedNone;
  bool? nonSmoker;
  bool? exSmoker;
  bool? occationalSmoker;
  bool? vape;
  bool? lessThan20Cigg;
  bool? moreThan20Cigg;
  bool? shisha;

  AddPatientThirdDto(
      {this.reflux,
        this.refluxMedRegular,
        this.refluxMedOcc,
        this.refluxMedNone,
        this.nonSmoker,
        this.exSmoker,
        this.occationalSmoker,
        this.vape,
        this.lessThan20Cigg,
        this.moreThan20Cigg,
        this.shisha});

  AddPatientThirdDto.fromJson(Map<String, dynamic> json) {
    reflux = json['reflux'];
    refluxMedRegular = json['reflux_med_regular'];
    refluxMedOcc = json['reflux_med_occ'];
    refluxMedNone = json['reflux_med_none'];
    nonSmoker = json['non_smoker'];
    exSmoker = json['ex_smoker'];
    occationalSmoker = json['occational_smoker'];
    vape = json['vape'];
    lessThan20Cigg = json['less_than_20_cigg'];
    moreThan20Cigg = json['more_than_20_cigg'];
    shisha = json['shisha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reflux'] = this.reflux;
    data['reflux_med_regular'] = this.refluxMedRegular;
    data['reflux_med_occ'] = this.refluxMedOcc;
    data['reflux_med_none'] = this.refluxMedNone;
    data['non_smoker'] = this.nonSmoker;
    data['ex_smoker'] = this.exSmoker;
    data['occational_smoker'] = this.occationalSmoker;
    data['vape'] = this.vape;
    data['less_than_20_cigg'] = this.lessThan20Cigg;
    data['more_than_20_cigg'] = this.moreThan20Cigg;
    data['shisha'] = this.shisha;
    return data;
  }
}
