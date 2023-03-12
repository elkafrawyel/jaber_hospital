part of 'CompNotificationsImports.dart';

// statfull widget

class CompNotifications extends StatefulWidget {
  const CompNotifications({Key? key}) : super(key: key);

  @override
  State<CompNotifications> createState() => _SurNotificationsState();
}

class _SurNotificationsState extends State<CompNotifications> {
  NotificationsData notificationsData = NotificationsData();

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
              return notificationsData.notificationsList!.isNotEmpty
                  ? ListView.separated(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: notificationsData.notificationsList?.length ?? 0,
                itemBuilder: (context, index) => CompNotificationItem(
                  index: index,
                  notification: notificationsData.notificationsList?[index],
                ),
                separatorBuilder: (_, __) =>
                const SizedBox(height: 8.0),
              )
                  : Center(
                child: MyText(
                  title: 'No Notifications Orders',
                  size: 14,
                  color: MyColors.grey,
                ),
              );
            } else {
              return LoadingWidget();
            }
          },
        ),);
  }
}


