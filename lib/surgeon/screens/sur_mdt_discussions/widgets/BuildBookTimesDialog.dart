part of 'SurMdtDiscussionsWImports.dart';

class BuildBookTimesDialog extends StatelessWidget {
  const BuildBookTimesDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralAlertDialog(
      alertButtonType: AlertButtonType.noButton,
      alertTextType: AlertContentType.noTitle,
      alertImageType: AlertImageType.noImg,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      customWidget: Container(
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios_new,
                      size: 20, color: MyColors.primary),
                  MyText(
                    alien: TextAlign.center,
                    title: "Book MDT For PatientName",
                    size: 11,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary,
                  ),
                  InkWell(
                    onTap: () => navigationKey.currentState?.pop(),
                    child: Icon(
                      Icons.close,
                      color: MyColors.primary,
                    ),
                  )
                ],
              ),
              MyText(
                alien: TextAlign.center,
                title: "Monday (18 August 2022)",
                size: 14,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<GenericBloc<int>, GenericState<int>>(
                bloc: SurMdtDiscussionsData().selectBookTimeCubit,
                builder: (context, state) {
                  return Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(
                          times.length,
                          (index) => InkWell(
                                onTap: () => SurMdtDiscussionsData()
                                    .selectBookTimeCubit
                                    .onUpdateData(index),
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: index == state.data
                                          ? MyColors.primary
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: MyText(
                                    title: times[index],
                                    size: 10,
                                    color: index == state.data
                                        ? Colors.white
                                        : Colors.black,
                                  )),
                                ),
                              )));
                },
              ),
              DefaultButton(
                title: "Confirm Booking",
                onTap: () {
                  navigationKey.currentState?.pop();
                  SurMdtDiscussionsData().tabController.animateTo(1);
                },
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              )
            ],
          )),
    );
  }
}

//list of strings starts with 11:00 AM and encresedby 5 minutes to 11:55 AM

List<String> times = [
  "11:00 AM",
  "11:05 AM",
  "11:10 AM",
  "11:15 AM",
  "11:20 AM",
  "11:25 AM",
  "11:30 AM",
  "11:35 AM",
  "11:40 AM",
  "11:45 AM",
  "11:50 AM",
  "11:55 AM",
];
