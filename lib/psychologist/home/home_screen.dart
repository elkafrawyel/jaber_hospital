import 'package:base_flutter/psychologist/home/widgets/BuildHomeSearchPatient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../res/res.dart';
import 'PsychologistHomeData.dart';
import 'widgets/BuildOverallProgress.dart';
import 'widgets/BuildPsychologistHomePatients.dart';
import 'widgets/psychologist_appBar.dart';
import 'widgets/psychologist_drawer.dart';
import 'widgets/upcoming_appointments.dart';

class PsychologistHomeScreen extends StatefulWidget {
  const PsychologistHomeScreen({Key? key}) : super(key: key);

  @override
  State<PsychologistHomeScreen> createState() => _PsychologistHomeScreenState();
}

class _PsychologistHomeScreenState extends State<PsychologistHomeScreen> {

  @override
  void initState() {
    PsychologistHomeData().init(context);
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: BuildPsychologistHomeAppBar(),
        drawer: PsychologistHomeDrawer(),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
          children: [
            BuildPsychologyHomeSearchPatient(),
            const SizedBox(height: 16.0),
            UpcomingAppointments(),
            const SizedBox(height: 16.0),
            BuildPsychologistHomePatients(),
            const SizedBox(height: 16.0),
            PsychologistOverallProgress(),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: MyText(
                  title: 'Psychological Sessions Statistics',
                  size: 12,
                  fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(Res.surBarChartSvg, fit: BoxFit.fill,),
            const SizedBox(height: 28.0),
          ],
        ),
      );
    }
}
