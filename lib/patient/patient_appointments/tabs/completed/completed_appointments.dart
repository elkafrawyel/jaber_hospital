import 'package:flutter/material.dart';

import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../widgets/appointment_item_widget.dart';

class PatientCompletedAppointments extends StatelessWidget {
  const PatientCompletedAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MyText(
                title: '3 مواعيد',
                size: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 10),
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => AppointmentItemWidget(),
                separatorBuilder: (_, __) =>
                const SizedBox(height: 8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
