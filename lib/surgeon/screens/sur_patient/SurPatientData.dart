part of 'SurPatientImports.dart';

class SurPatientData {
  static SurPatientData _instance = SurPatientData._();

  SurPatientData._();

  factory SurPatientData() => _instance;

  /// 0 => My Patient && 1 => All Patient
  late GenericBloc<int> selectedTabCubit;

  /// 0 => pre op && 1 => post op
  late GenericBloc<int> patientType;
  late GenericBloc<List<PatientModel>> patientsCubit;
  late GenericBloc<bool> isLoading;

  void init(BuildContext context, int index) {
    selectedTabCubit = GenericBloc(0);
    patientType = GenericBloc(0);
    isLoading = GenericBloc(false);
    patientsCubit = GenericBloc([]);
    selectedTabCubit.onUpdateData(index);
    fetchPatient(context);
  }

  void getAllPatientsPre(BuildContext context) async {
    isLoading.onUpdateData(true);
    List<PatientModel> result = await SurgeonRepository(context).getAllPatientPreOp();
    patientsCubit.onUpdateData(result);
    isLoading.onUpdateData(false);
  }

  void getAllPatientsPost(BuildContext context) async {
    isLoading.onUpdateData(true);
    List<PatientModel> result = await SurgeonRepository(context).getAllPatientPostOp();
    patientsCubit.onUpdateData(result);
    isLoading.onUpdateData(false);
  }

  void getMyPatientsPre(BuildContext context) async {
    isLoading.onUpdateData(true);
    List<PatientModel> result = await SurgeonRepository(context).getMyPatientPreOp();
    patientsCubit.onUpdateData(result);
    isLoading.onUpdateData(false);
  }

  void getMyPatientsPost(BuildContext context) async {
    isLoading.onUpdateData(true);
    List<PatientModel> result = await SurgeonRepository(context).getMyPatientPostOp();
    patientsCubit.onUpdateData(result);
    isLoading.onUpdateData(false);
  }

  void fetchPatient(BuildContext context) {
    if (selectedTabCubit.state.data == 0) {
      if (patientType.state.data == 0) {
        getMyPatientsPre(context);
      } else {
        getMyPatientsPost(context);
      }
    } else {
      if (patientType.state.data == 0) {
        getAllPatientsPre(context);
      } else {
        getAllPatientsPost(context);
      }
    }
  }

  void openOpdDetailsCard(BuildContext context, List<PatientModel> lst, int index) async {
    lst[index].isOpen = !lst[index].isOpen!;
    patientsCubit.onUpdateData(patientsCubit.state.data);
  }
}
