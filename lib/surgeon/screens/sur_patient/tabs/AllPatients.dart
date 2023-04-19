part of 'tabsImports.dart';

class AllPatients extends StatefulWidget {
  const AllPatients({Key? key}) : super(key: key);

  @override
  State<AllPatients> createState() => _AllPatientsState();
}

class _AllPatientsState extends State<AllPatients> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildSurPatientType(),
        BlocBuilder<GenericBloc<int>, GenericState<int>>(
          bloc: SurPatientData().totalResultCount,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyText(
                title: '${state.data} Patients',
                size: 13,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        BlocBuilder<GenericBloc<int>, GenericState<int>>(
          bloc: SurPatientData().patientType,
          builder: (context, state) {
            if (state.data == 0) {
              return BuildPreOpView();
            } else {
              return BuildPrePostView();
            }
          },
        ),
      ],
    );
  }
}
