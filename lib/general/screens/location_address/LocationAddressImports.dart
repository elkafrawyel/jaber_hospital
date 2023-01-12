import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/models/LocationModel.dart';
import 'package:base_flutter/general/utilities/http/dio/modals/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../res/res.dart';
import 'location_cubit/location_cubit.dart';
import 'widgets/LocationWidgetsImports.dart';

part 'LocationAddress.dart';
part 'LocationAddressData.dart';
