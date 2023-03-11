import 'package:base_flutter/psychologist/psychologist_patients/tabs/tabsImports.dart';
import 'package:flutter/material.dart';

import '../../general/constants/MyColors.dart';
import '../../general/utilities/utils_functions/Navigator.dart';
import '../../general/widgets/GenScaffold.dart';
import 'PsychologistPatientData.dart';
import 'widgets/PsychologistPatientWImports.dart';

class PsychologistPatientsScreen extends StatefulWidget {
  const PsychologistPatientsScreen({Key? key}) : super(key: key);

  @override
  State<PsychologistPatientsScreen> createState() => _PsychologistPatientsScreenState();
}

class _PsychologistPatientsScreenState extends State<PsychologistPatientsScreen> {
  @override
  void initState() {
    PsychologistPatientData().init(context,0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        back: true,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: MyColors.primary, size: 30),
              ),
              IconButton(
                onPressed: () {
                  // Nav.navigateTo(SurAddPatient(), navigatorType: NavigatorType.push);
                },
                icon: Container(
                    decoration: BoxDecoration(
                        color: MyColors.primary,
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              ),
            ],
          )
        ],
        title: "Patients",
        body: DefaultTabController(
          initialIndex: 0,
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
