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
import 'request_instruments_data.dart';

class RequestInstrumentsScreen extends StatefulWidget {
  const RequestInstrumentsScreen({Key? key}) : super(key: key);
  // final InstrumentOrderModel ordersModel;

  @override
  State<RequestInstrumentsScreen> createState() => _RequestInstrumentsScreenState();
}

class _RequestInstrumentsScreenState extends State<RequestInstrumentsScreen> {
  RequestInstrumentsData requestInstrumentsData= RequestInstrumentsData();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneController= TextEditingController();
  late TextEditingController dateController= TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    requestInstrumentsData.init(context);
    // nameController = TextEditingController(text: "${widget.ordersModel.patientId?.firstNameEn} "
    //     "${widget.ordersModel.patientId?.lastNameEn}");
    // phoneController = TextEditingController(text: widget.ordersModel.patientId?.mobile??"");
    // dateController = TextEditingController(text: widget.ordersModel.orderStartDate??"");
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
                // BlocBuilder<GenericBloc<CompanyInstrumentsResponse?>,
                //     GenericState<CompanyInstrumentsResponse?>>(
                //   bloc: requestInstrumentsData.companyInstrumentsCubit,
                //   builder: (context, state) {
                //     if (state is GenericUpdateState) {
                //       return Column(
                //         children: [
                //
                //         ],
                //       );
                //     } else {
                //       return Center(child: LoadingDialog.showLoadingView());
                //     }
                //   },
                // ),
              ],
            ),
          )),
    );
  }
}
