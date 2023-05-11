import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/models/company_model.dart';
import '../../../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../../general/utilities/utils_functions/Navigator.dart';
import '../../../../general/widgets/GenScaffold.dart';
import '../../../../general/widgets/app_drop_menu.dart';
import '../../../../general/widgets/loading_widget.dart';
import '../../../models/comp_instruments_model.dart';
import '../../../models/company_instruments_response.dart';
import '../../../models/instrument_order_model.dart';
import '../../../models/patient_details_model.dart';
import '../models/handles_instrument_model.dart';
import 'request_instruments_data.dart';
import 'widgets/radio_check_item.dart';
import 'widgets/reloads_item_widget.dart';

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
                  fieldTypes: FieldTypes.disable,
                  fillColor: MyColors.textFields,
                  hint: "Date",
                  controller: dateController,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.text,
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
                        selectedItem: requestInstrumentsData.selectedCompany??null,
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
                if(requestInstrumentsData.selectedCompany!=null)...[
                  MyText(
                    title: 'Company Instruments:',
                    size: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  BlocBuilder<GenericBloc<List<CompInstrumentsModel>?>,
                      GenericState<List<CompInstrumentsModel>?>>(
                    bloc: requestInstrumentsData.companyInstrumentsCubit,
                    builder: (context, state) {
                      if (state is GenericUpdateState) {
                        log("stateData=> ${requestInstrumentsData.compAllInstruments.length}");
                        return SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          physics: const BouncingScrollPhysics(),
                          child: ExpansionPanelList(
                            elevation: 3,
                            // Controlling the expansion behavior
                            expansionCallback: (index, isExpanded) {
                              state.data?[index].isExpanded= !isExpanded;
                              requestInstrumentsData.companyInstrumentsCubit.onUpdateData(state.data);
                            },
                            animationDuration: const Duration(milliseconds: 500),
                            children: state.data!.map(
                                  (item) => ExpansionPanel(
                                canTapOnHeader: true,
                                backgroundColor:
                                item.isExpanded == true ? Colors.grey.shade50 : Colors.white,
                                headerBuilder: (_, isExpanded) => Container(
                                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                                    child: Text(
                                      item.headerTitle??"",
                                      style: const TextStyle(fontSize: 16),
                                    )),
                                body: Column(
                                  children: item.instruments!.map((element) => ReloadsItemWidget(instrumentModel: element,)).toList(),
                                ),
                                isExpanded: item.isExpanded,
                              ),
                            ).toList(),
                          ),
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
                  DefaultButton(
                    title: "Confirm Request",
                    onTap: () async{
                      if(requestInstrumentsData.selectedInstrumentsList.isEmpty){
                        CustomToast.showSnackBar(context, "Please select instruments first!", backgroundColor: Colors.redAccent);
                        return;
                      }
                      List<dynamic> instruments = requestInstrumentsData.selectedInstrumentsList
                          .map((item) => {
                        "id": item.sId,
                        "quantity":item.quantity,
                      }).toList();
                      Map<String, dynamic> body = {
                        "doctor_id": widget.patientModel.patient?.surgeonId?.sId??"",
                        "company_id": widget.patientModel.patient?.surgeonId?.sId??"",
                        "patient_id": widget.patientModel.patient?.id??"",
                        "mobile_number": widget.patientModel.patient?.telephone1??"",
                        "order_start_date": "",
                        "order_status": "routed to company",
                        "status": true,
                        "instruments": instruments,
                      };
                      log("instruments=> ${jsonEncode(instruments)}");
                      await requestInstrumentsData.requestInstrumentsOrder(context, body);
                      // Nav.navigateTo(QuestionnaireCompletedScreen(), navigatorType: NavigatorType.push);
                    },
                  ),
                ],
              ],
            ),
          )),
    );
  }
}
