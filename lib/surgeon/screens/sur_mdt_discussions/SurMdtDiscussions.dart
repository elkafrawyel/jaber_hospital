part of'SurMdtDiscussionsImports.dart';

class SurMdtDiscussions extends StatefulWidget {
  const SurMdtDiscussions({Key? key}) : super(key: key);

  @override
  State<SurMdtDiscussions> createState() => _SurMdtDiscussionsState();
}

class _SurMdtDiscussionsState extends State<SurMdtDiscussions>with SingleTickerProviderStateMixin {

  @override
  void initState() {
    SurMdtDiscussionsData().init(context, this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(back: true, title: "MDT Discussions", body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildSurMdtTabBar(),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        //   child: MyText(
        //     title: '5 Patients',
        //     size: 13,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        Expanded(
            child: TabBarView(
                controller: SurMdtDiscussionsData().tabController,
                children: [
          ReadyMDT(),
          BookedMDT(),
          DecisionMDT(),
        ]))
      ],
    ));
  }
}

