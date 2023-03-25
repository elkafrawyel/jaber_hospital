import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../general/widgets/GenScaffold.dart';
import '../../../../general/widgets/loading_widget.dart';
import '../../../models/mdt_patients_response.dart';
import '../SurMdtDiscussionsImports.dart';
import '../widgets/SurMdtDiscussionsWImports.dart';
import 'mdt_admin_data.dart';


class MDTAdminScreen extends StatefulWidget {
  const MDTAdminScreen({Key? key}) : super(key: key);

  @override
  State<MDTAdminScreen> createState() => _MDTAdminState();
}

class _MDTAdminState extends State<MDTAdminScreen> with SingleTickerProviderStateMixin{
  MdtAdminData mdtAdminData = MdtAdminData();
  SurMdtDiscussionsData surMdtDiscussionsData = SurMdtDiscussionsData();

  @override
  void initState() {
    // TODO: implement initState
    mdtAdminData.init(context);
    surMdtDiscussionsData.init(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      back: true, title: "MDT (Admin)",
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Color(0xfff2f2f2),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    CachedImage(
                      url: 'https://picsum.photos/122',
                      height: 60,
                      width: 60,
                      borderRadius: BorderRadius.circular(10),
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  title: 'FADY HANY',
                                  size: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Container(
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 6, vertical: 3),
                              //   decoration: BoxDecoration(
                              //     color: Color(0xffaff7c3),
                              //     borderRadius:
                              //     BorderRadius.circular(20),
                              //   ),
                              //   child: MyText(
                              //     title: 'Ready',
                              //     size: 9,
                              //     color: Colors.green,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                            ],
                          ),
                          Row(
                            children: [
                              MyText(
                                title: 'Surgeon : ',
                                size: 11,
                                color: MyColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              MyText(
                                title: "Samer hany",
                                size: 11,
                                color: MyColors.grey,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MyText(
                                title: 'Dietitian : ',
                                size: 11,
                                color: MyColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              MyText(
                                title: "Ahmed jamil",
                                size: 11,
                                color: MyColors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    MyText(
                      title: 'MDT Date : ',
                      size: 11,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Expanded(
                      child: MyText(
                        title: "16 August 2023",
                        size: 11,
                        color: MyColors.primary,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              BuildBookTimesDialog(),
                        );
                      },
                      child: MyText(
                        title: '(Change)',
                        size: 11,
                        decoration: TextDecoration.underline,
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              DefaultButton(
                width: 160,
                margin: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 5),
                title: "Enter Result",
                onTap: () {
                  SurMdtDiscussionsData().selectMDTResultCubit.onUpdateData(0);
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => BuildMDTResultSheet());
                },
              ),
            ],
          ),
        ),),
      // body: BlocBuilder<GenericBloc<MdtPatientsResponse?>,
      //     GenericState<MdtPatientsResponse?>>(
      //   bloc: mdtAdminData.mdtAdminCubit,
      //   builder: (context, state) {
      //     if (state is GenericUpdateState) {
      //       return Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      //             child: MyText(
      //               title: '${state.data?.patients?.length} Patients',
      //               size: 13,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           Expanded(child: ListView.builder(
      //             itemCount: 4,
      //             // itemCount: state.data?.patients?.length,
      //             itemBuilder: (context, index) => Container(
      //               margin: const EdgeInsets.symmetric(
      //                   horizontal: 20, vertical: 10),
      //               padding: const EdgeInsets.symmetric(vertical: 10),
      //               decoration: BoxDecoration(
      //                   color: Color(0xfff2f2f2),
      //                   borderRadius: BorderRadius.circular(15)),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Padding(
      //                     padding: const EdgeInsets.symmetric(horizontal: 20),
      //                     child: Row(
      //                       children: [
      //                         CachedImage(
      //                           url: 'https://picsum.photos/122',
      //                           height: 60,
      //                           width: 60,
      //                           borderRadius: BorderRadius.circular(10),
      //                           fit: BoxFit.cover,
      //                         ),
      //                         const SizedBox(width: 10),
      //                         Expanded(
      //                           child: Column(
      //                             crossAxisAlignment:
      //                             CrossAxisAlignment.start,
      //                             children: [
      //                               Row(
      //                                 children: [
      //                                   Expanded(
      //                                     child: MyText(
      //                                       title: 'FADY HANY',
      //                                       size: 12,
      //                                       fontWeight: FontWeight.bold,
      //                                     ),
      //                                   ),
      //                                   // Container(
      //                                   //   padding: const EdgeInsets.symmetric(
      //                                   //       horizontal: 6, vertical: 3),
      //                                   //   decoration: BoxDecoration(
      //                                   //     color: Color(0xffaff7c3),
      //                                   //     borderRadius:
      //                                   //     BorderRadius.circular(20),
      //                                   //   ),
      //                                   //   child: MyText(
      //                                   //     title: 'Ready',
      //                                   //     size: 9,
      //                                   //     color: Colors.green,
      //                                   //     fontWeight: FontWeight.bold,
      //                                   //   ),
      //                                   // ),
      //                                 ],
      //                               ),
      //                               Row(
      //                                 children: [
      //                                   MyText(
      //                                     title: 'Surgeon : ',
      //                                     size: 11,
      //                                     color: MyColors.black,
      //                                     fontWeight: FontWeight.bold,
      //                                   ),
      //                                   MyText(
      //                                     title: "Samer hany",
      //                                     size: 11,
      //                                     color: MyColors.grey,
      //                                   ),
      //                                 ],
      //                               ),
      //                               Row(
      //                                 children: [
      //                                   MyText(
      //                                     title: 'Dietitian : ',
      //                                     size: 11,
      //                                     color: MyColors.black,
      //                                     fontWeight: FontWeight.bold,
      //                                   ),
      //                                   MyText(
      //                                     title: "Ahmed jamil",
      //                                     size: 11,
      //                                     color: MyColors.grey,
      //                                   ),
      //                                 ],
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                   const Divider(),
      //                   Padding(
      //                     padding: const EdgeInsets.symmetric(horizontal: 20),
      //                     child: Row(
      //                       children: [
      //                         MyText(
      //                           title: 'MDT Date : ',
      //                           size: 11,
      //                           color: MyColors.black,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                         Expanded(
      //                           child: MyText(
      //                             title: "16 August 2023",
      //                             size: 11,
      //                             color: MyColors.primary,
      //                           ),
      //                         ),
      //                         InkWell(
      //                           onTap: () {
      //                             showDialog(
      //                               context: context,
      //                               builder: (context) =>
      //                                   BuildBookTimesDialog(),
      //                             );
      //                           },
      //                           child: MyText(
      //                             title: '(Change)',
      //                             size: 11,
      //                             decoration: TextDecoration.underline,
      //                             color: MyColors.primary,
      //                             fontWeight: FontWeight.bold,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                   DefaultButton(
      //                     width: 160,
      //                     margin: const EdgeInsets.symmetric(
      //                         horizontal: 16, vertical: 5),
      //                     title: "Enter Result",
      //                     onTap: () {
      //                       showModalBottomSheet(
      //                           context: context,
      //                           backgroundColor: Colors.transparent,
      //                           builder: (context) => BuildMDTResultSheet());
      //                     },
      //                   ),
      //                 ],
      //               ),
      //             ),),),
      //         ],
      //       );
      //     } else {
      //       return LoadingWidget();
      //     }
      //   },
      // ),
    );
  }

  DateTime nextDay(DateTime date){
    print("date==> $date");
    date.add(Duration(days: 7));
    print("next==> ${date.add(Duration(days: 7))}");
    // DateTime next = date.next(DateTime.monday);
    return date;
  }
}
