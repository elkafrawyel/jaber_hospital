part of 'HomeWidgetImports.dart';

class BuildBottomTabBar extends StatelessWidget {
  final HomeData homeData;
  const BuildBottomTabBar({Key? key, required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bnv = context.watch<BottomNavCubit>();
    return Container(
      height: Platform.isIOS ? 80 : 75,
      decoration: BoxDecoration(
          color: MyColors.primary,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: MyColors.greyWhite, blurRadius: 5, spreadRadius: 5)
          ]),
      alignment: Alignment.center,
      child: TabBar(
        controller: homeData.controller,
        onTap: (index) {
          bnv.onUpdateIndex(index);
          // homeData.changeBnVBloc.onUpdateData(index);
        },
        physics: NeverScrollableScrollPhysics(),
        indicatorColor: MyColors.white,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: .01,
        unselectedLabelStyle: GoogleFonts.cairo(fontSize: 10),
        labelStyle: GoogleFonts.cairo(fontSize: 11,fontWeight: FontWeight.bold),
        tabs: <Widget>[
          BuildTabItem(
            title: 'الرئيسية',
            bNVIcon: Res.imagesHome,
            isClicked: bnv.state.index==0?true:false,
          ),
          BuildTabItem(
            title: 'السلة',
            bNVIcon: Res.imagesCart,
            isClicked: bnv.state.index==1?true:false,
          ), BuildTabItem(
            title: 'مشترياتي',
            bNVIcon: Res.imagesPurchases,
            isClicked: bnv.state.index==2?true:false,
          ), BuildTabItem(
            title: 'المزيد',
            bNVIcon: Res.imagesMore,
            isClicked: bnv.state.index==3?true:false,
          ),
        ],
      ),
    );
  }
}
