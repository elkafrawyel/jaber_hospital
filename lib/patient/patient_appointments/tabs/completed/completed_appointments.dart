import 'package:flutter/material.dart';

import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../widgets/appointment_item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/widgets/loading_widget.dart';
import '../../../models/appointments_response.dart';
import 'completed_appointments_data.dart';

class PatientCompletedAppointments extends StatefulWidget {
  const PatientCompletedAppointments({Key? key}) : super(key: key);

  @override
  State<PatientCompletedAppointments> createState() => _PatientCompletedAppointmentsState();
}

class _PatientCompletedAppointmentsState extends State<PatientCompletedAppointments> {
  CompletedAppointmentsData _completedAppointmentsData = CompletedAppointmentsData();

  @override
  void initState() {
    // TODO: implement initState
    _completedAppointmentsData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BlocBuilder<GenericBloc<AppointmentsResponse?>,
            GenericState<AppointmentsResponse?>>(
          bloc: _completedAppointmentsData.pastCubit,
          builder: (context, state) {
            if (state is GenericUpdateState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: MyText(
                      title: '${_completedAppointmentsData.pastAppointments?.length} مواعيد',
                      size: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: _completedAppointmentsData.pastAppointments!.isNotEmpty
                        ? ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _completedAppointmentsData.pastAppointments?.length ?? 0,
                      itemBuilder: (context, index) => AppointmentItemWidget(index: index,
                          appointmentModel: _completedAppointmentsData.pastAppointments![index]),
                      separatorBuilder: (_, __) =>
                      const SizedBox(height: 12.0),
                    )
                        : Center(
                      child: MyText(
                        title: 'لا توجد مواعيد سابقة',
                        size: 14,
                        color: MyColors.grey,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
