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
  late GenericBloc<bool> dmSelectionCubit;
  late GenericBloc<int> dmTypeSelectionCubit;
  late GenericBloc<String> diagnosisTypesCubit;
  late GenericBloc<String> cardiacDiseaseCubit;
  late GenericBloc<String> respiratoryDiseaseCubit;
  List<String> get diagnosisTypes => AddPatientDTOInfo.diagnosisTypes;
  List<String> get cardiacDiseaseTypes => AddPatientDTOInfo.cardiacDisease;
  List<String> get respiratoryDiseaseTypes =>
      AddPatientDTOInfo.respiratoryDisease;

  /// third page
  late GenericBloc<bool> refluxSelectionCubit;
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
  late GenericBloc<String> medicationTypeCubit;
  List<String> get medicationTypes => AddPatientDTOInfo.medicationTypes;

  /// fifth page
  late GenericBloc<bool> ProceduresSelectionCubit;
  late GenericBloc<String> surgeryTypeCubit;
  late TextEditingController proceduresOutcomeResultCubit;
  late TextEditingController proceduresOutcomeDateCubit;
  List<String> get surgeryTypes => AddPatientDTOInfo.surgeryTypes;

  /// sixth page
  late TextEditingController significantLabsController;
  List<SignificantLabsModel> get labsList => SignificantLabsModel.initList;
  late GenericBloc<List<SignificantLabsModel>> labsCubit;
  late GenericBloc<List<SignificantLabsModel>> selectedLabsCubit;
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
    dmSelectionCubit = GenericBloc(false);
    dmTypeSelectionCubit = GenericBloc(0);
    diagnosisTypesCubit = GenericBloc("");
    cardiacDiseaseCubit = GenericBloc("");
    respiratoryDiseaseCubit = GenericBloc("");
    medicationsCubit = GenericBloc("");
    smokingHabitsCubit = GenericBloc("");
    refluxSelectionCubit = GenericBloc(false);
    historyBallonSelectionCubit = GenericBloc(false);
    weightLossFrom = TextEditingController();
    weightLossTo = TextEditingController();
    removalDate = TextEditingController();
    insertionDate = TextEditingController();
    historyWeightLossSelectionCubit = GenericBloc(false);
    outcomeResult = TextEditingController();
    outcomeDate = TextEditingController();
    medicationTypeCubit = GenericBloc("");
    ProceduresSelectionCubit = GenericBloc(false);
    proceduresOutcomeResultCubit = TextEditingController();
    proceduresOutcomeDateCubit = TextEditingController();
    surgeryTypeCubit = GenericBloc("");
    significantLabsController = TextEditingController();
    labsCubit = GenericBloc(SignificantLabsModel.initList);
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

    onPageChanged();
  }

  void dispose() {
    pageController.dispose();
  }

  /// #############################  Page Controller  #############################
  void nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
    pageCubit.onUpdateData(pageCubit.state.data + 1);
  }

  void previousPage() {
    if (pageCubit.state.data == 1) return;
    pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
    pageCubit.onUpdateData(pageCubit.state.data - 1);
  }

  void onPageChanged() {
    pageController.addListener(() {
      int nextPage = pageController.page!.round();
      pageCubit.onUpdateData(nextPage + 1);
    });
  }

  Widget buildAddPatientPage(int index) {
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

  void addPatientFirst(BuildContext context) async {
    UserModel? users = context.read<UserCubit>().state.model;
    if (formKey1.currentState!.validate()) {
      AddPatientFirstDto model = AddPatientFirstDto(
        height: num.parse(patientHeight.text),
        weight: num.parse(patientWeight.text),
        bmi: num.parse(BMI.text),
        nameAr: patientNameAr.text,
        nameEn: patientNameEn.text,
        age: int.parse(patientAge.text),
        email: patientEmail.text,
        password: patientMobile1.text,
        telephone1: patientMobile1.text,
        telephone2: patientMobile2.text,
        civilId: patientId.text,
        gender: patientGenderCubit.state.data,
        publicId: "137g352fs",
        fileId: "234873456",
        image:
        "https://res.cloudinary.com/djamk74m7/image/upload/v1654887002/avatar_chef4p.png",
      );
      bool result = await SurgeonRepository(context).addPatientFirst(
          userId: users.userData?[0].doctorRoleId?.sId ?? "", model: model);
      if (result) {
        FocusScope.of(context).requestFocus(FocusNode());
        nextPage();
      }
    }

  }

  /// #############################  second page  #############################
  /// #############################  third page  #############################
  /// #############################  fourth page  #############################
  /// #############################  fifth page  #############################
  /// #############################  sixth page  #############################
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
