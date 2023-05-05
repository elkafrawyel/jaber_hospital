part of 'SurHomeWImports.dart';

class BuildUpcomingAppointmentItem extends StatelessWidget {
  final int index;

  const BuildUpcomingAppointmentItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Appointments>? list = SurHomeData().homeCubit.state.data?.appointments;
    return InkWell(
      onTap: () async {
        await Nav.navigateTo(
          SurPatientDetails(patientId: list?[index].patientId?.sId ?? ""),
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
                url: list?[index].patientId?.image ?? 'https://picsum.photos/201',
                height: 56,
                width: 50,
                borderRadius: BorderRadius.circular(5)),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(title: '${list?[index].patientId?.firstNameEn} ${list?[index].patientId?.lastNameEn}', size: 12, fontWeight: FontWeight.bold),
                const SizedBox(height: 2),
                MyText(
                    title: list?[index].patientId?.operationType ?? 'Revisional Operation',
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
                          title: list?[index].appointmentDate ?? "14 AUG 2022",
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
                          title: list?[index].createdAt?.split("-").last.substring(3, 8) ?? "14:30 PM",
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
