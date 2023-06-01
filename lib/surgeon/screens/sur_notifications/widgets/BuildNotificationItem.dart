part of'SurNotificationsWImports.dart';


class BuildNotificationItem extends StatelessWidget {
  const BuildNotificationItem({Key? key, required this.index, required this.notification}) : super(key: key);
  final int index;
  final NotificationModel? notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: MyColors.greyWhite)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Icon(Icons.circle,color: MyColors.primary,size: 10,),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  title: notification?.notifcationDoctorEn??"" + "${notification?.doctorId?.firstNameEn} ${notification?.doctorId?.lastNameEn}" ,
                  size: 12,
                  color: MyColors.black,
                ),
                const SizedBox(
                  height: 5,
                ),
                MyText(
                  title: notification?.createdDate??"",
                  size: 10,
                  color: MyColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
