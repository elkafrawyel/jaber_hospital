part of 'PsychologistAddPatientImports.dart';

class PsychologistAddPatient extends StatefulWidget {
  const PsychologistAddPatient({Key? key}) : super(key: key);

  @override
  State<PsychologistAddPatient> createState() => _SurAddPatientState();
}

class _SurAddPatientState extends State<PsychologistAddPatient> {
  @override
  void initState() {
    PsychologistAddPatientData().initScreen(context);
    super.initState();
  }

  @override
  void dispose() {
    PsychologistAddPatientData().dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        // appBar: BuildAddPatientAppBar(editing: ,),
        body: Column(
          children: [
            BlocBuilder<GenericBloc<int>, GenericState<int>>(
              bloc: PsychologistAddPatientData().pageCubit,
              builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: LinearProgressIndicator(
                    backgroundColor: MyColors.black,
                    minHeight: 10,
                    value: state.data / 7,
                    color: MyColors.primary,
                  ),
                ),
              );
              },
            ),
            Expanded(
                child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: PsychologistAddPatientData().pageController,
              itemBuilder: (context, index) {
                return PsychologistAddPatientData().buildAddPatientPage(index);
              },
              itemCount: 7,
            )),
          ],
        ),
      ),
    );
  }
}
