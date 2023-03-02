import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../general/widgets/loading_widget.dart';
import '../../../models/appointments_response.dart';
import '../../widgets/appointment_item_widget.dart';
import 'received_appointments_data.dart';

class PatientReceivedAppointments extends StatefulWidget {
  const PatientReceivedAppointments({Key? key}) : super(key: key);

  @override
  State<PatientReceivedAppointments> createState() => _PatientReceivedAppointmentsState();
}

class _PatientReceivedAppointmentsState extends State<PatientReceivedAppointments> {
  ReceivedAppointmentsData _receivedAppointmentsData = ReceivedAppointmentsData();

  @override
  void initState() {
    // TODO: implement initState
    _receivedAppointmentsData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BlocBuilder<GenericBloc<AppointmentsResponse?>,
            GenericState<AppointmentsResponse?>>(
          bloc: _receivedAppointmentsData.receivedCubit,
          builder: (context, state) {
            if (state is GenericUpdateState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: MyText(
                      title: '${_receivedAppointmentsData.receivedAppointments?.length} مواعيد',
                      size: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: _receivedAppointmentsData.receivedAppointments!.isNotEmpty
                        ? ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _receivedAppointmentsData.receivedAppointments?.length ?? 0,
                      itemBuilder: (context, index) => AppointmentItemWidget(index: index,
                          appointmentModel: _receivedAppointmentsData.receivedAppointments![index]),
                      separatorBuilder: (_, __) =>
                      const SizedBox(height: 8.0),
                    )
                        : Center(
                      child: MyText(
                        title: 'لا توجد مواعيد قادمة',
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
