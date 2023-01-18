part of 'SurHomeWImports.dart';


class BuildUpcomingAppointment extends StatelessWidget {
  const BuildUpcomingAppointment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
                title: 'Upcoming Appointments',
                size: 12,
                fontWeight: FontWeight.bold),
            MyText(
              title: 'See All',
              size: 10,
              fontWeight: FontWeight.bold,
              color: MyColors.primary,
              decoration: TextDecoration.underline,
            ),
          ],
        ),
        Container(
          height: 100,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => BuildUpcomingAppointmentItem(),
          ),
        ),
      ],
    );
  }
}
