import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../general/MyApp.dart';
import '../../../../../../general/constants/MyColors.dart';
import '../../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../../../general/widgets/GeneralAlertDialog.dart';
import '../../../../../models/mdt_patient_model.dart';
import '../../../../sur_search/debouncer.dart';
import '../../../SurMdtDiscussionsImports.dart';

class BuildBookTimesDialog extends StatefulWidget {
  const BuildBookTimesDialog({Key? key,required this.patient, this.isReady = false, this.pickedDurationIndex}) : super(key: key);
  final MdtPatientModel patient;
  // final String patientId;
  final bool? pickedDurationIndex;
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

  final _debouncer = Debouncer(milliseconds: 500);
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GeneralAlertDialog(
        alertButtonType: AlertButtonType.noButton,
        alertTextType: AlertContentType.noTitle,
        alertImageType: AlertImageType.noImg,
        // padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
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
                              _debouncer.run(() async{
                                // put the code that you want to debounce
                                // example: calling an API, adding a BLoC event
                                log('selectBookDate==> ${_surMdtDiscussionsData.selectBookDateCubit.state.data}');
                                await _surMdtDiscussionsData.fetchMdtAvailableSlots(context,
                                    _surMdtDiscussionsData.selectBookDateCubit.state.data.toIso8601String());
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
                                      title: "(${DateFormat("dd/MM/yyyy").format(_surMdtDiscussionsData.selectBookDateCubit.state.data)})",
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
                              onTap: (){
                                log("isLast icon");
                                _surMdtDiscussionsData.getNextMonday();
                                _debouncer.run(() async{
                                  // put the code that you want to debounce
                                  // example: calling an API, adding a BLoC event
                                  log('selectBookDate==> ${_surMdtDiscussionsData.selectBookDateCubit.state.data}');
                                  await _surMdtDiscussionsData.fetchMdtAvailableSlots(context,
                                      _surMdtDiscussionsData.selectBookDateCubit.state.data.toIso8601String());
                                });
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
              // BlocBuilder<GenericBloc<List<TimeSlot>>, GenericState<List<TimeSlot>>>(
              //   bloc: _surMdtDiscussionsData.dayTimesCubit,
              //   builder: (context, state) {
              //     if(state.data.isNotEmpty){
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(vertical: 10.0),
              //         child: Column(children: [
              //           Wrap(
              //               direction: Axis.horizontal,
              //               alignment: WrapAlignment.center,
              //               spacing: 10,
              //               runSpacing: 10,
              //               children: List.generate(
              //                   state.data.length,
              //                       (index) => InkWell(
              //                     onTap: () {
              //                       setState(() {
              //                         selectedTime = state.data[index].sId??"";
              //                       });
              //                       _surMdtDiscussionsData.selectBookTimeCubit.onUpdateData(selectedTime);
              //                     },
              //                     child: Container(
              //                       height: 30,
              //                       width: 80,
              //                       decoration: BoxDecoration(
              //                           color: selectedTime == state.data[index].sId
              //                               ? MyColors.primary
              //                               : Colors.grey,
              //                           borderRadius: BorderRadius.circular(10)),
              //                       child: Center(
              //                           child: MyText(
              //                             title: DateFormat("hh:mm a").format(DateTime.parse(state.data[index].mdtDateTime??"")),
              //                             size: 10,
              //                             color: selectedTime == state.data[index].sId
              //                                 ? Colors.white
              //                                 : Colors.black,
              //                           )),
              //                     ),
              //                   ))),
              //           SizedBox(
              //             height: 16,
              //           ),
              //           DefaultButton(
              //             title: "Confirm Booking",
              //             onTap: () async{
              //               log("duration=> ${widget.pickedDurationIndex==1?5:10}");
              //               log("selectedTime==> $selectedTime");
              //               Map<String, dynamic> body = {
              //                 "mdt_date_time": _surMdtDiscussionsData.selectBookDateCubit.state.data,
              //                 "mdt_session_duration": widget.pickedDurationIndex==1?5:10,
              //               };
              //               log("bookingBody=> $body");
              //               if(widget.isReady){
              //                 await ReadyMdtData().updateReadyMdtStatus(context, "booked", widget.patient.id??"");
              //                 await SurgeonRepository(context).confirmMdtBooking(body, widget.patient.id??"");
              //                 navigationKey.currentState?.pop();
              //                 SurMdtDiscussionsData().tabController.animateTo(1);
              //               } else{
              //                 /// for change date
              //                 await SurgeonRepository(context).confirmMdtBooking(body, widget.patient.id??"");
              //                 navigationKey.currentState?.pop();
              //                 await BookedMdtData().fetchBookedPatients(context, "booked");
              //               }
              //             },
              //             margin:
              //             const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              //           )
              //         ],),
              //       );
              //     } else{
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(vertical: 48.0),
              //         child: Center(
              //           child: MyText(
              //             title: "No times available",
              //             size: 11,
              //             color: Colors.black,
              //           ),
              //         ),
              //       );
              //     }
              //   },
              // ),
            ],
          ),
        ));
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
