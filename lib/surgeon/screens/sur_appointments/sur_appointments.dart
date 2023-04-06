part of 'sur_appointments_imports.dart';

class SurAppointments extends StatefulWidget {
  const SurAppointments({Key? key}) : super(key: key);

  @override
  State<SurAppointments> createState() => _SurFollowUpsState();
}

class _SurFollowUpsState extends State<SurAppointments> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      back: true,
      title: "Appointments",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
          controller: tabController,
          onTap: (index) {},
          indicatorColor: MyColors.primary,
          labelColor: MyColors.primary,
          indicatorWeight: 3,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelStyle: WidgetUtils.textStyle
              .copyWith(color: MyColors.grey, fontSize: 14),
          labelStyle: WidgetUtils.textStyle.copyWith(
              color: MyColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.bold),
          unselectedLabelColor: MyColors.grey,
          tabs: [
            Tab(
              child: Text("Upcoming"),
            ),
            Tab(
              child: Text("Past"),
            ),
          ]),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children: [
                  UpcomingAppointments(),
                  PastAppointments(),
                ]),
          )
        ],
      ),
    );
  }
}


