import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/surgeon/models/patient_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../../res/res.dart';
import '../../../surgeon/screens/sur_patient/widgets/SurPatientWImports.dart';
import '../PsychologistPatientData.dart';

part 'BuildPreOpView.dart';
part 'BuildPrePostItem.dart';
part 'BuildPrePostView.dart';
part 'BuildPsychologistPatientTab.dart';
part 'BuildPsychologistPatientType.dart';