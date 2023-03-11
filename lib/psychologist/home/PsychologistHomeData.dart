import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/blocks/user_cubit/user_cubit.dart';
import '../../general/models/UserModel.dart';
import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../surgeon/models/surgeon_home_model.dart';
import '../resources/PsychologistRepoImports.dart';

class PsychologistHomeData {
  PsychologistHomeData._();
  static final PsychologistHomeData _instance = PsychologistHomeData._();
  factory PsychologistHomeData() => _instance;

  late TextEditingController search;
  late GenericBloc<SurgeonHomeModel?> homeCubit;
  late GenericBloc<bool> loadingHome;
  late GenericBloc<bool> mdtDiscussionsSelect;
  late GenericBloc<bool> orderSelect;



  void init(BuildContext context) {
    this.search = TextEditingController();
    this.loadingHome = GenericBloc<bool>(false);
    this.homeCubit = GenericBloc<SurgeonHomeModel?>(null);
    this.mdtDiscussionsSelect = GenericBloc<bool>(false);
    this.orderSelect = GenericBloc<bool>(false);

    getHome(context);
  }


  //fetch home
   getHome(BuildContext context) async {
      loadingHome.onUpdateData(true);
    UserModel user = context.read<UserCubit>().state.model;
     SurgeonHomeModel? result = await  PsychologistRepository(context).getHome(doctorId:user.userData?[0].sId??'' );
      homeCubit.onUpdateData(result);
      loadingHome.onUpdateData(false);
  }



}