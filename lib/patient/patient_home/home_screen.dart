import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../general/constants/MyColors.dart';
import '../../general/utilities/http/dio/http/GenericHttp.dart';
import '../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../general/utilities/utils_functions/ApiNames.dart';
import '../models/update_consent_response.dart';
import 'home_data.dart';
import 'widgets/BuildHomeDrawer.dart';
import 'widgets/build_appBar.dart';
import 'widgets/general_progress.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({Key? key}) : super(key: key);

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/patient_terms_cons.pdf'),
  );

  @override
  void initState() {
    // TODO: implement initState
    PatientHomeData().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Future.delayed(Duration.zero, () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool endorsementAccepted = prefs.getBool("endorsementAccepted") ?? false;
      endorsementAccepted
          ? null
          : showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => _buildEndoment(context, size));
    });

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: BuildPatientHomeAppBar(),
        drawer: PatientHomeDrawer(),
        body: HomeView(),
      ),
    );
  }

  Widget _buildEndoment(BuildContext context, Size size) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)), //this right here
        child: Container(
            width: size.width * 0.98,
            height: size.height * 0.92,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                    title: 'إقرار',
                    size: 16,
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 6.0),
                Expanded(
                  child: PdfView(
                    controller: pdfController,
                    renderer: (PdfPage page) => page.render(
                      width: page.width * 1.8,
                      height: page.height * 3,
                      format: PdfPageImageFormat.jpeg,
                      backgroundColor: '#FFFFFF',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                DefaultButton(
                  height: 38,
                  title: "موافق",
                  onTap: () async {
                    await updateConsent();
                  },
                  margin:
                      const EdgeInsets.symmetric(horizontal: 56, vertical: 5),
                ),
              ],
            )),
      ),
    );
  }

  Future<void> updateConsent() async {
    log('fetchInstruments called...');
    Map<String, dynamic> body = {"consent": false};
    UpdateConsentResponse data = await GenericHttp<UpdateConsentResponse>(context).callApi(
      name: ApiNames.patientConsentPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Put,
      jsonBody: body,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => UpdateConsentResponse.fromJson(json),
    );
    if (data.success ?? false) {
      CustomToast.showSimpleToast(msg: data.message?.messageAr ?? "");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("endorsementAccepted", true);
      Navigator.of(context).pop();
    } else {
      CustomToast.showSimpleToast(msg: data.message?.messageAr ?? "");
    }
  }
}
