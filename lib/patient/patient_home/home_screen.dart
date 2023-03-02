import 'dart:developer';

import 'package:flutter/material.dart';
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
import 'widgets/coming_appointments.dart';
import 'widgets/general_progress.dart';
import 'widgets/operations.dart';
import 'widgets/visits_history.dart';
import 'widgets/week_progress.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({Key? key}) : super(key: key);

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {


  @override
  void initState() {
    // TODO: implement initState
    PatientHomeData().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Future.delayed(Duration.zero, () async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool endorsementAccepted = prefs.getBool("endorsementAccepted")??false;
      endorsementAccepted? null: showDialog(context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => _buildEndoment(context, size));
    });

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: BuildPatientHomeAppBar(),
        drawer: PatientHomeDrawer(),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
          children: [
            ComingAppointments(),
            const SizedBox(height: 16.0),
            GeneralProgress(),
            const SizedBox(height: 12.0),
            OperationsDate(),
            const SizedBox(height: 12.0),
            BuildWeekProgress(),
            const SizedBox(height: 16.0),
            VisitsHistory(),
            const SizedBox(height: 28.0),
          ],
        ),
      ),
    );
  }

  Widget _buildEndoment(BuildContext context, Size size){
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)), //this right here
        child: Container(
          width: size.width * 0.95,
          padding: const EdgeInsets.all(16.0),
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
                child: SingleChildScrollView(
                  child: MyText(
                      title: """ن دخولك على هذه القواعد يعني قبولك بجميع الشروط والأحكام الواردة هنا، وأي شروط أخرى يتم نشرها وتحديثها على صفحات القواعد أو موقع الشركة.
إذا كنت غير موافق على هذه الشروط والأحكام يرجى عدم استخدام القواعد والموقع.
تحتفظ شركة المنظومة لنفسها بحق تغيير أو تعديل أو إضافة أو إزالة أجزاء من هذه الشروط والأحكام وفقا لتقديرها في أي وقت وبدون إشعار مسبق.
يرجى مراجعة هذه الصفحة بشكل دوري لأي تعديلات. علما أن استمرار استخدامك لهذا الموقع بعد نشر أي تغييرات سوف يعني أنك قد قبلت هذه التغييرات.
حقوق التأليف والنشر والملكية الفكرية والقيود المفروضة على الاستخدام :
جميع المحتويات في هذا الموقع ، بما في ذلك النصوص الكاملة للوثائق، والتصميم والصور والبرامج والنصوص وغيرها من المعلومات (إجمالا ، "المحتوى") هي من ممتلكات شركة المنظومة أو الجهات المرخصة بموجب العقود الموقعة معها. وجميع هذه المحتويات محمية بموجب قوانين وأنظمة حقوق المؤلف وغيرها من قوانين الملكية الفكرية.""",
                      size: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16.0),
              DefaultButton(
                height: 38,
                title: "موافق",
                onTap: () async{
                  await updateConsent();
                },
                margin: const EdgeInsets.symmetric(horizontal: 56, vertical: 5),
              ),
            ],
          )
        ),
      ),
    );
  }

  Future<void> updateConsent() async {
    log('fetchInstruments called...');
    Map<String, dynamic> body = {
      "consent": false
    };
    UpdateConsentResponse data = await GenericHttp<UpdateConsentResponse>(context).callApi(
      name: ApiNames.patientConsentPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Put,
      jsonBody: body,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => UpdateConsentResponse.fromJson(json),
    );
    if(data.success??false){
      CustomToast.showSimpleToast(msg: data.message?.messageAr??"");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("endorsementAccepted", true);
      Navigator.of(context).pop();
    } else{
      CustomToast.showSimpleToast(msg: data.message?.messageAr??"");
    }
  }
}
