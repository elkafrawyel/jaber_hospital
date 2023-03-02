import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../company/models/comp_home_orders_response.dart';
import '../../general/constants/MyColors.dart';
import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../general/widgets/GenScaffold.dart';
import '../../surgeon/screens/sur_notifications/widgets/SurNotificationsWImports.dart';
import '../models/notifications_response.dart';
import 'patient_notifications_data.dart';
import 'widgets/notification_item.dart';

class PatientNotificationsScreen extends StatefulWidget {
  const PatientNotificationsScreen({Key? key}) : super(key: key);

  @override
  State<PatientNotificationsScreen> createState() => _PatientNotificationsScreenState();
}

class _PatientNotificationsScreenState extends State<PatientNotificationsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    PatientNotificationsData().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GeneralScaffold(
          back: true,
          title: "الإشعارات",
          body: BlocBuilder<GenericBloc<NotificationsResponse?>, GenericState<NotificationsResponse?>>(
            bloc: PatientNotificationsData().notificationsCubit,
            builder: (context, state) {
              if(state is GenericUpdateState){
                if(state.data!.notifications!.isNotEmpty){
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.data?.notifications?.length??0,
                    itemBuilder: (context, index) => PatientNotificationItem(),
                  );
                }else{
                  return Center(
                    child: MyText(
                      title: 'لا يوجد إشعارات حالية',
                      size: 14,
                      color: MyColors.black,
                    ),
                  );
                }
              }else{
                return  Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: MyColors.greyWhite,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    height: MediaQuery.of(context).size.height / 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MyColors.white,
                    ),
                  ),
                );
              }
            },
          ),
      ),
    );
  }
}
