part of 'SurPatientWImports.dart';

class BuildSurPatientType extends StatelessWidget {
  const BuildSurPatientType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: SurPatientData().patientType,
        builder: (context, state) {
          return Row(
            children: [
              InkWell(
                onTap: () =>
                    SurPatientData().patientType.onUpdateData(0),
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
                onTap: () =>
                    SurPatientData().patientType.onUpdateData(1),
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
