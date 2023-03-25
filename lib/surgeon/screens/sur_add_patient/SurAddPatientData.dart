part of 'SurAddPatientImports.dart';

class SurAddPatientData {
  SurAddPatientData._();

  static SurAddPatientData surAddPatientData = SurAddPatientData._();

  factory SurAddPatientData() => surAddPatientData;

  late PageController pageController;
  late GenericBloc<int> pageCubit;

  /// first page
  late GlobalKey<FormState> formKey1;
  late TextEditingController patientNameAr;
  late TextEditingController patientNameEn;
  late TextEditingController patientId;
  late GenericBloc<String> patientGenderCubit;
  late TextEditingController patientFileNumber;
  late TextEditingController patientEmail;
  late TextEditingController patientMobile1;
  late TextEditingController patientMobile2;
  late TextEditingController patientAge;
  late TextEditingController patientWeight;
  late TextEditingController patientHeight;
  late TextEditingController BMI;

  /// second page
  late GenericBloc<bool> RespiratoryDiseaseSelectionCubit;
  late TextEditingController otherNotes;
  late GenericBloc<bool> dmSelectCubit;
  late GenericBloc<int> dmTypeSelectionCubit;
  late GenericBloc<List<String>> diagnosisTypesCubit;
  late GenericBloc<String> cardiacDiseaseCubit;
  late GenericBloc<List<String>> respiratoryDiseaseCubit;
  late TextEditingController otherNotesDm;

  List<String> get diagnosisTypes => AddPatientDTOInfo.diagnosisTypes;

  List<String> get cardiacDiseaseTypes => AddPatientDTOInfo.cardiacDisease;

  List<String> get respiratoryDiseaseTypes => AddPatientDTOInfo.respiratoryDisease;

  /// third page
  late GenericBloc<bool> refSelectionCubit;
  late GenericBloc<String> medicationsCubit;
  late GenericBloc<String> smokingHabitsCubit;

  List<String> get medications => AddPatientDTOInfo.Medications;

  List<String> get smokingHabits => AddPatientDTOInfo.smokingHabits;

  /// fourth page
  late GenericBloc<bool> historyBallonSelectionCubit;
  late GenericBloc<bool> historyWeightLossSelectionCubit;
  late TextEditingController weightLossFrom;
  late TextEditingController weightLossTo;
  late TextEditingController removalDate;
  late TextEditingController insertionDate;
  late TextEditingController outcomeResult;
  late TextEditingController outcomeDate;
  late GenericBloc<List<String>> medicationTypeCubit;

  List<String> get medicationTypes => AddPatientDTOInfo.medicationTypes;

  /// fifth page
  late GenericBloc<bool> proceduresSelectionCubit;
  late GenericBloc<String> surgeryTypeCubit;
  late TextEditingController proceduresOutcomeResultCubit;
  late TextEditingController proceduresOutcomeDateCubit;

  List<String> get surgeryTypes => AddPatientDTOInfo.surgeryTypes;

  /// sixth page
  late TextEditingController significantLabsController;

  List<LabModel> labsList = [];
  late GenericBloc<List<LabModel>> labsCubit;
  late GenericBloc<List<LabModel>> selectedLabsCubit;
  late GenericBloc<bool> ultrasoundCubit;
  late GenericBloc<String> USFindingsCubit;

  List<String> get USFindings => AddPatientDTOInfo.USFindings;
  late TextEditingController otherUSFindingsController;
  late TextEditingController FluoroscopyController;
  late GenericBloc<File?> FluoroscopyImageCubit;
  late TextEditingController otherNotesController;
  late TextEditingController AnastomoticSizeController;

