part of'HomeWidgetImports.dart';

class BuildTabsView extends StatelessWidget {
  final HomeData homeData;
  const BuildTabsView({Key? key, required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: homeData.controller,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Main(),
        Cart(),
        MyPurchases(),
        MyPurchases(),
      ],
    );
  }
}
