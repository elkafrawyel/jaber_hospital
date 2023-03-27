part of 'SurMdtDiscussionsWImports.dart';


class BuildPatientMDTDurationSheet extends StatelessWidget {
  const BuildPatientMDTDurationSheet({
    Key? key, required this.patientId
  }) : super(key: key);
  final String patientId;

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
                onChanged: (val) => SurMdtDiscussionsData().navigateToTimeDialog(val, context),
                // onChanged: (val) => SurMdtDiscussionsData().navigateToTimeDialog(val, context),
              ),
              const  Divider(),
              RadioListTile(
                value: 2,
                groupValue: state.data,
                title: Text("10 Minutes"),
                onChanged: (val) => SurMdtDiscussionsData().navigateToTimeDialog(val, context),
                // onChanged: (val) => SurMdtDiscussionsData().navigateToTimeDialog(val, context),
              ),
            ],
          );
        },
      ),
    );
  }
}