  /// seventh page
  late TextEditingController EGDResultController;
  late GenericBloc<File?> EGDResultImageCubit;
  late TextEditingController OtherOesophagusController;
  late TextEditingController OtherStomachController;
  late TextEditingController SizeController;
  late TextEditingController OtherDuodenumController;
  late GenericBloc<bool> EGDCubit;
  late GenericBloc<bool> NormalOesophagusCubit;
  late GenericBloc<bool> oesophagusCubit;
  late GenericBloc<bool> oesophagusGradeCubit;
  late GenericBloc<String> oesophagusGradeTypeCubit;
  late GenericBloc<bool> barretOesophagusCubit;
  late GenericBloc<bool> HiatusHerniaCubit;
  late GenericBloc<String> SizeCubit;
  late GenericBloc<bool> GastritisCubit;
  late GenericBloc<String> GastritisTypeCubit;
  late GenericBloc<bool> gastricUlcerCubit;
  late GenericBloc<String> HPyloriCubit;
  late GenericBloc<bool> PolypsCubit;
  late GenericBloc<bool> PostSurgeryCubit;
  late GenericBloc<String> PostSurgeryTypeCubit;
  late GenericBloc<bool> PouchDilatationCubit;
  late GenericBloc<bool> AnastomoticSizeCubit;
  late GenericBloc<bool> UlcerCubit;
  late GenericBloc<bool> StrictureCubit;
  late GenericBloc<bool> BileCubit;
  late GenericBloc<bool> TwistCubit;
  late GenericBloc<String> PreviousLSGStatusCubit;
  late GenericBloc<bool> NormalDuodenum;
  late GenericBloc<bool> DuodenalUlcer;
  late GenericBloc<bool> OtherDuodenum;

  List<String> get oesophagusGradeType => AddPatientDTOInfo.oesophagusGradeType;

  List<String> get GastritisType => AddPatientDTOInfo.GastritisType;

  List<String> get HPyloriType => AddPatientDTOInfo.HPyloriType;

  List<String> get PreviousSurgeryType => AddPatientDTOInfo.PostSurgeryType;

  List<String> get PostLSGStatusType => AddPatientDTOInfo.PostLSGStatusType;

  List<String> get SizeType => AddPatientDTOInfo.SizeType;

  /// #############################  init screen  #############################
  void initScreen(BuildContext context) {
    pageController = PageController();
    formKey1 = GlobalKey<FormState>();
    pageCubit = GenericBloc(1);
    otherNotesDm = TextEditingController();
    patientNameAr = TextEditingController();
    patientGenderCubit = GenericBloc("male");
    patientNameEn = TextEditingController();
    patientId = TextEditingController();
    patientFileNumber = TextEditingController();
    patientMobile1 = TextEditingController();
    patientMobile2 = TextEditingController();
    patientEmail = TextEditingController();
    RespiratoryDiseaseSelectionCubit = GenericBloc(false);
    patientAge = TextEditingController();
    patientWeight = TextEditingController();
    patientHeight = TextEditingController();
    BMI = TextEditingController();
    otherNotes = TextEditingController();
    refSelectionCubit = GenericBloc(false);
    dmTypeSelectionCubit = GenericBloc(0);
    diagnosisTypesCubit = GenericBloc([]);
    cardiacDiseaseCubit = GenericBloc("");
    respiratoryDiseaseCubit = GenericBloc([]);
    medicationsCubit = GenericBloc("");
    smokingHabitsCubit = GenericBloc("");
    dmSelectCubit = GenericBloc(false);
    historyBallonSelectionCubit = GenericBloc(false);
    weightLossFrom = TextEditingController();
    weightLossTo = TextEditingController();
    removalDate = TextEditingController();
    insertionDate = TextEditingController();
    historyWeightLossSelectionCubit = GenericBloc(false);
    outcomeResult = TextEditingController();
    outcomeDate = TextEditingController();
    medicationTypeCubit = GenericBloc([]);
    proceduresSelectionCubit = GenericBloc(false);
    proceduresOutcomeResultCubit = TextEditingController();
    proceduresOutcomeDateCubit = TextEditingController();
    surgeryTypeCubit = GenericBloc("");
    significantLabsController = TextEditingController();
    labsCubit = GenericBloc([]);
    selectedLabsCubit = GenericBloc([]);
    ultrasoundCubit = GenericBloc(false);
    USFindingsCubit = GenericBloc("");
    otherUSFindingsController = TextEditingController();
    FluoroscopyController = TextEditingController();
    FluoroscopyImageCubit = GenericBloc(null);
    otherNotesController = TextEditingController();
    AnastomoticSizeController = TextEditingController();
    EGDResultController = TextEditingController();
    OtherOesophagusController = TextEditingController();
    OtherStomachController = TextEditingController();
    SizeController = TextEditingController();
    OtherDuodenumController = TextEditingController();
    EGDCubit = GenericBloc(false);
    NormalOesophagusCubit = GenericBloc(false);
    oesophagusCubit = GenericBloc(false);
    oesophagusGradeCubit = GenericBloc(false);
    oesophagusGradeTypeCubit = GenericBloc("");
    barretOesophagusCubit = GenericBloc(false);
    HiatusHerniaCubit = GenericBloc(false);
    SizeCubit = GenericBloc("");
    GastritisCubit = GenericBloc(false);
    gastricUlcerCubit = GenericBloc(false);
    GastritisTypeCubit = GenericBloc("");
    HPyloriCubit = GenericBloc("");
    PolypsCubit = GenericBloc(false);
    PostSurgeryCubit = GenericBloc(false);
    PostSurgeryTypeCubit = GenericBloc("");
    PouchDilatationCubit = GenericBloc(false);
    AnastomoticSizeCubit = GenericBloc(false);
    UlcerCubit = GenericBloc(false);
    StrictureCubit = GenericBloc(false);
    BileCubit = GenericBloc(false);
    PreviousLSGStatusCubit = GenericBloc("");
    NormalDuodenum = GenericBloc(false);
    DuodenalUlcer = GenericBloc(false);
    OtherDuodenum = GenericBloc(false);
    EGDResultImageCubit = GenericBloc(null);
    TwistCubit = GenericBloc(false);
    getAllLabs(context);
    onPageChanged();
  }

