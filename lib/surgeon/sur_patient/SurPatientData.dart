part of 'SurPatientImports.dart';


class SurPatientData {
  static SurPatientData _instance = SurPatientData._();

  SurPatientData._();

  factory SurPatientData() => _instance;


  late GenericBloc<int> selectedTabCubit;
  late GenericBloc<int> patientType;


  void init (int index){
    selectedTabCubit = GenericBloc(0);
    patientType = GenericBloc(0);

    selectedTabCubit.onUpdateData(index);
  }

}