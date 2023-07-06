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

  onConfirmFromDate(date) {
    if (date != null) {
      startDate = date;
      String dateStr = DateFormat("E ,d MMM y, hh:mm a").format(date);
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

      await createNotification(context, date: startDate, patientId: patientId);
      SurHomeData().getHome(context);
      if (res) {
        navigationKey.currentState!.pop();
        navigationKey.currentState!.pop();
        navigationKey.currentState!.push(MaterialPageRoute(builder: (_) => SurPatientDetails(patientId: patientId)));
      }
    }
  }

  Future<void> createNotification(
    BuildContext context, {
    dynamic patientId,
    required DateTime date,
  }) async {
    Map<String, dynamic> body = {
      "status": true,
      "notifcation_patient_ar": "تم تحديد موعد جديد لك مع دكتور ",
      "patient_id": patientId ?? '',
      "doctor_id": context.read<UserCubit>().state.model.userData?.first.sId,
      "created_date": date.toIso8601String(),
      "is_read": false,
    };
    UpdateConsentResponse data = await GenericHttp<UpdateConsentResponse>(context).callApi(
      name: ApiNames.createNotification,
      returnType: ReturnType.Model,
      methodType: MethodType.Post,
      jsonBody: body,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => UpdateConsentResponse.fromJson(json),
    );
    if (data.success ?? false) {
      CustomToast.showSimpleToast(msg: data.message?.messageEn ?? "");
    } else {
      CustomToast.showSimpleToast(msg: data.message?.messageEn ?? "");
    }
  }

  void downloadInfo(BuildContext context) async {
    bool? result = await SurgeonRepository(context).downloadPatientInfo(patientDetailsCubit.state.data!.patient!.id!);
  }

  Future<bool> archivePatient(BuildContext context) async {
    bool? result = await SurgeonRepository(context).archivePatient(patientDetailsCubit.state.data!.patient!.id!);
    return result;
  }

  DateTime? operationDate;

  bookOperation(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoTheme(
        data: CupertinoThemeData(
          brightness: Brightness.light,
          textTheme: CupertinoTextThemeData(primaryColor: Theme.of(context).primaryColor),
          // scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          primaryContrastingColor: Theme.of(context).primaryColor,
        ),
        child: CupertinoActionSheet(
          cancelButton: CupertinoButton(
            onPressed: () async {
              if (operationDate == null) {
                Navigator.pop(context);
              }
              final Map<String, dynamic> body = {
                'operation_date': operationDate!.toIso8601String(),
              };
              dynamic data = await GenericHttp<PatientDetailsModel>(context).callApi(
                name: ApiNames.addOperationDate + '?patient_id=${patientDetailsCubit.state.data!.patient!.id!}',
                returnType: ReturnType.Type,
                methodType: MethodType.Put,
                returnDataFun: (data) => data,
                jsonBody: body,
                showLoader: true,
              );
              if (data != null) {
                Navigator.pop(context);
                CustomToast.showSnackBar(context, data["message"]["message_en"]);
                getPatientDetails(context, patientDetailsCubit.state.data!.patient!.id!);
              }
            },
            color: Theme.of(context).scaffoldBackgroundColor,
            child: MyText(
              title: "Confirm Date",
              size: 14,
              color: MyColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                minimumDate: DateTime.now(),
                maximumDate: DateTime(2050),
                onDateTimeChanged: (DateTime picked) {
                  operationDate = picked;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
