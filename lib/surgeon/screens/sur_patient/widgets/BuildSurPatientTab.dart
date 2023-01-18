part of 'SurPatientWImports.dart';

class BuildSurPatientTab extends StatelessWidget {
  const BuildSurPatientTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
      bloc: SurPatientData().selectedTabCubit,
      builder: (context, state) {
        return Container(
          height: 60,
          child: TabBar(
              onTap: (index) => SurPatientData()
                  .selectedTabCubit
                  .onUpdateData(index),
              indicatorColor: MyColors.primary,
              labelColor: MyColors.primary,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelStyle: WidgetUtils.textStyle
                  .copyWith(color: MyColors.grey),
              labelStyle: WidgetUtils.textStyle
                  .copyWith(color: MyColors.primary),
              unselectedLabelColor: MyColors.grey,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        Res.imagesPatientDrawer,
                        scale: 2.8,
                        color: state.data == 0
                            ? MyColors.primary
                            : MyColors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text("My Patients"),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        Res.imagesAllPatient,
                        scale: 2.8,
                        color: state.data == 1
                            ? MyColors.primary
                            : MyColors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text("All Patients"),
                    ],
                  ),
                ),
              ]),
        );
      },
    );
  }
}
