import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../models/appointments_response.dart';
import '../../patient_appointments/appointments_screen.dart';
import '../home_data.dart';
import 'coming_appointment_widget.dart';

class ComingAppointments extends StatelessWidget {
  const ComingAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                  title: 'المواعيد القادمة',
                  size: 12,
                  fontWeight: FontWeight.bold),
              InkWell(
                onTap:()=> Nav.navigateTo(AppointmentsScreen(initialIndex: 0), navigatorType: NavigatorType.push),
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
          Container(
            height: 124,
            child: BlocBuilder<GenericBloc<AppointmentsResponse?>,
                GenericState<AppointmentsResponse?>>(
              bloc: PatientHomeData().homeCubit,
              builder: (context, state) {
                if (state is GenericUpdateState) {
                  if (state.data!.appointments!.isNotEmpty) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.data?.appointments?.length ?? 0,
                      itemBuilder: (context, index) => ComingAppointmentWidget(
                        index: index,
                        appointmentModel: state.data!.appointments![index],
                      ),
                    );
                  } else {
                    return Center(
                      child: MyText(
                        title: 'لا يوجد مواعيد قادمة',
                        size: 13,
                        color: MyColors.black,
                      ),
                    );
                  }
                } else {
                  return Shimmer.fromColors(
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
          ),
        ],
      ),
    );
  }
}
