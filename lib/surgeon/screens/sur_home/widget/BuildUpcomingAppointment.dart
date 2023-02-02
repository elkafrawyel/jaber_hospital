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
          child: BlocBuilder<GenericBloc<SurgeonHomeModel?>, GenericState<SurgeonHomeModel?>>(
            bloc: SurHomeData().homeCubit,
            builder: (context, state) {
              if(state is GenericUpdateState){
                if(state.data!.appointments!.isNotEmpty){
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.data?.appointments?.length??0,
                    itemBuilder: (context, index) => BuildUpcomingAppointmentItem(index: index),
                  );
                }else{
                  return Center(
                    child: MyText(
                      title: 'No Upcoming Appointments',
                      size: 12,
                      color: MyColors.grey,
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
      ],
    );
  }
}
