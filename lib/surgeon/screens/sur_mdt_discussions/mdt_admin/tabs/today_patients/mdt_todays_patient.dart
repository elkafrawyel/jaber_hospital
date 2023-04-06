import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../general/constants/MyColors.dart';
import '../../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../../../general/widgets/GenScaffold.dart';
import '../../../../../../general/widgets/loading_widget.dart';
import '../../../../../models/mdt_patient_model.dart';
import '../../../SurMdtDiscussionsImports.dart';
import '../../../widgets/SurMdtDiscussionsWImports.dart';
import 'mdt_todays_patients_data.dart';
import 'widgets/admin_patient_widget.dart';


class MdtTodaysPatients extends StatefulWidget {
  const MdtTodaysPatients({Key? key}) : super(key: key);

  @override
  State<MdtTodaysPatients> createState() => _MDTAdminState();
}

class _MDTAdminState extends State<MdtTodaysPatients> with SingleTickerProviderStateMixin{
  MdtTodaysPatientsData mdtAdminData = MdtTodaysPatientsData();
  SurMdtDiscussionsData surMdtDiscussionsData = SurMdtDiscussionsData();

  @override
  void initState() {
    // TODO: implement initState
    mdtAdminData.init(context);
    surMdtDiscussionsData.init(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      back: true, title: "MDT (Admin)",
      body: BlocBuilder<GenericBloc<List<MdtPatientModel>?>,
          GenericState<List<MdtPatientModel>?>>(
        bloc: mdtAdminData.mdtAdminCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: MyText(
                    title: '${state.data?.length} Patients',
                    size: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: ListView.builder(
                  itemCount: state.data?.length,
                  itemBuilder: (context, index) => AdminPatientWidget(patientModel: state.data![index],index: index),),),
              ],
            );
          } else {
            return LoadingWidget();
          }
        },
      ),
    );
  }

  DateTime nextDay(DateTime date){
    print("date==> $date");
    date.add(Duration(days: 7));
    print("next==> ${date.add(Duration(days: 7))}");
    // DateTime next = date.next(DateTime.monday);
    return date;
  }
}
