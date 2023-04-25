part of 'SurPatientDetailsImports.dart';

class SurPatientDetailsData {
  //  single tone class
  static SurPatientDetailsData _instance = new SurPatientDetailsData._();

  factory SurPatientDetailsData() => _instance;

  SurPatientDetailsData._();

  late TextEditingController appointmentDate;
  late TextEditingController clinicName;
  late TextEditingController notes;
  late GenericBloc<String?> dateBloc;
  DateTime startDate = DateTime.now();
  late GenericBloc<PatientDetailsModel?> patientDetailsCubit;
  late GlobalKey<FormState> formKey;

  void init(BuildContext context, {required String patientId}) {
    appointmentDate = TextEditingController();
    clinicName = TextEditingController();
    notes = TextEditingController();
    patientDetailsCubit = GenericBloc<PatientDetailsModel?>(null);
    formKey = GlobalKey<FormState>();
    dateBloc = GenericBloc(null);
    getPatientDetails(context, patientId);
  }

  void getPatientDetails(BuildContext context, String patientId) async {
    PatientDetailsModel? data = await SurgeonRepository(context).getPatientDetails(patientId);
    patientDetailsCubit.onUpdateData(data);
  }

  String date(String date) {
    print('==========================>$date');
    DateTime? dateTime = DateTime.tryParse(date);
    if (dateTime == null) {
      return '';
    }
    String returnDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    return returnDate;
  }

  String time(String date) {
    DateTime dateTime = DateTime.parse(date);
    String returnDate = "${dateTime.hour}:${dateTime.minute} ${dateTime.hour > 12 ? "PM" : "AM"}";
    return returnDate;
  }

  onConfirmFromDate(date) {
    if (date != null) {
      startDate = date;
      String dateStr = DateFormat("dd-MM-yyyy hh:mm a").format(date);
      dateBloc.onUpdateData(dateStr);
      print(dateBloc.state.data);
    }
  }

  chooseFromDate(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: 250,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: DateTime.now(),
          maximumDate: DateTime(2050),
          initialDateTime: DateTime.now(),
          onDateTimeChanged: (date) => onConfirmFromDate(date),
        ),
      ),
    );
  }

  void addAppointment(BuildContext context, String patientId) async {
    if (formKey.currentState!.validate()) {
      bool res = await SurgeonRepository(context).addAppointment(
        patientId,
        startDate.toIso8601String(),
        notes.text,
        // clinicName.text,
      );
      if (res) {
        navigationKey.currentState!.pop();
        navigationKey.currentState!.pop();
        navigationKey.currentState!.push(MaterialPageRoute(builder: (_) => SurPatientDetails(patientId: patientId)));
      }
    }
  }

  void downloadInfo(BuildContext context) async {
    bool? result = await SurgeonRepository(context).downloadPatientInfo(patientDetailsCubit.state.data!.patient!.id!);
  }

  Future<bool> archivePatient(BuildContext context) async {
    bool? result = await SurgeonRepository(context).archivePatient(patientDetailsCubit.state.data!.patient!.id!);
    return result;
  }
}
