part of'SurMdtDiscussionsImports.dart';

class SurMdtDiscussions extends StatefulWidget {
  const SurMdtDiscussions({Key? key}) : super(key: key);

  @override
  State<SurMdtDiscussions> createState() => _SurMdtDiscussionsState();
}

class _SurMdtDiscussionsState extends State<SurMdtDiscussions> {

  @override
  void initState() {
    SurMdtDiscussionsData().init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(back: true, title: "MDT", body: DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
              onTap: (index) {},
              indicatorColor: MyColors.primary,
              labelColor: MyColors.primary,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelStyle:
              WidgetUtils.textStyle.copyWith(color: MyColors.grey,fontSize: 14),
              labelStyle:
              WidgetUtils.textStyle.copyWith(color: MyColors.primary,fontSize: 14,fontWeight: FontWeight.bold),
              unselectedLabelColor: MyColors.grey,
              tabs: [
                Tab(
                  child: Text("Ready"),
                ),
                Tab(
                  child: Text("Booked"),
                ),
                Tab(
                  child: Text("Decision"),
                ),
              ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: MyText(
              title: '5 Patients',
              size: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: TabBarView(children: [
            ReadyMDT(),
            BookedMDT(),
            DecisionMDT(),
          ]))
        ],
      ),
    ));
  }
}
