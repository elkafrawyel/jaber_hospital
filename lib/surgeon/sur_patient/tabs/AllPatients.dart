part of 'tabsImports.dart';

class AllPatients extends StatelessWidget {
  const AllPatients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MyText(
            title: '16 Patients',
            size: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocBuilder<GenericBloc<int>, GenericState<int>>(
            bloc: SurPatientData().patientType,
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
