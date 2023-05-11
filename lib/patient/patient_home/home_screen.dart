import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
                  child: SfPdfViewer.asset(
                      'assets/patient_terms_cons.pdf.pdf'),
//                   child: SingleChildScrollView(
//                     child: MyText(title: """
// الموافقة على شروط الاستخدام
// هام- يرجي القراءة بحرص قبل استخدام التطبيق
// تعد هذه الموافقة اتفاق قانوني بينك وبين قسم الجراحة بمستشفى جابر الأحمد الصباح (التابع لوزارة الصحة بدولة الكويت) وتنظم استخدامك لتطبيق “Jaber Bariapp”.  من خلا تحميل وتثبيت واستخدام التطبيق فإنك توافق على الالتزام بشروط هذه الاتفاقية:
// 	•	منح الترخيص: وفقًا لشروط وأحكام هذه الاتفاقية، يمنح المطور والمالك المستخدم ترخيصًا محدودًا وغير حصري وغير قابل للتحويل لاستخدام التطبيق لغرض جمع البيانات المتعلقة بجراحة السمنة من قبل المرضى والأطباء في مستشفى جابر الأحمد الصباح بالكويت.
// 	•	الملكية وحقوق الطبع والنشر: التطبيق مملوك من قبل قسم الجراحة العامة بمستشفى جابر الأحمد الصباح بدولة الكويت وهو محمي بموجب قوانين حقوق النشر ومعاهدات حقوق النشر الدولية، بالإضافة إلى قوانين ومعاهدات الملكية الفكرية الأخرى. التطبيق مرخص للمستخدم وليس بيعه.
// 	•	القيود المفروضة على الاستخدام: لا يجوز للمستخدم نسخ التطبيق، أو تعديله، أو توزيعه، أو بيعه، أو ترخيصه من الباطن أو نقله أو استغلاله بطريقة أخرى، باستثناء ما هو مسموح به صراحةً في هذه الاتفاقية. لا يجوز للمستخدم إجراء هندسة عكسية، أو فك، أو محاولة استنباط الكود المصدري للتطبيق أو أي جزء منه بأي طريقة أخرى.
// 	•	إخلاء المسؤولية عن الضمان: يتم تقديم التطبيق "كما هو" دون أي ضمان من أي نوع، سواء أكان صريحًا أم ضمنيًا، بما في ذلك، على سبيل المثال لا الحصر، ضمانات القابلية للتسويق والملاءمة لغرض معين وعدم وجود غرض معين. لا يضمن المطور أن التطبيق سيلبي متطلبات المستخدم أو أن تشغيله لن ينقطع أو يكون خاليًا من الأخطاء.
// 	•	لن يكون تحديد المسؤولية بأي حال من الأحوال مسؤولاً عن أي أضرار أياً كان نوعها (بما في ذلك، على سبيل المثال لا الحصر، الأضرار الناجمة عن فقدان أرباح الأعمال، أو انقطاع الأعمال، أو فقدان معلومات الأعمال الناتجة عن الاستخدام، أو أي شيء آخر) عدم القدرة على استخدام التطبيق، حتى لو تم إخطار المطور بإمكانية حدوث مثل هذه الأضرار.
// 	•	الموافقة على استخدام البيانات الطبية لغرض البحث العلمي والاحصاء الطبي: بموافقتي على هذا الإقرار فإنني أوافق على استخدام بياناتي الطبية لغرض البحث العلمي والاحصاء الطبي بواسطة قسم الجراحة بمستشفى جابر الأحمد الصباح دون التعرض لبيانتي الشخصية أو ما يدل بأي شكل على هويتي وأوافق على نشر هذه الأبحاث في المجلات والدوريات العلمية.
// 	•	تعبئة الاستبيانات: أقر بأن الإجابات الموضحة بالاستبيانات صحيحة وتعبر عن حالتي الصحية وتاريخي المرضي وأنني قرأت الأسئلة بتمعن وحرص قبل الإجابة كما أوافق على تعبئة الاستبيانات المرسلة مستقبلا بنفس الشروط لغرض متابعة الحالة والبحث العلمي.
// 	•	أوافق على التواصل من خلال رقم هاتفي المسجل على التطبيق لغرض ارسال الرسائل والاشعارات والتواصل لأجل متابعة الحالة أو الاستبيانات المتعلقة بالصحة.
// 	•	التطبيق مملوك بشكل كلي وحصري لقسم الجراحة بمستشفى جابر الأحمد الصباح التابع لوزارة الصحة بدولة الكويت ولا يجوز استخدامه بدون موافقة مسبقة من المفوض.
// 	•	جميع البيانات محفوظة بشكل مشفر داخل دولة الكويت وتخضع لقانون دولة الكويت.
// """, size: 12, fontWeight: FontWeight.w700),
//                   ),
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
    UpdateConsentResponse data =
        await GenericHttp<UpdateConsentResponse>(context).callApi(
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
