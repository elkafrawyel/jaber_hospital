import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../general/constants/MyColors.dart';
import '../../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../../../models/mdt_patient_model.dart';
import 'all_ready_patients_data.dart';
import 'widgets/patient_ready_item.dart';

class AllReadyPatients extends StatefulWidget {
  const AllReadyPatients({Key? key}) : super(key: key);

  @override
  State<AllReadyPatients> createState() => _AllReadyPatientsState();
}

class _AllReadyPatientsState extends State<AllReadyPatients> {
  AllReadyPatientsData allReadyPatientsData = AllReadyPatientsData();

  @override
  void initState() {
    // TODO: implement initState
    allReadyPatientsData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GenericBloc<List<MdtPatientModel>?>,
          GenericState<List<MdtPatientModel>?>>(
        bloc: allReadyPatientsData.readyMdtCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return state.data!.isNotEmpty?Column(
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
                  itemBuilder: (context, index) => PatientReadyWidget(patientModel: state.data![index],),),),
              ],
            ): Center(
              child: MyText(
                title: 'No patients founded',
                size: 12,
                color: MyColors.grey,
              ),
            );
          } else {
            return Expanded(
                child: Center(child: LoadingDialog.showLoadingView()));
          }
        },
      ),
    );
  }
}
