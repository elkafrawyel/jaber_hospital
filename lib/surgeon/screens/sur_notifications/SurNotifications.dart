part of 'SurNotificationsImports.dart';

// statfull widget

class SurNotifications extends StatefulWidget {
  const SurNotifications({Key? key}) : super(key: key);

  @override
  State<SurNotifications> createState() => _SurNotificationsState();
}

class _SurNotificationsState extends State<SurNotifications> {
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        back: true,
        title: "Notifications",
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          itemCount: 10,
            itemBuilder: (context, index) => BuildNotificationItem()));
  }
}


