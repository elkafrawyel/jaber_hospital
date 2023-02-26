part of'sur_order_medications_imports.dart';



class SurOrderMedicationsData {
  //singleton
  static SurOrderMedicationsData _instance =  new  SurOrderMedicationsData._();
  factory SurOrderMedicationsData() => _instance;
  SurOrderMedicationsData._();





  late GlobalKey<FormState> formKey ;
  late TextEditingController patientName ;
  late TextEditingController PatientMobileNumber ;
  late TextEditingController Date ;
  late TextEditingController Medication ;


  void init(BuildContext context) {
    formKey = GlobalKey<FormState>();
    patientName = TextEditingController();
    PatientMobileNumber = TextEditingController();
    Date = TextEditingController();
    Medication = TextEditingController();
  }

}
