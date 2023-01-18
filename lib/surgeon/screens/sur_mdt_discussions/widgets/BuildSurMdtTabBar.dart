part of'SurMdtDiscussionsWImports.dart';

class BuildSurMdtTabBar extends StatelessWidget {
  const BuildSurMdtTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
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
        ]);
  }
}
