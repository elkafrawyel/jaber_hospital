part of 'SurAddPatientImports.dart';

class SurAddPatient extends StatefulWidget {
  const SurAddPatient({Key? key}) : super(key: key);

  @override
  State<SurAddPatient> createState() => _SurAddPatientState();
}

class _SurAddPatientState extends State<SurAddPatient> {
  @override
  void initState() {
    SurAddPatientData().initScreen(context);
    super.initState();
  }

  @override
  void dispose() {
    SurAddPatientData().dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final initWidth = MediaQuery.of(context).size.width / 7;
    return Scaffold(
      appBar: BuildAddPatientAppBar(),
      body: Column(
        children: [
          BlocBuilder<GenericBloc<int>, GenericState<int>>(
            bloc: SurAddPatientData().pageCubit,
            builder: (context, state) {
            return  Padding(
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
            controller: SurAddPatientData().pageController,
            itemBuilder: (context, index) {
              return SurAddPatientData().buildAddPatientPage(index);
            },
            itemCount: 7,
          )),
        ],
      ),
    );
  }
}
