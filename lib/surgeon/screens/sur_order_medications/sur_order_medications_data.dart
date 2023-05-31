part of 'sur_order_medications_imports.dart';

class SurOrderMedicationsData {
  //singleton
  static SurOrderMedicationsData _instance = new SurOrderMedicationsData._();

  factory SurOrderMedicationsData() => _instance;

  SurOrderMedicationsData._();

  late GlobalKey<FormState> formKey;
  late TextEditingController patientName;
  late TextEditingController PatientMobileNumber;
  late TextEditingController dateController;
  late TextEditingController Medication;
  late TextEditingController search;
  late GenericBloc<String?> dateBloc;
  late GenericBloc<List<PatientNameModel>> patientNameBloc;
  late List<PatientNameModel> fullPatientList;
  late PatientNameModel? selectedPatientModel;
  late PaginationDto<MedicationInfo> paginationDto;
  late GenericBloc<List<MedicationInfo>> medicationCubit;
  late GenericBloc<List<MedicationInfo>> selectedMedicationCubit;
  // late ScrollController scrollController;

  List<CompanyId> companies = [];
  late GenericBloc<List<CompanyId>?> companiesCubit;
  late GenericBloc<List<MedicationInfo>> companyMedicationsCubit;
  List<MedicationInfo> medications = [];
  CompanyId? selectedCompany;
  // late DateTime dateTime;
  late String curDate;

  DateTime startDate = DateTime.now();

  void init(BuildContext context) {
    // scrollController = ScrollController();
    formKey = GlobalKey<FormState>();
    patientName = TextEditingController();
    PatientMobileNumber = TextEditingController();
    dateController= TextEditingController();
    Medication = TextEditingController();
    search = TextEditingController();
    dateBloc = GenericBloc(null);
    patientNameBloc = GenericBloc(List.empty());
    medicationCubit = GenericBloc(List.empty());
    companyMedicationsCubit = GenericBloc(List.empty());
    selectedMedicationCubit = GenericBloc(List.empty());

    fullPatientList = [];
    selectedPatientModel = null;
    // paginationDto = PaginationDto<MedicationInfo>(
    //     addedList: [],
    //     currentPage: 1,
    //     nextPage: false,
    //     paginationLoading: GenericBloc<bool>(false),
    //     refreshLoading: GenericBloc<bool>(false));

    startDate = new DateTime.now();
    curDate = DateFormat("dd/MM/yyyy").format(startDate);
    dateController.text = curDate;
    log("dateInIsoFormat==> ${startDate.toIso8601String()}");

    this.companiesCubit = GenericBloc<List<CompanyId>?>([]);
    fetchCompanies(context);
  }

  Future<void> fetchCompanies(BuildContext context) async {
    selectedCompany = null;
    CompaniesResponse? result = await SurgeonRepository(context).fetchCompanies();
    companies = result?.companies ?? [];
    log("companies=> ${companies.length}");
    companiesCubit.onUpdateData(companies);
  }

  Future<void> fetchCompanyMedications(BuildContext context, String companyId) async {
    this.companyMedicationsCubit = GenericBloc<List<MedicationInfo>>([]);
    this.selectedMedicationCubit = GenericBloc<List<MedicationInfo>>([]);
    CompMedicationsResponse? result = await SurgeonRepository(context).fetchCompanyMedications(companyId);
    List<MedicationInfo> compMedications = result?.medications??[];
    log("compMedications==> ${compMedications.length}");
    companyMedicationsCubit.onUpdateData(compMedications);
  }

  void getMedication(BuildContext context) {
    _getListMedication(context, firstTime: true, pageNumber: 1, refresh: true);
    _scrollListener(context);
  }

  void _getListMedication(BuildContext context,
      {int pageNumber = 1, bool firstTime = false, bool refresh = true}) async {
    final _ = paginationDto;
    var result = await SurgeonRepository(context)
        .getListMedication(pageNumber.toString());
    _.currentPage = result?.pageInfo?.page ?? 1;
    _.nextPage = result?.pageInfo?.hasNext ?? false;
    if (firstTime == true) {
      _.addedList = [];
    }
    _.addedList.addAll(result?.medicationInfoList?.toSet().toList() ?? []);
    companyMedicationsCubit.onUpdateData(_.addedList.toSet().toList());
    // medicationCubit.onUpdateData(_.addedList.toSet().toList());
    _.paginationLoading.onUpdateData(false);
    log("===================  ${medicationCubit.state.data.length}  ===================");
  }

