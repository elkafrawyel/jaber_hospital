import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/models/company_model.dart';
import '../../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../../general/widgets/GenScaffold.dart';
import '../../../../general/widgets/app_drop_menu.dart';
import '../../../../general/widgets/loading_widget.dart';
import '../../../models/company_instruments_response.dart';
import '../../../models/instrument_order_model.dart';
import '../../../models/patient_details_model.dart';
import '../models/handles_instrument_model.dart';
import 'request_instruments_data.dart';
import 'widgets/radio_check_item.dart';

class RequestInstrumentsScreen extends StatefulWidget {
  const RequestInstrumentsScreen({Key? key, required this.patientModel}) : super(key: key);
  final PatientDetailsModel patientModel;

  @override
  State<RequestInstrumentsScreen> createState() => _RequestInstrumentsScreenState();
}

class _RequestInstrumentsScreenState extends State<RequestInstrumentsScreen> {
  RequestInstrumentsData requestInstrumentsData= RequestInstrumentsData();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneController= TextEditingController();
  late TextEditingController dateController= TextEditingController();
  List<HandlesModel> handles = [
    HandlesModel(headerTitle: "Handles", handles: ["Short", "Long", "Signia Powered Handle"]),
  ];
  List<String> items2 = ["Reloads", "Trocars",];
  String? selectedHandle;

