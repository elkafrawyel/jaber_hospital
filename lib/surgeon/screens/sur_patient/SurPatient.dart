part of 'SurPatientImports.dart';

class SurPatient extends StatefulWidget {
  final int index;
  const SurPatient({Key? key, required this.index}) : super(key: key);

  @override
  State<SurPatient> createState() => _SurPatientState();
}

class _SurPatientState extends State<SurPatient> {
  @override
  void initState() {
    SurPatientData().init(widget.index);
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
                onPressed: () =>Nav.navigateTo(SurAddPatient(), navigatorType: NavigatorType.push),
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
          initialIndex: widget.index,
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildSurPatientTab(),
              BuildSurPatientType(),
              Expanded(
                child: TabBarView(children: [
                  MyPatient(),
                  AllPatients(),
                ]),
              ),
            ],
          ),
        ));
  }
}

