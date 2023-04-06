part of'../../sur_appointments_imports.dart';

class AppointmentsData{
  AppointmentsData._();
  static final AppointmentsData _instance = AppointmentsData._();
  factory AppointmentsData() => _instance;

  late GenericBloc<List<AppointmentModel>?> upcomingCubit;
  late GenericBloc<bool> loadingHome;
  List<AppointmentModel>? upcomingAppointments = [];

  void init(BuildContext context) {
    this.upcomingCubit = GenericBloc<List<AppointmentModel>?>(null);
    fetchUpcomingAppointments(context);
  }

  Future<void> fetchUpcomingAppointments(BuildContext context) async {
    AppointmentsResponse? result = await SurgeonRepository(context).fetchSurAppointments(true);
    log("patients=> ${result?.data?.length}");
    upcomingAppointments = result?.data??[];
    upcomingCubit.onUpdateData(upcomingAppointments);
  }
}