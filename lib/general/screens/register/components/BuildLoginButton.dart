import 'package:flutter/cupertino.dart';

import '../../../constants/MyColors.dart';
import '../../../utilities/tf_custom_widgets/widgets/LoadingButton.dart';
import '../registerData.dart';

class BuildRegisterButton extends StatelessWidget {
  final RegisterData registerData;

  const BuildRegisterButton({required this.registerData});

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: registerData.btnKey,
      title: 'Create Account',
      onTap: () => registerData.register(context),
      color: MyColors.primary,
      textColor: MyColors.white,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
    );
  }
}
