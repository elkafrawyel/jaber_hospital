part of 'SurMdtDiscussionsWImports.dart';


class BuildPatientMDTDurationSheet extends StatelessWidget {
  const BuildPatientMDTDurationSheet({
    Key? key, required this.patient,
    this.onlyChangeDate = false,
  }) : super(key: key);
  final MdtPatientModel patient;
  final bool onlyChangeDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: BlocBuilder<GenericBloc<int>,
          GenericState<int>>(
        bloc: SurMdtDiscussionsData().mdtDurationCubit,
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            shrinkWrap: true,
            children: [
              MyText(
                alien: TextAlign.center,
                title: "Patient MDT Duration",
                size: 12,
                fontWeight: FontWeight.bold,
                color: MyColors.primary,
              ),
              RadioListTile(
                value: 1,
                groupValue: state.data,
                title: Text("5 Minutes"),
                onChanged: (val){
                  log("pickedVal=> $val");
                  SurMdtDiscussionsData().mdtDurationCubit.onUpdateData(5);
                  navigationKey.currentState!.pop();
                  SurMdtDiscussionsData().setNextMonday(context);
                  showDialog(
                    context: context,
                    builder: (context) => BuildBookTimesDialog(patient: patient, onlyChangeReadyDate: onlyChangeDate),
                  );
                },
                // onChanged: (val) => SurMdtDiscussionsData().navigateToTimeDialog(val, context),
              ),
              const  Divider(),
              RadioListTile(
                value: 2,
                groupValue: state.data,
                title: Text("10 Minutes"),
                onChanged: (val){
                  log("pickedVal=> $val");
                  SurMdtDiscussionsData().mdtDurationCubit.onUpdateData(10);
                  navigationKey.currentState!.pop();
                  SurMdtDiscussionsData().setNextMonday(context);
                  showDialog(
                    context: context,
                    builder: (context) =>
                        BuildBookTimesDialog(patient: patient, onlyChangeReadyDate: onlyChangeDate),
                  );
                },
                // onChanged: (val) => SurMdtDiscussionsData().navigateToTimeDialog(val, context),
              ),
            ],
          );
        },
      ),
    );
  }
}
