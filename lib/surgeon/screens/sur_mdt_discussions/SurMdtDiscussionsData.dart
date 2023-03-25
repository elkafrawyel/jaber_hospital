part of'SurMdtDiscussionsImports.dart';

class SurMdtDiscussionsData {
  SurMdtDiscussionsData._();
  static final SurMdtDiscussionsData _instance = SurMdtDiscussionsData._();
  factory SurMdtDiscussionsData() => _instance;

  late GenericBloc<int> decisionTypeCubit;
  late GenericBloc<int> mdtDurationCubit;
  late GenericBloc<int> selectAcceptanceReasonsCubit;
  late GenericBloc<String> selectBookDateCubit  ;
  late GenericBloc<int> selectBookTimeCubit  ;
  late GenericBloc<int> selectMDTResultCubit  ;
  late TabController  tabController;
  late TextEditingController reason ;
  DateTime next = DateTime.now();
  final DateFormat dateFormat = new DateFormat('dd-MMMM-yyyy');
  String curMonDay = "";
  var monday=1;

  void init (SingleTickerProviderStateMixin ticker){
    reason = TextEditingController();
    this.decisionTypeCubit = GenericBloc(0);
    selectAcceptanceReasonsCubit = GenericBloc(0);
    this.mdtDurationCubit = GenericBloc(0);
    this.selectBookTimeCubit = GenericBloc(0);
    this.selectMDTResultCubit = GenericBloc(-1);
    this.tabController = TabController(length: 3, vsync: ticker);
    while(next.weekday!=monday)
    {
      next =next.add(new Duration(days: 1));
    }
    log('Recent monday $next');
    // log("formattedDay==> ${next.day} - ${next.month} - ${next.year}");
    curMonDay = dateFormat.format(next??DateTime.now());
    log("formattedDay==> $curMonDay");
    this.selectBookDateCubit = GenericBloc(curMonDay);
  }

  void navigateToTimeDialog(int? val , BuildContext context){
    log("mdtDuration==> $val");
    SurMdtDiscussionsData().mdtDurationCubit.onUpdateData(val!);
    navigationKey.currentState?.pop();
    showDialog(
        context: context,
        builder: (context) => BuildBookTimesDialog(),
    );
  }

  void onSelectResult(int?val , BuildContext context){
    SurMdtDiscussionsData().selectMDTResultCubit.onUpdateData(val!);
    navigationKey.currentState?.pop();
    if(selectMDTResultCubit.state.data==1){
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => BuildAcceptanceDetailsSheet(),
      );
    }else if(selectMDTResultCubit.state.data==2){
      showDialog(context: context, builder: (context) => BuildReasonDialog(hint: "Refusal Reason",headerTitle: "Refusal Reason",));

    }else  if(selectMDTResultCubit.state.data==3){
      showDialog(context: context, builder: (context) => BuildReasonDialog(hint: "Rediscussion Reason",headerTitle: "Re-Discussion Reason",));
    }
  }

  void getNextMonday(){
    next = next.add(Duration(days: 7));
    log("next==> $next");
    curMonDay = dateFormat.format(next);
    log("formattedDay==> $curMonDay");
    selectBookDateCubit.onUpdateData(curMonDay);
  }

  void getPreviousMonday(){
    DateTime nextMonday = DateTime.now();
      while(nextMonday.weekday!=monday)
      {
        nextMonday =nextMonday.add(new Duration(days: 1));
      }
      log('Recent monday $next');
    if(next.difference(nextMonday).inDays > 0){
      next = next.subtract(Duration(days: 7));
      log("next==> $next");
      curMonDay = dateFormat.format(next);
      log("formattedDay==> $curMonDay");
      selectBookDateCubit.onUpdateData(curMonDay);
    }
  }
}

