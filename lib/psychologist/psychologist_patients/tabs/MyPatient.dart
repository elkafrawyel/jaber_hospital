part of 'tabsImports.dart';

class MyPatient extends StatefulWidget {
  const MyPatient({Key? key}) : super(key: key);

  @override
  State<MyPatient> createState() => _MyPatientState();
}

class _MyPatientState extends State<MyPatient> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildPsychologistPatientType(),
        BlocBuilder<GenericBloc<List<PatientModel>>,
            GenericState<List<PatientModel>>>(
          bloc: PsychologistPatientData().patientsCubit,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyText(
                title: '${state.data.length} Patients',
                size: 13,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        BlocBuilder<GenericBloc<int>, GenericState<int>>(
            bloc: PsychologistPatientData().patientType,
            builder: (context, state) {
              if (state.data == 0) {
                return BuildPreOpView();
              } else {
                return BuildPrePostView();
              }
            }),
      ],
    );
  }
}
