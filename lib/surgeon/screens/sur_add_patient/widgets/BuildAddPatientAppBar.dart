part of'SurAddPatientWImports.dart';

class BuildAddPatientAppBar extends StatelessWidget with PreferredSizeWidget {
  const BuildAddPatientAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 30,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => navigationKey.currentState!.pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: MyColors.primary,
        ),
      ),
      title: BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: SurAddPatientData().pageCubit,
  builder: (context, state) {
    return Text.rich(
        TextSpan(
          text: 'Add Patient',
          style: WidgetUtils.textStyle.copyWith(color: MyColors.primary,fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: ' (',
              style: WidgetUtils.textStyle.copyWith(color: MyColors.primary,fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: '${state.data}',
              style: WidgetUtils.textStyle.copyWith(color:state.data ==7 ? MyColors.primary:MyColors.black,fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: '/7)',
              style: WidgetUtils.textStyle.copyWith(color: MyColors.primary,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
  },
),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);
}
