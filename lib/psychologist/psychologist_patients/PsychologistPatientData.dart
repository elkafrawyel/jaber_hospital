import 'package:flutter/material.dart';
import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../surgeon/models/patient_model.dart';
import '../resources/PsychologistRepoImports.dart';

class PsychologistPatientData {
  static PsychologistPatientData _instance = PsychologistPatientData._();

  PsychologistPatientData._();

  factory PsychologistPatientData() => _instance;

  /// 0 => My Patient && 1 => All Patient
  late GenericBloc<int> selectedTabCubit;
  /// 0 => pre op && 1 => post op
  late GenericBloc<int> patientType;
  late GenericBloc<List<PatientModel>> patientsCubit;
  late GenericBloc<bool> isLoading;

  void init(BuildContext context,int index) {
    selectedTabCubit = GenericBloc(0);
    patientType = GenericBloc(0);
    isLoading = GenericBloc(false);
    patientsCubit = GenericBloc([]);
    selectedTabCubit.onUpdateData(index);
    fetchPatient(context);
  }

  void getAllPatientsPre(BuildContext context) async {
    isLoading.onUpdateData(true);
    List<PatientModel> result = await PsychologistRepository(context).getAllPatientPreOp();
    patientsCubit.onUpdateData(result);
    isLoading.onUpdateData(false);
  }

  void getAllPatientsPost(BuildContext context) async {
    isLoading.onUpdateData(true);
    List<PatientModel> result = await PsychologistRepository(context).getAllPatientPostOp();
    patientsCubit.onUpdateData(result);
    isLoading.onUpdateData(false);
  }

  void getMyPatientsPre(BuildContext context) async {
    isLoading.onUpdateData(true);
    List<PatientModel> result = await PsychologistRepository(context).getMyPatientPreOp();
    patientsCubit.onUpdateData(result);
    isLoading.onUpdateData(false);
  }

  void getMyPatientsPost(BuildContext context) async {
    isLoading.onUpdateData(true);
    List<PatientModel> result = await PsychologistRepository(context).getMyPatientPostOp();
    patientsCubit.onUpdateData(result);
    isLoading.onUpdateData(false);
  }

  void fetchPatient(BuildContext context){
    if(selectedTabCubit.state.data==0){
      if(patientType.state.data==0){
        getMyPatientsPre(context);
      }else{
        getMyPatientsPost(context);
      }
  }else{
      if(patientType.state.data==0){
        getAllPatientsPre(context);
      }else{
        getAllPatientsPost(context);
    }
    }
  }

  void openOpdDetailsCard(BuildContext context,List<PatientModel> lst,int index) async {
    lst[index].isOpen = !lst[index].isOpen!;
    patientsCubit.onUpdateData(patientsCubit.state.data);
  }
}
