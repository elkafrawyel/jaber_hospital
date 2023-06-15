import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../surgeon/models/patient_details_model.dart';
import '../../models/patient_appointment_model.dart';
import '../home_data.dart';
import 'operation_widget.dart';

class OperationsDate extends StatelessWidget {
  const OperationsDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(title: 'تاريخ العملية', size: 12, fontWeight: FontWeight.bold),
          ],
        ),
        BlocBuilder<GenericBloc<PatientDetailsModel?>, GenericState<PatientDetailsModel?>>(
          bloc: PatientHomeData().patInfoCubit,
          builder: (context, state) {
            if(state is GenericUpdateState){
              if(state.data!.patient?.operationDate!=""){
                return OperationWidget(patientInfo: state.data);
              }else{
                return Padding(
                  padding: const EdgeInsets.only(top: 36.0),
                  child: Center(
                    child: MyText(
                      title: 'لم يتم تحديد موعدالعملية بعد',
                      size: 13,
                      color: MyColors.black,
                    ),
                  ),
                );
              }
            }else{
              return  Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: MyColors.greyWhite,
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  height: MediaQuery.of(context).size.height / 6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyColors.white,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
