import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/screens/register/components/BuildLoginButton.dart';
import 'package:base_flutter/general/screens/register/components/company_form.dart';
import 'package:base_flutter/general/screens/register/components/patient_form.dart';
import 'package:base_flutter/general/screens/register/registerData.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../res/res.dart';
import '../../utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../utilities/utils_functions/Navigator.dart';
import '../../widgets/AuthScaffold.dart';
import '../../widgets/HeaderLogo.dart';
import '../login/LoginImports.dart';
import 'components/BuildSelectAuthType.dart';
import 'components/doctor_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    RegisterData().init();
    super.initState();
  }

  final RegisterData registerData = RegisterData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      back: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            Hero(
                tag: Res.imagesLogo,
                child: HeaderLogo(
                  back: false,
                  title: 'Create Account',
                )),
            BuildSelectAuthType(),
            BlocBuilder<GenericBloc<int>, GenericState<int>>(
                bloc: registerData.selectAuthType,
                builder: (context, state) {
                  if (state.data == -1 || state.data == 0) {
                    return DoctorRegisterForm();
                  } else if (state.data == 1) {
                    return PatientForm();
                  } else {
                    return CompanyForm();
                  }
                }),
            BuildRegisterButton(registerData: RegisterData()),
            Row(
              children: [
                MyText(
                  title: 'Already have account,',
                  color: MyColors.primary,
                  size: 12,
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Nav.navigateTo(
                      Login(),
                      navigatorType: NavigatorType.pushAndPopUntil,
                    );
                  },
                  child: MyText(
                    title: 'Login',
                    color: MyColors.primary,
                    size: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
