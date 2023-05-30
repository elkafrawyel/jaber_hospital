part of 'SurMdtDiscussionsWImports.dart';

class BuildBookTimesDialog extends StatefulWidget {
  const BuildBookTimesDialog({Key? key,required this.patient, this.isReady = false}) : super(key: key);
  final MdtPatientModel patient;
  // final String patientId;
  final bool isReady;

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
  SurMdtDiscussionsData _surMdtDiscussionsData =  SurMdtDiscussionsData();

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
                    title: "Book MDT For ${widget.patient.firstNameEn} ${widget.patient.lastNameEn}",
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
                  bloc: _surMdtDiscussionsData.selectBookDateCubit,
                  builder: (context, state) {
                    return Center(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              log("previous");
                              _surMdtDiscussionsData.getPreviousMonday();
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
                                _surMdtDiscussionsData.getNextMonday();
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
                bloc: _surMdtDiscussionsData.selectBookTimeCubit,
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
                                  _surMdtDiscussionsData.selectBookTimeCubit.onUpdateData(index);
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
                  log("duration=> ${times[_surMdtDiscussionsData.selectBookTimeCubit.state.data]==1?5:10}");
                  Map<String, dynamic> body = {
                    "mdt_date_time": _surMdtDiscussionsData.selectBookDateCubit.state.data,
                    "mdt_session_duration": times[_surMdtDiscussionsData.selectBookTimeCubit.state.data]==1?5:10,
                  };
                  log("bookingBody=> $body");
                  if(widget.isReady){
                    await ReadyMdtData().updateReadyMdtStatus(context, "booked", widget.patient.id??"");
                    await SurgeonRepository(context).confirmMdtBooking(body, widget.patient.id??"");
                    navigationKey.currentState?.pop();
                    SurMdtDiscussionsData().tabController.animateTo(1);
                  } else{
                    /// for change date
                    await SurgeonRepository(context).confirmMdtBooking(body, widget.patient.id??"");
                    navigationKey.currentState?.pop();
                    await BookedMdtData().fetchBookedPatients(context, "booked");
                  }
                },
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              )
            ],
          ),
        ));
  }
}

//list of strings starts with 11:00 AM and encreased by 5 minutes to 11:55 AM
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