  void dispose() {
    pageController.dispose();
  }

  /// #############################  Page Controller  #############################
  void nextPage() {
    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
    pageCubit.onUpdateData(pageCubit.state.data + 1);
  }

  void previousPage() {
    if (pageCubit.state.data == 1) return;
    pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
    pageCubit.onUpdateData(pageCubit.state.data - 1);
  }

  void onPageChanged() {
    pageController.addListener(() {
      int nextPage = pageController.page!.round();
      pageCubit.onUpdateData(nextPage + 1);
    });
  }

  Widget buildAddPatientPage(int index) {
    // index = 5;
    switch (index) {
      case 0:
        return AddPatientFirstPage();
      case 1:
        return AddPatientSecondPage();
      case 2:
        return AddPatientThirdPage();
      case 3:
        return AddPatientFourthPage();
      case 4:
        return AddPatientFifthPage();
      case 5:
        return AddPatientSixthPage();
      case 6:
        return AddPatientSeventhPage();
      default:
        return AddPatientFirstPage();
    }
  }

  /// #############################  first page  #############################

  void calculateBMI() {
    if (patientWeight.text.isNotEmpty && patientHeight.text.isNotEmpty) {
      double weight = double.parse(patientWeight.text);
      double height = double.parse(patientHeight.text);
      double bmi = ((weight / height) / height) * 10000;
      BMI.text = bmi.toStringAsFixed(2);
    } else {
      BMI.text = "";
    }
  }

  /// #############################  first page  #############################
  void addPatientFirst(BuildContext context) async {
    UserModel? users = context.read<UserCubit>().state.model;
    if (formKey1.currentState!.validate()) {
      int? age = int.tryParse(patientAge.text);
      if (age == null) {
        CustomToast.showToastNotification('Enter valid age', color: Colors.red);
        return;
      }
      num? weight = num.tryParse(patientWeight.text);
      if (weight == null) {
        CustomToast.showToastNotification('Enter valid weight', color: Colors.red);
        return;
      }
      num? height = num.tryParse(patientHeight.text);
      if (height == null) {
        CustomToast.showToastNotification('Enter valid height', color: Colors.red);
        return;
      }
      num? bmi = num.tryParse(BMI.text);
      if (bmi == null) {
        CustomToast.showToastNotification('Enter valid bmi', color: Colors.red);
        return;
      }

      AddPatientFirstDto model = AddPatientFirstDto(
        height: height,
        weight: weight,
        bmi: bmi,
        nameAr: patientNameAr.text,
        nameEn: patientNameEn.text,
        age: age,
        email: patientEmail.text,
        password: patientMobile1.text,
        telephone1: patientMobile1.text,
        telephone2: patientMobile2.text,
        civilId: patientId.text,
        gender: patientGenderCubit.state.data,
        publicId: "137g352fs",
        fileId: "234873456",
        image: "https://res.cloudinary.com/djamk74m7/image/upload/v1654887002/avatar_chef4p.png",
      );
      bool result = await SurgeonRepository(context).addPatientFirst(
        userId: users.userData?[0].doctorRoleId?.sId ?? "",
        model: model,
      );
      if (result) {
        FocusScope.of(context).requestFocus(FocusNode());
        nextPage();
      }
    }
  }

