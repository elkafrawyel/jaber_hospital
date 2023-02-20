import 'package:flutter/material.dart';

import '../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../../general/widgets/GenScaffold.dart';
import '../../../surgeon/screens/sur_profile/SurProfileImports.dart';
import '../../../surgeon/screens/sur_profile/widgets/profileWidgetImports.dart';
import 'update_account_data.dart';
import 'widgets/BuildCompProfilePhoto.dart';
import 'widgets/update_account_body.dart';

class UpdateAccountScreen extends StatefulWidget {
  const UpdateAccountScreen({Key? key}) : super(key: key);

  @override
  State<UpdateAccountScreen> createState() => _UpdateAccountScreenState();
}

class _UpdateAccountScreenState extends State<UpdateAccountScreen> {

  @override
  void initState() {
    UpdateAccountData().initScreen(context);
    super.initState();
  }

  @override
  void dispose() {
    UpdateAccountData().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: GeneralScaffold(
          back: true,
          title: "Edit Profile",
          body: Column(
            children: [
              Flexible(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    Column(
                      children: [
                        BuildCompProfilePhoto(),
                        UpdateAccountBody(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              DefaultButton(title: "Save Changes", onTap: () {
                UpdateAccountData().saveCompProfile(context);
              },margin: const EdgeInsets.symmetric(horizontal: 100,vertical: 5),),
            ],
          )),
    );
  }
}
