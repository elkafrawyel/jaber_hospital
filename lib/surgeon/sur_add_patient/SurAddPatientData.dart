part of 'SurAddPatientImports.dart';

class SurAddPatientData {

  SurAddPatientData._();
  static SurAddPatientData surAddPatientData = SurAddPatientData._();
  factory SurAddPatientData() => surAddPatientData;


  late PageController pageController;
  late GenericBloc<int> pageCubit;
  late TextEditingController patientName ;
  late TextEditingController patientId ;
  late TextEditingController patientFileNumber ;



  void initScreen(BuildContext context) {
    pageController = PageController();
    pageCubit = GenericBloc(1);
    patientName = TextEditingController();
    patientId = TextEditingController();
    patientFileNumber = TextEditingController();
    onPageChanged();
  }


  void nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
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
        return Container();
      case 3:
        return Container();
      case 4:
        return Container();
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