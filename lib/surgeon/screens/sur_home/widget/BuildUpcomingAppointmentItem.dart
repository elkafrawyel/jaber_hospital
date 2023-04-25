part of 'SurHomeWImports.dart';

class BuildUpcomingAppointmentItem extends StatelessWidget {
  final int index;

  const BuildUpcomingAppointmentItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Appointments appointment = (SurHomeData().homeCubit.state.data?.appointments ?? [])[index];
    return InkWell(
      onTap: () async {
        await Nav.navigateTo(
          SurPatientDetails(patientId: appointment.patientId?.sId ?? ""),
          navigatorType: NavigatorType.push,
        );
      },
      child: Container(
        // width: 251,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: MyColors.textFields,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: MyColors.greyWhite,
              spreadRadius: .1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            CachedImage(
                url: appointment.patientId?.image ?? 'https://picsum.photos/201',
                height: 56,
                width: 50,
                borderRadius: BorderRadius.circular(5)),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                    title: '${appointment.patientId?.fNameEn ?? ''} ${appointment.patientId?.lNameEn ?? ''}',
                    size: 12,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 2),
                MyText(
                    title: appointment.patientId?.operationType ?? '',
                    color: MyColors.grey,
                    size: 10,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Res.imagesVector,
                          scale: 3,
                        ),
                        const SizedBox(width: 5),
                        MyText(
                          title: DateFormat("dd-MM-yyyy").format(DateTime.parse(appointment.appointmentDate!)),
                          overflow: TextOverflow.ellipsis,
                          size: 9,
                          color: MyColors.primary,
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Row(
                      children: [
                        Image.asset(
                          Res.imagesClockIcon,
                          scale: 3,
                        ),
                        const SizedBox(width: 5),
                        MyText(
                          title: DateFormat("hh:mm a").format(DateTime.parse(appointment.appointmentDate!)),
                          size: 9,
                          overflow: TextOverflow.ellipsis,
                          color: MyColors.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
