import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../models/appointment_model.dart';
import '../../sur_appointments_imports.dart';
import '../../widgets/SurFollowUpsTabBarWImports.dart';

class UpcomingAppointments extends StatefulWidget {
  const UpcomingAppointments({Key? key}) : super(key: key);

  @override
  State<UpcomingAppointments> createState() => _UpcomingAppointmentsState();
}

class _UpcomingAppointmentsState extends State<UpcomingAppointments> {
  AppointmentsData _upcomingAppointmentsData = AppointmentsData();

  @override
  void initState() {
    _upcomingAppointmentsData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GenericBloc<List<AppointmentModel>?>, GenericState<List<AppointmentModel>?>>(
        bloc: _upcomingAppointmentsData.upcomingCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return state.data!.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: MyText(
                          title: '${state.data?.length} Appointments',
                          size: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.data?.length,
                          itemBuilder: (context, index) => BuildSurFollowUpItem(
                            appointmentModel: state.data![index],
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: MyText(
                      title: 'No patients founded',
                      size: 12,
                      color: MyColors.grey,
                    ),
                  );
          } else {
            return Expanded(
              child: Center(
                child: LoadingDialog.showLoadingView(),
              ),
            );
          }
        },
      ),
    );
  }
}
