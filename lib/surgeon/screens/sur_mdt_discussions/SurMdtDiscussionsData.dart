part of'SurMdtDiscussionsImports.dart';

class SurMdtDiscussionsData {
  SurMdtDiscussionsData._();
  static final SurMdtDiscussionsData _instance = SurMdtDiscussionsData._();
  factory SurMdtDiscussionsData() => _instance;


  late GenericBloc<int> decisionTypeCubit;
  late GenericBloc<int> mdtDurationCubit;
  late GenericBloc<int> selectAcceptanceReasonsCubit;
  late GenericBloc<int> selectBookTimeCubit  ;
  late GenericBloc<int> selectMDTResultCubit  ;
  late TabController  tabController;
  late TextEditingController reason ;



  void init (SingleTickerProviderStateMixin ticker){
    reason = TextEditingController();
    this.decisionTypeCubit = GenericBloc(0);
    selectAcceptanceReasonsCubit = GenericBloc(0);
    this.mdtDurationCubit = GenericBloc(0);
    this.selectBookTimeCubit = GenericBloc(0);
    this.selectMDTResultCubit = GenericBloc(-1);
    this.tabController = TabController(length: 3, vsync: ticker);
  }


  void navigateToTimeDialog(int?val , BuildContext context){
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

}

