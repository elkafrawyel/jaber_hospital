class AddPatientFourthDto {
  bool? historyOfBallon;
  int? ballonWeightLossFrom;
  int? ballonWeightLossTo;
  String? ballonDateOfInsertion;
  String? ballonDateOfRemoval;
  bool? historyOfWeightLoss;
  int? weightLossOutcomeResult;
  String? weightLossOutcomeDate;
  bool? medicationTypeVictoza;
  bool? medicationTypeSaxenda;
  bool? medicationTypeOzempic;
  bool? medicationTypeWegovo;
  bool? medicationTypeTrulicity;

  AddPatientFourthDto(
      {this.historyOfBallon,
        this.ballonWeightLossFrom,
        this.ballonWeightLossTo,
        this.ballonDateOfInsertion,
        this.ballonDateOfRemoval,
        this.historyOfWeightLoss,
        this.weightLossOutcomeResult,
        this.weightLossOutcomeDate,
        this.medicationTypeVictoza,
        this.medicationTypeSaxenda,
        this.medicationTypeOzempic,
        this.medicationTypeWegovo,
        this.medicationTypeTrulicity});

  AddPatientFourthDto.fromJson(Map<String, dynamic> json) {
    historyOfBallon = json['history_of_ballon'];
    ballonWeightLossFrom = json['ballon_weight_loss_from'];
    ballonWeightLossTo = json['ballon_weight_loss_to'];
    ballonDateOfInsertion = json['ballon_date_of_insertion'];
    ballonDateOfRemoval = json['ballon_date_of_removal'];
    historyOfWeightLoss = json['history_of_weight_loss'];
    weightLossOutcomeResult = json['weight_loss_outcome_result'];
    weightLossOutcomeDate = json['weight_loss_outcome_date'];
    medicationTypeVictoza = json['medication_type_victoza'];
    medicationTypeSaxenda = json['medication_type_saxenda'];
    medicationTypeOzempic = json['medication_type_ozempic'];
    medicationTypeWegovo = json['medication_type_wegovo'];
    medicationTypeTrulicity = json['medication_type_trulicity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['history_of_ballon'] = this.historyOfBallon;
    data['ballon_weight_loss_from'] = this.ballonWeightLossFrom;
    data['ballon_weight_loss_to'] = this.ballonWeightLossTo;
    data['ballon_date_of_insertion'] = this.ballonDateOfInsertion;
    data['ballon_date_of_removal'] = this.ballonDateOfRemoval;
    data['history_of_weight_loss'] = this.historyOfWeightLoss;
    data['weight_loss_outcome_result'] = this.weightLossOutcomeResult;
    data['weight_loss_outcome_date'] = this.weightLossOutcomeDate;
    data['medication_type_victoza'] = this.medicationTypeVictoza;
    data['medication_type_saxenda'] = this.medicationTypeSaxenda;
    data['medication_type_ozempic'] = this.medicationTypeOzempic;
    data['medication_type_wegovo'] = this.medicationTypeWegovo;
    data['medication_type_trulicity'] = this.medicationTypeTrulicity;
    return data;
  }
}