  /// #############################  second page  #############################
  void addPatientSecond(BuildContext context) async {
    AddPatientSecondDto model = AddPatientSecondDto(
      dmType: refSelectionCubit.state.data,
      dmTypel: dmTypeSelectionCubit.state.data == 1 ? true : false,
      dmTypell: dmTypeSelectionCubit.state.data == 2 ? true : false,
      htn: diagnosisTypesCubit.state.data.contains("HTN") ? true : false,
      dyslipidemia: diagnosisTypesCubit.state.data.contains("Dyslipidemia") ? true : false,
      osa: diagnosisTypesCubit.state.data.contains("OSA") ? true : false,
      fattyLiver: diagnosisTypesCubit.state.data.contains("Fatty Liver") ? true : false,
      pcos: diagnosisTypesCubit.state.data.contains("PCOS") ? true : false,
      cardiacDiseaseIhd: cardiacDiseaseCubit.state.data == "IHD" ? true : false,
      cardiacDiseaseHf: cardiacDiseaseCubit.state.data == "HF" ? true : false,
      respiratoryDisVte: respiratoryDiseaseCubit.state.data.contains("VTE") ? true : false,
      respiratoryDisAnticoag: respiratoryDiseaseCubit.state.data.contains("Anticoagulants") ? true : false,
      respiratoryDisAntiplate: respiratoryDiseaseCubit.state.data.contains("Antiplatelets") ? true : false,
      coMorbiditiesOtherNotes: otherNotesDm.text,
      alcohol: false,
    );
    bool result = await SurgeonRepository(context).addPatientSecond(model);
    if (result) {
      FocusScope.of(context).requestFocus(FocusNode());
      nextPage();
    }
  }

  /// #############################  third page  #############################
  void addPatientThird(BuildContext context) async {
    AddPatientThirdDto model = AddPatientThirdDto(
      reflux: refSelectionCubit.state.data,
      exSmoker: smokingHabitsCubit.state.data == "Ex-smoker",
      nonSmoker: smokingHabitsCubit.state.data == "Non-smoker",
      lessThan20Cigg: smokingHabitsCubit.state.data == "Less than 20 cigarettes",
      moreThan20Cigg: smokingHabitsCubit.state.data == "More than 20 cigarettes",
      vape: smokingHabitsCubit.state.data == "Vape",
      occationalSmoker: smokingHabitsCubit.state.data == "Occasional smoker",
      shisha: smokingHabitsCubit.state.data == "Shisha",
      refluxMedRegular: medicationsCubit.state.data == "Regular" || dmSelectCubit.state.data,
      refluxMedOcc: medicationsCubit.state.data == "Occasional" || dmSelectCubit.state.data,
      refluxMedNone: medicationsCubit.state.data == "None" || dmSelectCubit.state.data,
    );
    bool result = await SurgeonRepository(context).addPatientThird(model);
    if (result) {
      FocusScope.of(context).requestFocus(FocusNode());
      nextPage();
    }
  }

