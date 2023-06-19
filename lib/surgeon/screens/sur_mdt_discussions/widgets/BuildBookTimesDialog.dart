part of 'SurMdtDiscussionsWImports.dart';

class BuildBookTimesDialog extends StatefulWidget {
  const BuildBookTimesDialog(
      {Key? key, required this.patient, this.onlyChangeReadyDate = false, this.pickedDurationIndex})
      : super(key: key);
  final MdtPatientModel patient;

  // final String patientId;
  final bool? pickedDurationIndex;
  final bool onlyChangeReadyDate;

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
  SurMdtDiscussionsData _surMdtDiscussionsData = SurMdtDiscussionsData();

  final _debouncer = Debouncer(milliseconds: 500);
  int counter = 1;

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
        width: size.width * 0.99,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios_new, size: 20, color: MyColors.primary),
                Expanded(
                  child: MyText(
                    alien: TextAlign.center,
                    title: "Book MDT For ${widget.patient.firstNameEn} ${widget.patient.lastNameEn}",
                    size: 11,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
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
            BlocBuilder<GenericBloc<DateTime>, GenericState<DateTime>>(
                bloc: _surMdtDiscussionsData.selectBookDateCubit,
                builder: (context, state) {
                  return Center(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            log("previous");
                            _surMdtDiscussionsData.getPreviousMonday();
                            _debouncer.run(() async {
                              selectedTime = "";
                              await _surMdtDiscussionsData.fetchMdtAvailableSlots(
                                context,
                                _surMdtDiscussionsData.selectBookDateCubit.state.data.toIso8601String(),
                              );
                            });
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
                          width: 12.0,
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
                                    title:
                                        "(${DateFormat("dd/MM/yyyy").format(_surMdtDiscussionsData.selectBookDateCubit.state.data)})",
                                    size: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        InkWell(
                          onTap: () {
                            log("isLast icon");
                            _surMdtDiscussionsData.getNextMonday();
                            _debouncer.run(() async {
                              selectedTime = "";
                              await _surMdtDiscussionsData.fetchMdtAvailableSlots(
                                context,
                                _surMdtDiscussionsData.selectBookDateCubit.state.data.toIso8601String(),
                              );
                            });
                          },
                          child: Icon(
                            Icons.forward,
                            size: 28,
                            color: MyColors.primary,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            SizedBox(
              height: 16,
            ),
            BlocBuilder<GenericBloc<List<String>>, GenericState<List<String>>>(
              bloc: _surMdtDiscussionsData.dayTimesCubit,
              builder: (context, state) {
                if (state is GenericUpdateState) {
                  if (state.data.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            spacing: 10,
                            runSpacing: 10,
                            children: List.generate(
                              state.data.length,
                              (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedTime = state.data[index];
                                  });
                                  _surMdtDiscussionsData.selectBookTimeCubit.onUpdateData(selectedTime);
                                },
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: selectedTime == state.data[index] ? MyColors.primary : Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: MyText(
                                      title: state.data[index],
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          DefaultButton(
                            title: "Confirm Booking",
                            onTap: () async {
                              if (selectedTime == "") {
                                CustomToast.showToastNotification("please, select mdt time first");
                                return;
                              }
                              log("selectedTime==> $selectedTime");
                              Map<String, dynamic> body = {
                                "mdt_time": selectedTime,
                                "mdt_date_time":
                                    _surMdtDiscussionsData.selectBookDateCubit.state.data.toIso8601String(),
                                "mdt_session_duration": _surMdtDiscussionsData.mdtDurationCubit.state.data.toString(),
                              };
                              log("bookingBody=> $body");

                              await SurgeonRepository(context).confirmMdtBooking(body, widget.patient.id ?? "");
                              if (!widget.onlyChangeReadyDate) {
                                await ReadyMdtData().updateReadyMdtStatus(context, "booked", widget.patient.id ?? "");
                                navigationKey.currentState?.pop();
                                SurMdtDiscussionsData().tabController.animateTo(1);
                              } else {
                                /// for change date
                                log("not ready, this for change date only");
                                navigationKey.currentState?.pop();
                                await AllReadyPatientsData().fetchMdtReadyPatients(context);
                              }
                            },
                            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 48.0),
                      child: Center(
                        child: MyText(
                          title: "No times available",
                          size: 14,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }
                } else {
                  return Center(child: LoadingDialog.showLoadingView());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

//list of strings starts with 11:00 AM and encreased by 5 minutes to 11:55 AM
// List<String> times = [
//   "11:00 AM",
//   "11:05 AM",
//   "11:10 AM",
//   "11:15 AM",
//   "11:20 AM",
//   "11:25 AM",
//   "11:30 AM",
//   "11:35 AM",
//   "11:40 AM",
//   "11:45 AM",
//   "11:50 AM",
//   "11:55 AM",
// ];
