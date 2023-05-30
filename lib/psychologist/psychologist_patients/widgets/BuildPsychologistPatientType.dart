part of 'PsychologistPatientWImports.dart';

class BuildPsychologistPatientType extends StatelessWidget {
  const BuildPsychologistPatientType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: PsychologistPatientData().patientType,
        builder: (context, state) {
          return Row(
            children: [
              InkWell(
                onTap: () {
                  PsychologistPatientData().patientType.onUpdateData(0) ;
                  PsychologistPatientData().fetchPatient(context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 5, vertical: 10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 7),
                  decoration: BoxDecoration(
                    color: state.data == 0
                        ? Color(0xffd3e0f6)
                        : Colors.white,
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
                  PsychologistPatientData().patientType.onUpdateData(1) ;
                  PsychologistPatientData().fetchPatient(context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 5, vertical: 10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 7),
                  decoration: BoxDecoration(
                    color: state.data == 1
                        ? Color(0xffd3e0f6)
                        : Colors.white,
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
    );
  }
}
