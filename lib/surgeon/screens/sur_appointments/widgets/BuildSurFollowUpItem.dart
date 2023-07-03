part of 'SurFollowUpsTabBarWImports.dart';

class BuildSurFollowUpItem extends StatelessWidget {
  const BuildSurFollowUpItem({Key? key, required this.appointmentModel}) : super(key: key);
  final AppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CachedImage(
                  url: appointmentModel.patientId?.image ?? 'https://picsum.photos/130',
                  height: 65,
                  width: 55,
                  borderRadius: BorderRadius.circular(10),
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyText(
                            title: appointmentModel.patientId?.firstNameEn ?? "",
                            size: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(width: 5),
                          MyText(
                            title: appointmentModel.patientId?.lastNameEn ?? "",
                            size: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      MyText(
                        title: (appointmentModel.comments ?? '').isNotEmpty
                            ? appointmentModel.comments!
                            : 'Scheduled Appointment',
                        size: 13,
                        fontWeight: FontWeight.w700,
                        color: MyColors.grey,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(Res.imagesVector, scale: 3),
                              const SizedBox(width: 5),
                              MyText(
                                title:
                                    DateFormat("E ,d MMM y").format(DateTime.parse(appointmentModel.appointmentDate!)),
                                size: 9,
                                color: MyColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(Res.imagesClockIcon, scale: 3),
                              const SizedBox(width: 5),
                              MyText(
                                title: DateFormat("hh:mm a").format(DateTime.parse(appointmentModel.appointmentDate!)),
                                size: 9,
                                color: MyColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
