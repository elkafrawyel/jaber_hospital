part of'SurMdtDiscussionsImports.dart';

class SurMdtDiscussionsData {
  SurMdtDiscussionsData._();
  static final SurMdtDiscussionsData _instance = SurMdtDiscussionsData._();
  factory SurMdtDiscussionsData() => _instance;


  late GenericBloc<int> decisionType;


  void init (){

    decisionType = GenericBloc(0);

  }


}