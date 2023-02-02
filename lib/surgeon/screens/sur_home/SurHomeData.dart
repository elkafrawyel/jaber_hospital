part of 'SurHomeImports.dart';


class SurHomeData {
  SurHomeData._();
  static final SurHomeData _instance = SurHomeData._();
  factory SurHomeData() => _instance;

  late TextEditingController search;
  late GenericBloc<SurgeonHomeModel?> homeCubit;
  late GenericBloc<bool> loadingHome;



  void init(BuildContext context) {
    this.search = TextEditingController();
    this.loadingHome = GenericBloc<bool>(false);
    this.homeCubit = GenericBloc<SurgeonHomeModel?>(null);

    getHome(context);
  }


  //fetch home
   getHome(BuildContext context) async {
      loadingHome.onUpdateData(true);
    UserModel user = context.read<UserCubit>().state.model;
     SurgeonHomeModel? result = await  SurgeonRepository(context).getHome(doctorId:user.userData?[0].sId??'' );
      homeCubit.onUpdateData(result);
      loadingHome.onUpdateData(false);
  }



}