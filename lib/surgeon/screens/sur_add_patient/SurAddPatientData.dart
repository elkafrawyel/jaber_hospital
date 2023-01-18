part of 'SurAddPatientImports.dart';

class SurAddPatientData {

  SurAddPatientData._();
  static SurAddPatientData surAddPatientData = SurAddPatientData._();
  factory SurAddPatientData() => surAddPatientData;


  late PageController pageController;
  late GenericBloc<int> pageCubit;
  /// first page
  late TextEditingController patientName ;
  late TextEditingController patientId ;
  late TextEditingController patientFileNumber ;
  late TextEditingController patientMobile ;
  late TextEditingController patientAge ;
  late TextEditingController patientWeight ;
  late TextEditingController patientHeight ;
  late TextEditingController BMI ;
  /// second page
  late TextEditingController otherNotes ;
  late GenericBloc<bool> dmSelectionCubit;
  late GenericBloc<int> dmTypeSelectionCubit;
  late GenericBloc<String> diagnosisTypesCubit;
  late GenericBloc<String> cardiacDiseaseCubit;
  late GenericBloc<String> respiratoryDiseaseCubit;
  List<String> get diagnosisTypes => AddPatientDTOInfo.diagnosisTypes;
  List<String> get cardiacDiseaseTypes => AddPatientDTOInfo.cardiacDisease;
  List<String> get respiratoryDiseaseTypes => AddPatientDTOInfo.respiratoryDisease;
  /// third page
  late GenericBloc<bool> refluxSelectionCubit;
  late GenericBloc<String> medicationsCubit;
  late GenericBloc<String> smokingHabitsCubit;
  List<String> get medications => AddPatientDTOInfo.Medications;
  List<String> get smokingHabits => AddPatientDTOInfo.smokingHabits;
  /// fourth page
  late GenericBloc<bool> historyBallonSelectionCubit;
  late GenericBloc<bool> historyWeightLossSelectionCubit;
  late TextEditingController weightLossFrom ;
  late TextEditingController weightLossTo ;
  late TextEditingController removalDate ;
  late TextEditingController insertionDate ;
  late TextEditingController outcomeResult ;
  late TextEditingController outcomeDate ;
  late GenericBloc<String> medicationTypeCubit;
  List<String> get medicationTypes => AddPatientDTOInfo.medicationTypes;
  /// fifth page
  late GenericBloc<bool> ProceduresSelectionCubit;
  late GenericBloc<String> surgeryTypeCubit;
  late TextEditingController proceduresOutcomeResultCubit;
  late TextEditingController proceduresOutcomeDateCubit;
  List<String> get surgeryTypes => AddPatientDTOInfo.surgeryTypes;






  void initScreen(BuildContext context) {
    pageController = PageController();
    pageCubit = GenericBloc(1);
    patientName = TextEditingController();
    patientId = TextEditingController();
    patientFileNumber = TextEditingController();
    patientMobile = TextEditingController();
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
    onPageChanged();
  }



  void nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
    pageCubit.onUpdateData(pageCubit.state.data + 1);
  }


  void onPageChanged() {
    pageController.addListener(() {
      int nextPage = pageController.page!.round();
        pageCubit.onUpdateData(nextPage + 1);
    });
  }


  //change pages widgets by index
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
        return Container();
      case 6:
        return AddPatientFirstPage();
      default:
        return AddPatientFirstPage();
    }
  }



  void dispose() {
    pageController.dispose();
  }

}