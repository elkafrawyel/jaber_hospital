part of 'SurOperationsWImports.dart';


class BuildSurOperationsTabBar extends StatelessWidget {
  const BuildSurOperationsTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBar(
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
              child: Text("Upcoming Operations"),
            ),
            Tab(
              child: Text("Past Operations"),
            ),
          ]),
    );
  }
}
