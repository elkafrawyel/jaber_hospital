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
  late GenericBloc<bool> isLoadingMoreEnd;
  late GenericBloc<bool> isLoadingMore;
  late GenericBloc<int> totalResultCount;
  List<PatientModel> allPatientPostOpList = [];
  int page = 0;
  AllPatientPostOpResponse? allPatientPostOpResponse;

  void init(BuildContext context, int index) {
    selectedTabCubit = GenericBloc(0);
    patientType = GenericBloc(0);
    isLoading = GenericBloc(false);
    isLoadingMore = GenericBloc(false);
    isLoadingMoreEnd = GenericBloc(false);
    totalResultCount = GenericBloc(0);
    patientsCubit = GenericBloc([]);
    selectedTabCubit.onUpdateData(index);
    fetchPatient(context);
  }

  void getAllPatientsPre(BuildContext context) async {
    isLoading.onUpdateData(true);
    allPatientPostOpList = await SurgeonRepository(context).getAllPatientPreOp();
    patientsCubit.onUpdateData(allPatientPostOpList);
    totalResultCount.onUpdateData(allPatientPostOpList.length);
    isLoading.onUpdateData(false);
  }

  void getAllPatientsPost(BuildContext context) async {
    if (isLoading.state.data || isLoadingMore.state.data) {
      if (!(allPatientPostOpResponse?.pageInfo?.hasNext ?? true)) {
        isLoadingMoreEnd.onUpdateData(true);
        return;
      }
      return;
    }
    page++;

    if (page == 1) {
      patientsCubit.onUpdateData([]);
      isLoading.onUpdateData(true);
    } else {
      isLoadingMore.onUpdateData(true);
    }
    allPatientPostOpResponse = await SurgeonRepository(context).getAllPatientPostOp(page: page);
    allPatientPostOpList.addAll(allPatientPostOpResponse?.data ?? []);
    patientsCubit.onUpdateData(allPatientPostOpList);
    totalResultCount.onUpdateData(allPatientPostOpResponse?.pageInfo?.total ?? 0);
    isLoading.onUpdateData(false);
    isLoadingMore.onUpdateData(false);
  }

  void getMyPatientsPre(BuildContext context) async {
    isLoading.onUpdateData(true);
    allPatientPostOpList = await SurgeonRepository(context).getMyPatientPreOp();
    patientsCubit.onUpdateData(allPatientPostOpList);
    totalResultCount.onUpdateData(allPatientPostOpList.length);

    isLoading.onUpdateData(false);
  }

  void getMyPatientsPost(BuildContext context) async {
    if (isLoading.state.data || isLoadingMore.state.data) {
      if (!(allPatientPostOpResponse?.pageInfo?.hasNext ?? true)) {
        isLoadingMoreEnd.onUpdateData(true);
        return;
      }
      return;
    }
    page++;

    if (page == 1) {
      patientsCubit.onUpdateData([]);
      isLoading.onUpdateData(true);
    } else {
      isLoadingMore.onUpdateData(true);
    }
    allPatientPostOpResponse = await SurgeonRepository(context).getMyPatientPostOp(page: page);
    allPatientPostOpList.addAll(allPatientPostOpResponse?.data ?? []);
    patientsCubit.onUpdateData(allPatientPostOpList);
    totalResultCount.onUpdateData(allPatientPostOpResponse?.pageInfo?.total ?? 0);
    isLoading.onUpdateData(false);
    isLoadingMore.onUpdateData(false);
  }

  void fetchPatient(BuildContext context) {
    page = 0;
    allPatientPostOpList.clear();
    patientsCubit.onUpdateData([]);
    totalResultCount.onUpdateData(0);

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