  void _scrollListener(BuildContext context) {
    // scrollController.addListener(() {
    //   if (scrollController.offset >=
    //           scrollController.position.maxScrollExtent &&
    //       !scrollController.position.outOfRange) {
    //     final _ = paginationDto;
    //     if (_.nextPage != "") {
    //       _.paginationLoading.onUpdateData(true);
    //       log("paginate ${_.currentPage}");
    //       _getListMedication(context,
    //           firstTime: false, pageNumber: _.currentPage + 1);
    //     }
    //   }
    // });
  }

  void onChangeCounter({required int index, required bool isAdd}) {
    var model = companyMedicationsCubit.state.data;
    if (isAdd) {
      model![index].quantity = model[index].quantity! + 1;
    } else {
      if (model![index].quantity! > 1) {
        model[index].quantity = model[index].quantity! - 1;
      }
    }
    companyMedicationsCubit.onUpdateData(model);
  }

  _onConfirmFromDate(date) {
    if (date != null) {
      startDate = date;
      String dateStr = DateFormat("dd-MM-yyyy").format(date);
      dateBloc.onUpdateData(dateStr);
      print(dateBloc.state.data);
    }
  }

  chooseFromDate(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.datePicker(
      context: context,
      title: "Select Date",
      onConfirm: (date) => _onConfirmFromDate(date),
    );
  }

  void getPatientName(BuildContext context) async {
    List<PatientNameModel> result =
        await SurgeonRepository(context).getPatientNames();
    fullPatientList = result;
    patientNameBloc.onUpdateData(result);
  }

  void getPatientNameBySearch() {
    List<PatientNameModel> result = [];
    if (search.text.isNotEmpty) {
      for (int i = 0; i < fullPatientList.length; i++) {
        if (fullPatientList[i].firstNameEn.toString().contains(search.text) ||
            fullPatientList[i].lastNameEn.toString().contains(search.text)) {
          result.add(fullPatientList[i]);
        }
        patientNameBloc.onUpdateData(result);
      }
    } else {
      patientNameBloc.onUpdateData(fullPatientList);
    }
  }

  void onSelectPatientName(BuildContext context) {
    if (patientName.text.isEmpty) {
      CustomToast.showSnackBar(context, "Please choose patient name",
          backgroundColor: Colors.red);
    } else {
      log("data=> ${patientNameBloc.state.data}");
      selectedPatientModel = patientNameBloc.state.data.firstWhere((element) =>
          "${element.firstNameEn} ${element.lastNameEn}" == patientName.text);
      navigationKey.currentState!.pop();
      log(selectedPatientModel?.firstNameEn.toString() ?? '');
    }
  }

  void onAddMedication(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      DioUtils.showLoadingDialog();
      List<dynamic> medications = selectedMedicationCubit.state.data
          .map((item) => {
        "id": item.sId,
        "quantity":item.quantity,
      }).toList();
      Map<String, dynamic> body = {
        "doctor_id": "${context.read<UserCubit>().state.model.userData?[0].sId}",
        "company_id": "${selectedCompany?.sId}",
        "patient_id": "${selectedPatientModel?.sId}",
        "mobile_number": "${Utils.convertDigitsToLatin(PatientMobileNumber.text)}",
        "order_start_date": "${startDate.toIso8601String()}",
        "order_status": "routed to company",
        "status": true,
        "medications": medications,
      };
      log("medicationOrderBody==> $body");
      final response = await ApiService.post(ApiNames.requestMedicationOrder, body: body,);
      InstrumentsOrderResponse medicationsOrderResponse = InstrumentsOrderResponse.fromJson(response.data);
      log("responseData==> ${response.data}");
      DioUtils.dismissDialog();
      if(medicationsOrderResponse.code==200){
        await SurNotificationsData().createNotification(context,
          orderData: medicationsOrderResponse.orderData,
        );
        CustomToast.showSnackBar(context, response.data["message"]["message_en"]);
        navigationKey.currentState!.pop();
      } else{
        CustomToast.showSnackBar(context, response.data["message"]["message_en"]);
      }
    }
  }

  void dispose(BuildContext context) {
    // scrollController.dispose();
    medicationCubit.close();
    paginationDto.paginationLoading.close();
    paginationDto.refreshLoading.close();
    // scrollController.removeListener(() => _scrollListener(context));
  }
}
