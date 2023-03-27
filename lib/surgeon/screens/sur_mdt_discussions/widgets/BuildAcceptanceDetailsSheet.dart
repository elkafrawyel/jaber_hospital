part of 'SurMdtDiscussionsWImports.dart';

List<String> acceptanceDetails = [
  "Laparoscopic sleeve gastrectomy (LSG)",
  "Laparoscopic RYGBP",
  "Laparoscopic mini-gastric bypass (MGBP)",
  "Laparoscopic adjustable gastric band (LAGB)",
  "SADI-L",
  "Intragastric Ballon",
  // "Other",
];

class BuildAcceptanceDetailsSheet extends StatelessWidget {
  const BuildAcceptanceDetailsSheet({Key? key, required this.patientId, required this.index}) : super(key: key);
  final String patientId;
  final int index;

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
      child: BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: SurMdtDiscussionsData().selectAcceptanceReasonsCubit,
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            shrinkWrap: true,
            children: [
              MyText(
                alien: TextAlign.center,
                title: "Acceptance Details",
                size: 12,
                fontWeight: FontWeight.bold,
                color: MyColors.primary,
              ),
              ...List.generate(
                acceptanceDetails.length,
                (index) => RadioListTile(
                  value: index,
                  groupValue: state.data,
                  title: MyText(
                    title: acceptanceDetails[index],
                    size: 12,
                    color: MyColors.black,
                  ),
                  onChanged: (val) => SurMdtDiscussionsData().selectAcceptanceReasonsCubit.onUpdateData(val!),
                ),
              ),
              DefaultButton(
                title: "Confirm",
                onTap: () {
                  navigationKey.currentState!.pop();
                  Map<String, dynamic> body = {
                    "mdt_results": "accept",
                    "patient_id": patientId,
                  };
                  MdtAdminData().sentMdtPatientRes(context, body, index);
                  if(state.data==6) {
                    showDialog(context: context, builder: (context) => BuildReasonDialog(hint: "Other...",headerTitle: "Other Details",));
                  }else{
                    SurMdtDiscussionsData().decisionTypeCubit.onUpdateData(1);
                  }
                },
                color: MyColors.primary,
                margin: const EdgeInsets.symmetric(
                  horizontal: 80,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
