part of 'SurMdtDiscussionsImports.dart';

class SurMdtDiscussionsData {
  SurMdtDiscussionsData._();

  static final SurMdtDiscussionsData _instance = SurMdtDiscussionsData._();

  factory SurMdtDiscussionsData() => _instance;

  late GenericBloc<int> decisionTypeCubit;
  late GenericBloc<int> mdtDurationCubit;
  late GenericBloc<int> selectAcceptanceReasonsCubit;
  late GenericBloc<DateTime> selectBookDateCubit;

  late GenericBloc<String> selectBookTimeCubit;

  late GenericBloc<int> selectMDTResultCubit;

  late GenericBloc<List<String>> dayTimesCubit;

  // late GenericBloc<List<TimeSlot>> dayTimesCubit  ;
  late TabController tabController;
  late TextEditingController reason;

  DateTime next = DateTime.now();
  final DateFormat dateFormat = new DateFormat('dd-MMMM-yyyy');
  String curMonDay = "";
  var monday = 1;
  List<String> dayAvailableTimes = [];

  void init(BuildContext context, SingleTickerProviderStateMixin ticker) {
    reason = TextEditingController();
    this.decisionTypeCubit = GenericBloc(0);
    selectAcceptanceReasonsCubit = GenericBloc(0);
    this.mdtDurationCubit = GenericBloc(0);
    this.selectBookTimeCubit = GenericBloc("");
    this.selectMDTResultCubit = GenericBloc(-1);
    this.dayTimesCubit = GenericBloc<List<String>>([]);
    this.tabController = TabController(length: 3, vsync: ticker);
    setNextMonday(context);
  }

  void setNextMonday(BuildContext context) async {
    while (next.weekday != monday) {
      next = next.add(new Duration(days: 1));
    }
    log('Recent monday $next');
    // log("formattedDay==> ${next.day} - ${next.month} - ${next.year}");
    curMonDay = dateFormat.format(next);
    log("formattedDay==> $curMonDay");
    this.selectBookDateCubit = GenericBloc(next);
    await fetchMdtAvailableSlots(context, next.toIso8601String());
  }

  void navigateToTimeDialog(int? val, BuildContext context) {
    log("mdtDuration==> $val");
    SurMdtDiscussionsData().mdtDurationCubit.onUpdateData(val!);
    navigationKey.currentState?.pop();
  }

  void onSelectResult(int? val, BuildContext context, String patientId, int index) {
    SurMdtDiscussionsData().selectMDTResultCubit.onUpdateData(val!);
    navigationKey.currentState?.pop();
    if (selectMDTResultCubit.state.data == 1) {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => BuildAcceptanceDetailsSheet(patientId: patientId, index: index),
      );
    } else if (selectMDTResultCubit.state.data == 2) {
      showDialog(
        context: context,
        builder: (context) => BuildReasonDialog(
          patientId: patientId,
          index: index,
          hint: "Refusal Reason",
          headerTitle: "Refusal Reason",
        ),
      );
    } else if (selectMDTResultCubit.state.data == 3) {
      showDialog(
        context: context,
        builder: (context) => BuildReasonDialog(
          patientId: patientId,
          index: index,
          hint: "Rediscussion Reason",
          headerTitle: "Re-Discussion Reason",
        ),
      );
    }
  }

  void getNextMonday() {
    next = next.add(Duration(days: 7));
    log("next==> ${next.toIso8601String()}");
    curMonDay = dateFormat.format(next);
    // log("formattedDay==> $curMonDay");
    selectBookDateCubit.onUpdateData(next);
  }

  void getPreviousMonday() {
    DateTime nextMonday = DateTime.now();
    while (nextMonday.weekday != monday) {
      nextMonday = nextMonday.add(new Duration(days: 1));
    }
    // log('Recent monday $next');
    if (next.difference(nextMonday).inDays > 0) {
      next = next.subtract(Duration(days: 7));
      // log("next==> $next");
      curMonDay = dateFormat.format(next);
      // log("formattedDay==> $curMonDay");
      selectBookDateCubit.onUpdateData(next);
    }
  }

  Future sendMdtPatResult(BuildContext context, Map<String, dynamic> body) async {
    await SurgeonRepository(context).mdtPatientResult(body);
  }

  Future<void> fetchMdtAvailableSlots(BuildContext context, String isoDate) async {
    dayTimesCubit.onUpdateToInitState([]);
    TimeSlotsModelResponse? result = await SurgeonRepository(context).fetchMdtAvailableSlots(isoDate);
    log("Times==> ${result?.times?.length}");
    List<TimeSlot> times = result?.times ?? [];
    if (times.isEmpty) {
      if (mdtDurationCubit.state.data == 5) {
        dayAvailableTimes = timesOf5Minutes;
      } else {
        dayAvailableTimes = timesOf10Minutes;
      }
    } else {
      /// filter times
      dayAvailableTimes = filterDayTimes(times);
    }
    log("dayAvailableTimes==> $dayAvailableTimes");
    dayTimesCubit.onUpdateData(dayAvailableTimes);
  }

  List<String> filterDayTimes(List<TimeSlot> times) {
    List<String> takenTimes = [];
    times.forEach((element) {
      takenTimes.add(DateFormat("hh:mm a").format(DateTime.parse(element.mdtDateTime ?? "")));
    });
    log("takenTimes==> $takenTimes");
    if (mdtDurationCubit.state.data == 5) {
      takenTimes.forEach((element) {
        timesOf5Minutes.removeWhere((time) => element == time);
      });
      return timesOf5Minutes;
    } else {
      takenTimes.forEach((element) {
        timesOf10Minutes.removeWhere((time) => element == time);
      });
      return timesOf10Minutes;
    }
  }

//list of strings starts with 11:00 AM and encreased by 5 minutes to 11:55 AM
  List<String> timesOf5Minutes = [
    "11:00 AM",
    "11:05 AM",
    "11:10 AM",
    "11:15 AM",
    "11:20 AM",
    "11:25 AM",
    "11:30 AM",
    "11:35 AM",
    "11:40 AM",
    "11:45 AM",
    "11:50 AM",
    "11:55 AM",
  ];

  List<String> timesOf10Minutes = [
    "11:00 AM",
    "11:10 AM",
    "11:20 AM",
    "11:30 AM",
    "11:40 AM",
    "11:50 AM",
  ];
}
