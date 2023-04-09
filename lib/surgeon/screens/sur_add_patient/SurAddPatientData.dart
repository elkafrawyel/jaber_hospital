part of 'SurAddPatientImports.dart';

class SurAddPatientData {
  SurAddPatientData._();

  static SurAddPatientData surAddPatientData = SurAddPatientData._();

  factory SurAddPatientData() => surAddPatientData;

  late PageController pageController;
  late GenericBloc<int> pageCubit;

  /// first page
  late GlobalKey<FormState> formKey1;
  late TextEditingController patientFNameAr;
  late TextEditingController patientLNameAr;
  late TextEditingController patientFNameEn;
  late TextEditingController patientLNameEn;
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
  late GenericBloc<String> cardiacDiseaseIHDCubit;
  late GenericBloc<String> cardiacDiseaseHFCubit;
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

  bool editing = false;
  PatientDetailsModel? patientDetailsModel;
  String? addedPatientId;

  /// #############################  init screen  #############################
  void initScreen(BuildContext context, {PatientDetailsModel? patientDetailsModel}) async {
    editing = patientDetailsModel != null;
    this.patientDetailsModel = patientDetailsModel;
    pageController = PageController();
    formKey1 = GlobalKey<FormState>();
    pageCubit = GenericBloc(1);
    otherNotesDm = TextEditingController(text: patientDetailsModel?.patient?.otherNotes ?? '');
    patientGenderCubit = GenericBloc(patientDetailsModel?.patient?.gender == 'female' ? 'female' : 'male');
    patientFNameEn = TextEditingController(text: patientDetailsModel?.patient?.fNameEn ?? '');
    patientLNameEn = TextEditingController(text: patientDetailsModel?.patient?.lNameEn ?? '');
    patientFNameAr = TextEditingController(text: patientDetailsModel?.patient?.fNameAr ?? '');
    patientLNameAr = TextEditingController(text: patientDetailsModel?.patient?.lNameAr ?? '');
    patientId = TextEditingController(text: patientDetailsModel?.patient?.civilId ?? '');
    patientFileNumber = TextEditingController(text: patientDetailsModel?.patient?.publicId ?? '');
    patientMobile1 = TextEditingController(text: patientDetailsModel?.patient?.telephone1 ?? '');
    patientMobile2 = TextEditingController(text: patientDetailsModel?.patient?.telephone2 ?? '');
    patientEmail = TextEditingController(text: patientDetailsModel?.patient?.email ?? '');
    RespiratoryDiseaseSelectionCubit = GenericBloc(patientDetailsModel?.patient?.respiratoryDis ?? false);
    patientAge = TextEditingController(text: patientDetailsModel?.patient?.age?.toString() ?? '');
    patientWeight = TextEditingController(text: patientDetailsModel?.patient?.weight?.toString() ?? '');
    patientHeight = TextEditingController(text: patientDetailsModel?.patient?.height?.toString() ?? '');
    BMI = TextEditingController(text: patientDetailsModel?.patient?.bmi?.toString() ?? '');
    otherNotes = TextEditingController(text: patientDetailsModel?.patient?.otherNotes?.toString() ?? '');
    refSelectionCubit = GenericBloc(patientDetailsModel?.patient?.reflux ?? false);
    dmTypeSelectionCubit = GenericBloc(patientDetailsModel?.patient?.dmType ?? false ? 1 : 0);
    diagnosisTypesCubit = GenericBloc([]);
    if (patientDetailsModel?.patient?.htn ?? false) {
      diagnosisTypesCubit.state.data.add('HTN');
    }
    if (patientDetailsModel?.patient?.dyslipidemia ?? false) {
      diagnosisTypesCubit.state.data.add('Dyslipidemia');
    }
    if (patientDetailsModel?.patient?.osa ?? false) {
      diagnosisTypesCubit.state.data.add('OSA');
    }
    if (patientDetailsModel?.patient?.fattyLiver ?? false) {
      diagnosisTypesCubit.state.data.add('Fatty Liver');
    }
    if (patientDetailsModel?.patient?.pcos ?? false) {
      diagnosisTypesCubit.state.data.add('PCOS');
    }
    cardiacDiseaseIHDCubit = GenericBloc((patientDetailsModel?.patient?.cardiacDiseaseIhd ?? false) ? "IHD" : '');
    cardiacDiseaseHFCubit = GenericBloc((patientDetailsModel?.patient?.cardiacDiseaseHf ?? false) ? "HF" : '');
    respiratoryDiseaseCubit = GenericBloc([]);
    if (patientDetailsModel?.patient?.vte ?? false) {
      respiratoryDiseaseCubit.state.data.add('VTE');
    }
    if (patientDetailsModel?.patient?.antiplate ?? false) {
      respiratoryDiseaseCubit.state.data.add('Antiplatelets');
    }
    if (patientDetailsModel?.patient?.anticoag ?? false) {
      respiratoryDiseaseCubit.state.data.add('Anticoagulants');
    }
    medicationsCubit = GenericBloc("");
    smokingHabitsCubit = GenericBloc("");
    dmSelectCubit = GenericBloc(
        (patientDetailsModel?.patient?.dmTypel ?? false) ? (patientDetailsModel?.patient?.dmTypell ?? false) : false);
    historyBallonSelectionCubit = GenericBloc(patientDetailsModel?.patient?.historyOfBallon ?? false);
    weightLossFrom = TextEditingController(text: patientDetailsModel?.patient?.ballonWeightLossFrom?.toString() ?? '');
    weightLossTo = TextEditingController(text: patientDetailsModel?.patient?.ballonWeightLossTo?.toString() ?? '');
    removalDate = TextEditingController(text: patientDetailsModel?.patient?.ballonDateOfRemoval?.toString() ?? '');
    insertionDate = TextEditingController(text: patientDetailsModel?.patient?.ballonDateOfInsertion?.toString() ?? '');
    historyWeightLossSelectionCubit = GenericBloc(patientDetailsModel?.patient?.historyOfWeightLoss ?? false);
    outcomeResult = TextEditingController(text: patientDetailsModel?.patient?.weightLossOutcomeResult?.toString());
    outcomeDate = TextEditingController(text: patientDetailsModel?.patient?.weightLossOutcomeDate ?? '');
    medicationTypeCubit = GenericBloc([]);
    proceduresSelectionCubit = GenericBloc(false);
    proceduresOutcomeResultCubit = TextEditingController();
    proceduresOutcomeDateCubit = TextEditingController();
    surgeryTypeCubit = GenericBloc("");
    significantLabsController = TextEditingController();
    labsCubit = GenericBloc([]);
    selectedLabsCubit = GenericBloc([]);
    ultrasoundCubit = GenericBloc(patientDetailsModel?.patient?.ultrasound ?? false);
    USFindingsCubit = GenericBloc(patientDetailsModel?.patient?.ultrasoundFindingOthersNote ?? '');
    otherUSFindingsController = TextEditingController(
      text: patientDetailsModel?.patient?.ultrasoundFindingOthersNote ?? '',
    );
    FluoroscopyImageCubit = GenericBloc(null);
    otherNotesController = TextEditingController(text: patientDetailsModel?.patient?.otherNotes ?? '');
    AnastomoticSizeController =
        TextEditingController(text: patientDetailsModel?.patient?.egdAnastomoticSizeNumber ?? '');
    EGDResultController = TextEditingController(text: patientDetailsModel?.patient?.egdResults ?? '');
    OtherOesophagusController = TextEditingController(text: patientDetailsModel?.patient?.egdOesophagusOther ?? '');
    OtherStomachController = TextEditingController(text: patientDetailsModel?.patient?.egdStomachOthers ?? '');
    SizeController = TextEditingController(text: patientDetailsModel?.patient?.egdHiatusHerniaSize ?? '');
    OtherDuodenumController = TextEditingController(text: patientDetailsModel?.patient?.egdDuodenumOthers ?? '');
    EGDCubit = GenericBloc(patientDetailsModel?.patient?.egd ?? false);
    NormalOesophagusCubit = GenericBloc(patientDetailsModel?.patient?.egdOesophagusNormal ?? false);
    oesophagusCubit = GenericBloc(patientDetailsModel?.patient?.egdOesophagusOesophagitis ?? false);
    oesophagusGradeCubit = GenericBloc(patientDetailsModel?.patient?.egdOesophagusGrade ?? false);
    oesophagusGradeTypeCubit = GenericBloc(patientDetailsModel?.patient?.egdOesophagusGradeType ?? "");
    barretOesophagusCubit = GenericBloc(patientDetailsModel?.patient?.egdOesophagusBarrets ?? false);
    HiatusHerniaCubit = GenericBloc(patientDetailsModel?.patient?.egdStomachHaitus ?? false);
    SizeCubit = GenericBloc(patientDetailsModel?.patient?.egdHiatusHerniaSize ?? "");
    GastritisCubit = GenericBloc(patientDetailsModel?.patient?.egdStomachGas ?? false);
    gastricUlcerCubit = GenericBloc(false);
    GastritisTypeCubit = GenericBloc("");
    HPyloriCubit = GenericBloc("");
    PolypsCubit = GenericBloc(patientDetailsModel?.patient?.egdStomachPolyps ?? false);
    PostSurgeryCubit = GenericBloc(patientDetailsModel?.patient?.egdPreviousSurgery ?? false);
    PostSurgeryTypeCubit = GenericBloc("");
    PouchDilatationCubit = GenericBloc(false);
    AnastomoticSizeCubit = GenericBloc(false);
    UlcerCubit = GenericBloc(patientDetailsModel?.patient?.egdUlcer ?? false);
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
    // index = 1;
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
        fNameAr: patientFNameAr.text,
        fNameEn: patientFNameEn.text,
        age: age,
        email: patientEmail.text,
        password: '${patientFNameEn.text}@${patientMobile1.text}',
        telephone1: patientMobile1.text,
        telephone2: patientMobile2.text,
        // civilId: patientId.text,
        gender: patientGenderCubit.state.data,
        publicId: "137g352fs",
        fileId: patientFileNumber.text,
        image: "https://res.cloudinary.com/djamk74m7/image/upload/v1654887002/avatar_chef4p.png",
      );
      if (editing || addedPatientId != null) {
        bool result = await SurgeonRepository(context).editPatientFirst(
          userId: addedPatientId ?? patientDetailsModel?.patient?.id ?? '',
          model: model,
        );

        if (result) {
          FocusScope.of(context).requestFocus(FocusNode());
          nextPage();
        }
      } else {
        String? patientId = await SurgeonRepository(context).addPatientFirst(
          userId: users.userData?[0].doctorRoleId?.sId ?? "",
          model: model,
        );

        if (patientId != null) {
          FocusScope.of(context).requestFocus(FocusNode());
          addedPatientId = patientId;
          nextPage();
        }
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
      cardiacDiseaseIhd: cardiacDiseaseHFCubit.state.data == "HF" ? true : false,
      cardiacDiseaseHf: cardiacDiseaseIHDCubit.state.data == "IHD" ? true : false,
      respiratory_dis: RespiratoryDiseaseSelectionCubit.state.data,
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
      medicationTypeWegovo: medicationTypeCubit.state.data.contains("Wegovy"),
      medicationTypeMounjaro: medicationTypeCubit.state.data.contains("Mounjaro"),
    );
    bool result = await SurgeonRepository(context).addPatientFourth(model);
    if (result) {
      FocusScope.of(context).requestFocus(FocusNode());
      nextPage();
    }
  }

  /// #############################  fifth page  #############################

  void addPatientFifth(BuildContext context) async {
    AddPatientFifthDto model = AddPatientFifthDto(
      previousBariatric: proceduresSelectionCubit.state.data,
      bariatricOutcomeResult: int.tryParse(proceduresOutcomeResultCubit.text),
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
    if (labsCubit.state.data.isNotEmpty) {
      return;
    }
    labsList = await SurgeonRepository(context).getAllLabs() ?? [];
    labsCubit.onUpdateToInitState(labsList);
  }

  void addPatientSixth(BuildContext context) async {
    if (FluoroscopyImageCubit.state.data != null) {
      bool result = await SurgeonRepository(context).uploadFluoroscopyResult(FluoroscopyImageCubit.state.data!);
      if (result) {
        print('File uploaded Successfully');
      }
    }

    AddPatientSixthDto model = AddPatientSixthDto(
      ultrasound: historyBallonSelectionCubit.state.data,
      ultrasound_finding_fatty_liver: USFindingsCubit.state.data.contains('Fatty liver'),
      ultrasound_finding_gbs: USFindingsCubit.state.data.contains('GBS'),
      ultrasound_finding_hernia: USFindingsCubit.state.data.contains('Hernia'),
      ultrasound_finding_cirrhos: USFindingsCubit.state.data.contains('Cirrhos'),
      ultrasound_finding_others: USFindingsCubit.state.data.contains('Others'),
      ultrasound_finding_others_note: otherNotesController.text,
      fluoroscopy_result: 'uploaded image link',
      labs: selectedLabsCubit.state.data
          .map(
            (e) => PatientLabs(
              labId: e.id,
              status: true,
              result: e.resultController?.text ?? '',
            ),
          )
          .toList(),
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

  void addPatientSeventh(BuildContext context) async {
    if (EGDResultImageCubit.state.data != null) {
      bool result = await SurgeonRepository(context).uploadEgd(EGDResultImageCubit.state.data!);
      if (result) {
        print('File uploaded Successfully');
      }
    }

    AddPatientSeventhDto model = AddPatientSeventhDto(
      egd: EGDCubit.state.data,
      // egdResults: EGDResultController.text,
      egdOesophagusNormal: NormalOesophagusCubit.state.data,
      egdOesophagusOesophagitis: oesophagusCubit.state.data,
      egdOesophagusGrade: oesophagusGradeCubit.state.data,
      egdOesophagusGradeType: oesophagusGradeTypeCubit.state.data,
      egdOesophagusOther: OtherOesophagusController.text,
      egdOesophagusBarrets: barretOesophagusCubit.state.data,
      egdStomachHaitus: HiatusHerniaCubit.state.data,
      egdHiatusHerniaSize: SizeCubit.state.data,
      egdHiatusHerniaSizeCm: SizeController.text,
      egdStomachGas: GastritisCubit.state.data,
      egdStomachHPylori: HPyloriCubit.state.data.contains('Positive'),
      egdStomachPolyps: PolypsCubit.state.data,
      egdUlcer: UlcerCubit.state.data,
      egdStomachGrastricUlcer: gastricUlcerCubit.state.data,
      egdStomachAntral: GastritisTypeCubit.state.data.contains('Antral gastritis'),
      egdStomachFundal: GastritisTypeCubit.state.data.contains('Fundal gastritis'),
      egdStomachBody: GastritisTypeCubit.state.data.contains('Body gastritis'),
      egdStomachPang: GastritisTypeCubit.state.data.contains('Pangastritis'),
      egdStomachOthers: OtherStomachController.text,
      egdPreviousSurgery: PostSurgeryCubit.state.data,
      egdPreviousSurgeryTypeLsg: PostSurgeryTypeCubit.state.data.contains('LSG'),
      egdPreviousSurgeryTypeRygbp: PostSurgeryTypeCubit.state.data.contains('RYGBP'),
      egdPreviousSurgeryTypeMgbp: PostSurgeryTypeCubit.state.data.contains('MGBP'),
      egdPreviousSurgeryTypeLagb: PostSurgeryTypeCubit.state.data.contains('LAGB'),
      egdNormal: NormalOesophagusCubit.state.data,
      egdStructure: StrictureCubit.state.data,
      egdTwist: TwistCubit.state.data,
      egdPouchDialation: PouchDilatationCubit.state.data,
      egdDuodenumOthers: OtherDuodenumController.text,
      egdDuodenumNormal: NormalDuodenum.state.data,
      egdDuodenumUlcer: UlcerCubit.state.data,
      egdBile: BileCubit.state.data,
      egdAnastomoticSize: AnastomoticSizeCubit.state.data,
      egdAnastomoticSizeNumber: AnastomoticSizeController.text,
      egdDilatedFundus: PreviousLSGStatusCubit.state.data.contains('Dilated fundus'),
      egdPanDilatation: PreviousLSGStatusCubit.state.data.contains('Pan-dilatation'),
    );

    bool result = await SurgeonRepository(context).addPatientSeventh(model);
    if (result) {
      FocusScope.of(context).requestFocus(FocusNode());
      if (editing) {
        CustomToast.showToastNotification('Editing Patient Completed', color: Colors.red);
      } else {
        CustomToast.showToastNotification('Adding Patient Completed', color: Colors.red);
      }
      Navigator.of(context).pop();
    }
  }

  setEGDResultImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      EGDResultImageCubit.onUpdateData(image);
    }
  }

  chooseFromDate(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.datePicker(
      context: context,
      title: tr(context, "Date"),
      onConfirm: (date) => onConfirmFromDate(date),
    );
  }

  onConfirmFromDate(date) {
    if (date != null) {
      String dateStr = DateFormat("dd-MM-yyyy").format(date);
      insertionDate.text = dateStr;
    }
  }
}
