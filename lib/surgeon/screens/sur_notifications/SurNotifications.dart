part of 'SurNotificationsImports.dart';

// statfull widget

class SurNotifications extends StatefulWidget {
  const SurNotifications({Key? key}) : super(key: key);

  @override
  State<SurNotifications> createState() => _SurNotificationsState();
}

class _SurNotificationsState extends State<SurNotifications> {
  SurNotificationsData notificationsData = SurNotificationsData();

  @override
  void initState() {
    // TODO: implement initState
    notificationsData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        back: true,
        title: "Notifications",
      body: BlocBuilder<GenericBloc<NotificationsResponse?>,
          GenericState<NotificationsResponse?>>(
        bloc: notificationsData.notificationsCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return notificationsData.notificationsList!.isNotEmpty? ListView.separated(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: notificationsData.notificationsList?.length ?? 0,
              itemBuilder: (context, index) => BuildNotificationItem(
                index: index,
                notification: notificationsData.notificationsList?[index],
              ),
              separatorBuilder: (_, __) => const SizedBox(height: 8.0),
            ): Center(
              child: MyText(
                title: 'No Notifications founded',
                size: 14,
                color: MyColors.grey,
              ),
            );
          } else {
            return Expanded(
                child: Center(child: LoadingDialog.showLoadingView()));
          }
        },
      ),);
  }
}