  @override
  void initState() {
    // TODO: implement initState
    requestInstrumentsData.init(context);
    nameController = TextEditingController(text: "${widget.patientModel.patient?.fNameEn} "
        "${widget.patientModel.patient?.lNameEn}");
    phoneController = TextEditingController(text: widget.patientModel.patient?.telephone1??"");
    dateController = TextEditingController(text: widget.patientModel.patient?.mdtDateTime??"");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: GeneralScaffold(
          back: true,
          title: "Request Instruments",
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  title: 'Patient Name',
                  size: 10,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                  fieldTypes: FieldTypes.disable,
                  fillColor:  MyColors.textFields,
                  hint: "Patient Name",
                  controller: nameController,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.none,
                  type: TextInputType.text,
                  validate: (value) => value!.validateEmpty(context),
                ),
                MyText(
                  title: 'Patient Mobile Number',
                  size: 10,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  hintColor:
                  Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                  fieldTypes: FieldTypes.disable,
                  fillColor: MyColors.textFields,
                  hint: "Patient Mobile Number",
                  controller: phoneController,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.text,
                  validate: (value) => value!.validateEmpty(context),
                ),
                MyText(
                  title: 'Date',
                  size: 10,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  hintColor:
                  Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                  fieldTypes: FieldTypes.clickable,
                  fillColor: MyColors.textFields,
                  hint: "Date",
                  controller: dateController,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.text,
                  onTab: (){
                    log("pick date...");

                  },
                  validate: (value) => value!.validateEmpty(context),
                ),
                MyText(
                  title: 'Company',
                  size: 10,
                  fontWeight: FontWeight.bold,
                ),
                BlocBuilder<GenericBloc<List<CompanyId>?>,
                    GenericState<List<CompanyId>?>>(
                  bloc: requestInstrumentsData.companiesCubit,
                  builder: (context, state) {
                    if (state is GenericUpdateState) {
                      return AppDropMenu<CompanyId>(
                        hint: "Company",
                        items: requestInstrumentsData.companies,
                        expanded: true,
                        selectedItem: requestInstrumentsData.selectedCompany,
                        onChanged: (value) {
                          CompanyId company = value as CompanyId;
                          log("val=> ${company.sId}");
                          log("val=> ${company.companyNameEn}");
                          requestInstrumentsData.selectedCompany = company;
                          setState(() {});
                          requestInstrumentsData.fetchCompanyInstruments(context, company.sId??"");
                          // controller.changeSelectedInterest(category);
                        },
                      );
                    } else {
                      return SizedBox(
                        height: 56,
                        child: Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: MyColors.greyWhite,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                            height: MediaQuery.of(context).size.height / 6,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: MyColors.white,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 8.0),
                MyText(
                  title: 'Company Instruments:',
                  size: 10,
                  fontWeight: FontWeight.bold,
                ),

                ExpansionPanelList(
                  elevation: 3,
                  // Controlling the expansion behavior
                  expansionCallback: (index, isExpanded) {
                    handles[0].isExpanded= !isExpanded;
                    setState(() {});
                  },
                  animationDuration: const Duration(milliseconds: 500),
                  children: handles.map((item) => ExpansionPanel(
                      canTapOnHeader: true,
                      backgroundColor: Colors.grey.shade200,
                      // backgroundColor: item.isExpanded == true ? AppTheme.hoverColor.withOpacity(0.2) : Colors.white,
                      headerBuilder: (_, isExpanded) => Container(
                          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                          child: Text(handles[0].headerTitle??"",
                            style: const TextStyle(fontSize: 16),
                          )),
                      body: Column(
                        children: [
                          ListTile(
                            horizontalTitleGap: 1.0,
                            contentPadding: EdgeInsets.zero,
                            onTap: (){
                              setState(() {
                                selectedHandle = "Short";
                              });
                            },
                            title: Row(
                              children: [
                                Radio(
                                    activeColor: MyColors.primary,
                                    value: "Short",
                                    groupValue: selectedHandle,
                                    onChanged: (index) {
                                      setState(() {
                                        selectedHandle = "Short";
                                      });
                                      log("selectedHandle==> $selectedHandle");
                                    }),
                                Expanded(
                                  child: MyText(
                                    title: "Short",
                                    size: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ListTile(
                            horizontalTitleGap: 1.0,
                            contentPadding: EdgeInsets.zero,
                            onTap: (){
                              setState(() {
                                selectedHandle = "Long";
                              });
                            },
                            title: Row(
                              children: [
                                Radio(
                                    activeColor: MyColors.primary,
                                    value: "Long",
                                    groupValue: selectedHandle,
                                    onChanged: (index) {
                                      setState(() {
                                        selectedHandle = "Long";
                                      });
                                      log("selectedHandle==> $selectedHandle");
                                    }),
                                Expanded(
                                  child: MyText(
                                    title: "Long",
                                    size: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ListTile(
                            horizontalTitleGap: 1.0,
                            contentPadding: EdgeInsets.zero,
                            onTap: (){
                              setState(() {
                                selectedHandle = "Signia Powered Handle";
                              });
                            },
                            title: Row(
                              children: [
                                Radio(
                                    activeColor: MyColors.primary,
                                    value: "Signia Powered Handle",
                                    groupValue: selectedHandle,
                                    onChanged: (index) {
                                      setState(() {
                                        selectedHandle = "Signia Powered Handle";
                                      });
                                      log("selectedHandle==> $selectedHandle");
                                    }),
                                Expanded(
                                  child: MyText(
                                    title: "Signia Powered Handle",
                                    size: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      isExpanded: handles[0].isExpanded,
                    ),
                  ).toList(),
                ),
                const SizedBox(height: 16.0,),
                ExpansionPanelList(
                  elevation: 3,
                  // Controlling the expansion behavior
                  expansionCallback: (index, isExpanded) {
                    // controller.faqsList[index].isExpanded= !isExpanded;
                    // controller.update();
                  },
                  animationDuration: const Duration(milliseconds: 500),
                  children: items2.map(
                        (item) => ExpansionPanel(
                      canTapOnHeader: true,
                      backgroundColor: Colors.grey.shade200,
                      // backgroundColor: item.isExpanded == true ? AppTheme.hoverColor.withOpacity(0.2) : Colors.white,
                      headerBuilder: (_, isExpanded) => Container(
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                          child: Text(item,
                            style: const TextStyle(fontSize: 16),
                          )),
                      body: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        child: Text("answer"),
                      ),
                      isExpanded: false,
                    ),
                  ).toList(),
                ),
                // BlocBuilder<GenericBloc<CompanyInstrumentsResponse?>,
                //     GenericState<CompanyInstrumentsResponse?>>(
                //   bloc: requestInstrumentsData.companyInstrumentsCubit,
                //   builder: (context, state) {
                //     if (state is GenericUpdateState) {
                //       log("stateData=> ${state.data?.data?.length}");
                //       return Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //
                //         ],
                //       );
                //     } else {
                //       return SizedBox(
                //           height: 56,
                //           child: Center(child: LoadingDialog.showLoadingView()));
                //     }
                //   },
                // ),
              ],
            ),
          )),
    );
  }
}
