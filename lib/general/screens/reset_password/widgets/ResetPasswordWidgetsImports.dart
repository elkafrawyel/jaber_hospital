
import 'package:base_flutter/general/blocks/theme_cubit/theme_cubit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/screens/reset_password/ResetPasswordImports.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/LoadingButton.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../../res/res.dart';
import '../../../MyApp.dart';
import '../../../utilities/utils_functions/Navigator.dart';
import '../../../widgets/GeneralAlertDialog.dart';
import '../../login/LoginImports.dart';

part 'BuildButton.dart';
part 'BuildFormInputs.dart';
part 'BuildPassResetSuccess.dart';
part 'BuildText.dart';