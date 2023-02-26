import 'package:flutter/material.dart';

import '../../general/widgets/GenScaffold.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GeneralScaffold(
        back: true,
        title: "تفاصيل الميعاد",
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
