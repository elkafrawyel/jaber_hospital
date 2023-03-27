part of 'SurMdtDiscussionsWImports.dart';

class BuildBookTimesDialog extends StatefulWidget {
  const BuildBookTimesDialog({Key? key, this.patientId = ""}) : super(key: key);
  final String patientId;

  @override
  State<BuildBookTimesDialog> createState() => _BuildBookTimesDialogState();
}

class _BuildBookTimesDialogState extends State<BuildBookTimesDialog> {
  bool isFirst = true;
  DateTime next = DateTime.now();
  String curMonDay = "";
  String selectedTime = "";
  var monday = 1;
  final DateFormat dateFormat = new DateFormat('dd-MMMM-yyyy');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GeneralAlertDialog(
        alertButtonType: AlertButtonType.noButton,
        alertTextType: AlertContentType.noTitle,
        alertImageType: AlertImageType.noImg,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        customWidget: Container(
          color: Colors.white,
          width: size.width * 0.98,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios_new,
                      size: 20, color: MyColors.primary),
                  MyText(
                    alien: TextAlign.center,
                    title: "Book MDT For PatientName",
                    size: 11,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary,
                  ),
                  InkWell(
                    onTap: () => navigationKey.currentState?.pop(),
                    child: Icon(
                      Icons.close,
                      color: MyColors.primary,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              BlocBuilder<GenericBloc<String>, GenericState<String>>(
                  bloc: SurMdtDiscussionsData().selectBookDateCubit,
                  builder: (context, state) {
                    return Center(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              log("previous");
                              SurMdtDiscussionsData().getPreviousMonday();
                            },
                            child: RotatedBox(
                                quarterTurns: 2,
                                child: Icon(
                                  Icons.forward,
                                  size: 28,
                                  color: MyColors.primary,
                                )),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MyText(
                                  alien: TextAlign.center,
                                  title: "Monday ",
                                  size: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                Expanded(
                                  child: FittedBox(
                                    child: MyText(
                                      alien: TextAlign.center,
                                      title: "(${state.data})",
                                      // title: "(18 August 2022)",
                                      size: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          InkWell(
                              onTap: () {
                                log("isLast icon");
                                SurMdtDiscussionsData().getNextMonday();
                              },
                              child: Icon(
                                Icons.forward,
                                size: 28,
                                color: MyColors.primary,
                              )),
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 16,
              ),
              BlocBuilder<GenericBloc<int>, GenericState<int>>(
                bloc: SurMdtDiscussionsData().selectBookTimeCubit,
                builder: (context, state) {
                  return Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(
                          times.length,
                          (index) => InkWell(
                                onTap: () {
                                  selectedTime = times[index];
                                  SurMdtDiscussionsData()
                                      .selectBookTimeCubit
                                      .onUpdateData(index);
                                },
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: index == state.data
                                          ? MyColors.primary
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: MyText(
                                    title: times[index],
                                    size: 10,
                                    color: index == state.data
                                        ? Colors.white
                                        : Colors.black,
                                  )),
                                ),
                              )));
                },
              ),
              SizedBox(
                height: 16,
              ),
              DefaultButton(
                title: "Confirm Booking",
                onTap: () async{
                  Map<String, dynamic> body = {
                    "mdt_date_time": SurMdtDiscussionsData().selectBookDateCubit.state.data,
                    "mdt_session_duration": times[SurMdtDiscussionsData().selectBookTimeCubit.state.data],
                  };
                  log("bookingBody=> $body");
                  await SurgeonRepository(context).confirmMdtBooking(body, widget.patientId);
                  navigationKey.currentState?.pop();
                  SurMdtDiscussionsData().tabController.animateTo(1);
                },
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              )
            ],
          ),
        ));
  }
}

//list of strings starts with 11:00 AM and encresedby 5 minutes to 11:55 AM

List<String> times = [
  "11:00 AM",
  "11:05 AM",
  "11:10 AM",
  "11:15 AM",
  "11:20 AM",
  "11:25 AM",
  "11:30 AM",
  "11:35 AM",
  "11:40 AM",
  "11:45 AM",
  "11:50 AM",
  "11:55 AM",
];
