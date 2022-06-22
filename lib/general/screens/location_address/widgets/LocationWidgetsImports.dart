
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/models/LocationModel.dart';
import 'package:base_flutter/general/screens/location_address/location_cubit/location_cubit.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/utils_functions/TranslateAnimation.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:tf_custom_widgets/widgets/MyText.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';
import '../LocationAddressImports.dart';

part 'BuildGoogleMapView.dart';
part 'BuildSaveButton.dart';
part 'BuildMapExtensions.dart';
part 'BuildMapSearch.dart';
part 'BuildAddressContainer.dart';
part 'MarkerDetailsButtonSheet.dart';
part 'BuildMainMarker.dart';
