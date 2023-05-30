import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../models/patient_appointment_model.dart';
import '../../patient_appointments/appointments_screen.dart';
import 'visits_item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../models/appointments_response.dart';
import '../home_data.dart';
import 'coming_appointment_widget.dart';

class VisitsHistory extends StatelessWidget {
  const VisitsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
                title: 'تاريخ الزيارات', size: 12, fontWeight: FontWeight.bold),
            InkWell(
              onTap:()=> Nav.navigateTo(AppointmentsScreen(initialIndex: 1), navigatorType: NavigatorType.push),
              child: MyText(
                title: 'عرض الكل',
                size: 10,
                fontWeight: FontWeight.bold,
                color: MyColors.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        BlocBuilder<GenericBloc<List<PatientAppointmentModel>?>, GenericState<List<PatientAppointmentModel>?>>(
          bloc: PatientHomeData().pastVisitsCubit,
          builder: (context, state) {
            if(state is GenericUpdateState){
              if(state.data!.isNotEmpty){
                return  SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      ...List.generate(state.data?.length??0,
                              (index) => VisitsItemWidget(index: index, appointmentModel: state.data![index])),
                    ],
                  ),
                );
              }else{
                return Padding(
                  padding: const EdgeInsets.only(top: 36.0),
                  child: Center(
                    child: MyText(
                      title: 'لا يوجد مواعيد سابقة',
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
