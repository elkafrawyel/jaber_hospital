import 'package:base_flutter/psychologist/psychologist_patients/tabs/tabsImports.dart';
import 'package:flutter/material.dart';

import '../../general/constants/MyColors.dart';
import '../../general/utilities/utils_functions/Navigator.dart';
import '../../general/widgets/GenScaffold.dart';
import 'PsychologistPatientData.dart';
import 'widgets/PsychologistPatientWImports.dart';

class PsychologistPatientsScreen extends StatefulWidget {
  const PsychologistPatientsScreen({Key? key, this.initialIndex = 0}) : super(key: key);
  final int initialIndex;

  @override
  State<PsychologistPatientsScreen> createState() => _PsychologistPatientsScreenState();
}

class _PsychologistPatientsScreenState extends State<PsychologistPatientsScreen> {
  PsychologistPatientData psychologistPatientData = PsychologistPatientData();

  @override
  void initState() {
    psychologistPatientData.init(context, widget.initialIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        back: true,
        title: "Patients",
        body: DefaultTabController(
          initialIndex: widget.initialIndex,
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildPsychologistPatientTab(),
              Expanded(
                child: TabBarView(
                    physics:const NeverScrollableScrollPhysics(),
                    children: [
                      MyPatient(),
                      AllPatients(),
                    ]),
              ),
            ],
          ),
        ));
  }
}
