part of 'SurPatientImports.dart';

class SurPatient extends StatefulWidget {
  final int index ;
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
                onPressed: () {},
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
              BlocBuilder<GenericBloc<int>, GenericState<int>>(
                bloc: SurPatientData().selectedTabCubit,
                builder: (context, state) {
                  return Container(
                    height: 60,
                    child: TabBar(
                        onTap: (index) {
                          SurPatientData().selectedTabCubit.onUpdateData(index);
                        },
                        indicatorColor: MyColors.primary,
                        labelColor: MyColors.primary,
                        indicatorWeight: 3,
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelStyle: WidgetUtils.textStyle
                            .copyWith(color: MyColors.grey),
                        labelStyle: WidgetUtils.textStyle
                            .copyWith(color: MyColors.primary),
                        unselectedLabelColor: MyColors.grey,
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  Res.imagesPatientDrawer,
                                  scale: 2.8,
                                  color: state.data == 0
                                      ? MyColors.primary
                                      : MyColors.grey,
                                ),
                                const SizedBox(width: 5),
                                Text("My Patients"),
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  Res.imagesAllPatient,
                                  scale: 2.8,
                                  color: state.data == 1
                                      ? MyColors.primary
                                      : MyColors.grey,
                                ),
                                const SizedBox(width: 5),
                                Text("All Patients"),
                              ],
                            ),
                          ),
                        ]),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: BlocBuilder<GenericBloc<int>, GenericState<int>>(
                  bloc: SurPatientData().patientType,
                  builder: (context, state) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            SurPatientData().patientType.onUpdateData(0);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 7),
                            decoration: BoxDecoration(
                              color: state.data == 0 ? Color(0xffd3e0f6) :Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: state.data == 0
                                    ? MyColors.primary
                                    : MyColors.grey,
                                width: state.data == 0 ? 2 : 1,
                              ),
                            ),
                            child: MyText(
                              title: 'Pre-Op',
                              size: 12,
                              color: state.data == 0
                                  ? MyColors.primary
                                  : MyColors.grey,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            SurPatientData().patientType.onUpdateData(1);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 7),
                            decoration: BoxDecoration(
                              color: state.data == 1 ? Color(0xffd3e0f6) :Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: state.data == 1
                                    ? MyColors.primary
                                    : MyColors.grey,
                                width: state.data == 1 ? 2 : 1,
                              ),
                            ),
                            child: MyText(
                              title: 'Post-Op',
                              size: 12,
                              color: state.data == 1
                                  ? MyColors.primary
                                  : MyColors.grey,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
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
