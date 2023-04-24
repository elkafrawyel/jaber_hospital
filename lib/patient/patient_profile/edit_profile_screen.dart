import 'package:flutter/material.dart';

import '../../company/account/widgets/account_photo.dart';
import '../../general/widgets/GenScaffold.dart';
import '../../surgeon/screens/sur_profile/SurProfileImports.dart';
import 'widgets/profileWidgetImports.dart';

class EditPatientProfile extends StatefulWidget {
  const EditPatientProfile({Key? key}) : super(key: key);

  @override
  State<EditPatientProfile> createState() => _SurProfileState();
}

class _SurProfileState extends State<EditPatientProfile> {
  @override
  void initState() {
    SurProfileData().initScreen(context);
    super.initState();
  }

  @override
  void dispose() {
    SurProfileData().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: GeneralScaffold(
            back: true,
            title: "تعديل بيانات الحساب",
            body: Column(
              children: [
                Flexible(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      Column(
                        children: [
                          BuildPatientProfilePhoto(),
                          BuildPatientProfileBody(),
                        ],
                      ),
                    ],
                  ),
                ),
                BuildPatientProfileButtons()
              ],
            )),
      ),
    );
  }
}
