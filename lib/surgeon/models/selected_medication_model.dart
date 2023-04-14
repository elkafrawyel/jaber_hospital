class SelectedMedicationModel {
  String? id;
  int? quantity;

  SelectedMedicationModel({
    this.id,
    this.quantity,
  });

  SelectedMedicationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    return data;
  }
}