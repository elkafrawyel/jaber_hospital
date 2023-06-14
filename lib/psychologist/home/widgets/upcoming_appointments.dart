import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../surgeon/models/surgeon_home_model.dart';
import '../../../surgeon/screens/sur_appointments/sur_appointments_imports.dart';
import '../PsychologistHomeData.dart';
import 'upcoming_appointment_widget.dart';

class UpcomingAppointments extends StatelessWidget {
  const UpcomingAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Appointments>? list = PsychologistHomeData().homeCubit.state.data?.appointments;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(title: 'Upcoming Appointments', size: 12, fontWeight: FontWeight.bold),
            InkWell(
              onTap: () => Nav.navigateTo(SurAppointments(), navigatorType: NavigatorType.push),
              child: MyText(
                title: 'See All',
                size: 10,
                fontWeight: FontWeight.bold,
                color: MyColors.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        Container(
          height: 120,
          child: BlocBuilder<GenericBloc<SurgeonHomeModel?>, GenericState<SurgeonHomeModel?>>(
            bloc: PsychologistHomeData().homeCubit,
            builder: (context, state) {
              if (state is GenericUpdateState) {
                if (state.data!.appointments!.isNotEmpty) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.data?.appointments?.length ?? 0,
                    itemBuilder: (context, index) =>
                        UpComingAppointmentWidget(index: index, appointment: state.data!.appointments![index]),
                  );
                } else {
                  return Center(
                    child: MyText(
                      title: 'No Upcoming Appointments',
                      size: 12,
                      color: MyColors.grey,
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
    );
  }
}
