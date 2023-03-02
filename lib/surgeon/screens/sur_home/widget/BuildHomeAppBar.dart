part of 'SurHomeWImports.dart';

class BuildSurHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<UserCubit>().state.model;
    return AppBar(
      backgroundColor: MyColors.white,
      centerTitle: false,
      elevation: 0,
      leadingWidth: 60,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      actions: [
        BuildNotificationIcon() ,
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: "Good evening ,${user.userData![0].fullNameEn??"Dr Samer"}",
            size: 12,
            fontWeight: FontWeight.bold,
            color: MyColors.primary,
          ),
          MyText(
            title: 'How are you today?',
            size: 10,
            color: MyColors.black,
          ),
        ],
      ),
      leading: InkWell(
        onTap: () => Scaffold.of(context).openDrawer(),
        child: Icon(
          Icons.menu,
          size: 30,
          color: MyColors.primary,
        ),
      ),
      // actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55);
}