  /// #############################  fourth page  ############################
  void addPatientFourth(BuildContext context) async {
    AddPatientFourthDto model = AddPatientFourthDto(
      historyOfBallon: historyBallonSelectionCubit.state.data,
      ballonWeightLossFrom: int.tryParse(weightLossFrom.text),
      ballonWeightLossTo: int.tryParse(weightLossTo.text),
      ballonDateOfInsertion: insertionDate.text,
      ballonDateOfRemoval: removalDate.text,
      historyOfWeightLoss: historyWeightLossSelectionCubit.state.data,
      weightLossOutcomeResult: int.tryParse(outcomeResult.text),
      weightLossOutcomeDate: outcomeDate.text,
      medicationTypeOzempic: medicationTypeCubit.state.data.contains("Ozempic"),
      medicationTypeSaxenda: medicationTypeCubit.state.data.contains("Saxenda"),
      medicationTypeTrulicity: medicationTypeCubit.state.data.contains("Trulicity"),
      medicationTypeVictoza: medicationTypeCubit.state.data.contains("Victoza"),
      medicationTypeWegovo: medicationTypeCubit.state.data.contains("Wegovo"),
    );
    bool result = await SurgeonRepository(context).addPatientFourth(model);
    if (result) {
      FocusScope.of(context).requestFocus(FocusNode());
      nextPage();
    }
  }

  /// #############################  fifth page  #############################
  void addPatientFifth(BuildContext context) async {
    int? outComeResult = int.tryParse(proceduresOutcomeResultCubit.text);
    if (outComeResult == null) {
      CustomToast.showToastNotification('Enter valid outcome result', color: Colors.red);
      return;
    }
    AddPatientFifthDto model = AddPatientFifthDto(
      previousBariatric: proceduresSelectionCubit.state.data,
      bariatricOutcomeResult: outComeResult,
      bariatricOutcomeDate: proceduresOutcomeDateCubit.text,
      surgeryTypeLsg: surgeryTypeCubit.state.data.contains('LSG'),
      surgeryTypeLagb: surgeryTypeCubit.state.data.contains('LAGB'),
      surgeryTypePilication: surgeryTypeCubit.state.data.contains('Pilcation'),
      surgeryTypeRygbp: surgeryTypeCubit.state.data.contains('RYGBP'),
      surgeryTypeMgbp: surgeryTypeCubit.state.data.contains('MGBP'),
      surgeryTypeSadiS: surgeryTypeCubit.state.data.contains('SADI-S'),
      surgeryTypeSasi: surgeryTypeCubit.state.data.contains('SASI'),
    );
    bool result = await SurgeonRepository(context).addPatientFifth(model);
    if (result) {
      FocusScope.of(context).requestFocus(FocusNode());
      nextPage();
    }
  }

  /// #############################  sixth page  #############################

  Future getAllLabs(BuildContext context) async {
    LabsResponse? labsResponse = await SurgeonRepository(context).getAllLabs();
    labsList = labsResponse?.data ?? [];

    labsCubit.onUpdateData(labsList);
  }

  void addPatientSixth(BuildContext context) async {
    if (FluoroscopyImageCubit.state.data != null) {
      // upload image first
    }

    AddPatientSixthDto model = AddPatientSixthDto(
      ultrasound: historyBallonSelectionCubit.state.data,
      ultrasound_finding_fatty_liver: USFindingsCubit.state.data.contains('Fatty liver'),
      ultrasound_finding_gbs: USFindingsCubit.state.data.contains('GBS'),
      ultrasound_finding_hernia: USFindingsCubit.state.data.contains('Hernia'),
      ultrasound_finding_cirrhos: USFindingsCubit.state.data.contains('Cirrhos'),
      ultrasound_finding_others: USFindingsCubit.state.data.contains('Others'),
      ultrasound_finding_others_note: otherNotesController.text,
      fluoroscopy_result: FluoroscopyController.text,
    );

    bool result = await SurgeonRepository(context).addPatientSixth(model);
    if (result) {
      FocusScope.of(context).requestFocus(FocusNode());
      nextPage();
    }
  }

  setFluoroscopyImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      FluoroscopyImageCubit.onUpdateData(image);
    }
  }

  /// #############################  seventh page  #############################

  setEGDResultImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      EGDResultImageCubit.onUpdateData(image);
    }
  }
}
