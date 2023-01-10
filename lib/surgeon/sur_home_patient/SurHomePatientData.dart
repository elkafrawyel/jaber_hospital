part of'SurHomePatientImports.dart';


class SurHomePatientData {


  SurHomePatientData._();
  static final SurHomePatientData _instance = SurHomePatientData._();
  factory SurHomePatientData() => _instance;

  late TextEditingController search;



  void init(BuildContext context) {
    this.search = TextEditingController();
  }


}