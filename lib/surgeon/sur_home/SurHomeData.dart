part of 'SurHomeImports.dart';


class SurHomeData {
  SurHomeData._();
  static final SurHomeData _instance = SurHomeData._();
  factory SurHomeData() => _instance;

  late TextEditingController search;



  void init(BuildContext context) {
    this.search = TextEditingController();
  }





}