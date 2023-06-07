part of 'SurMedicationOrderWImports.dart';

class BuildOrderMedicationTabBar extends StatelessWidget {
  const BuildOrderMedicationTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: SurMedicationsOrderData().tabController,
          onTap: (index) {
            SurMedicationsOrderData().tabSelect.onUpdateData(index);
            String status = SurMedicationsOrderData().orderNumType;
            log("status==> $status");
            SurMedicationsOrderData().getMedicationsOrders(context, status);
          },
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
              child: Text("Routed to Company"),
            ),
            Tab(
              child: Text("In Progress"),
            ),
            Tab(
              child: Text("Completed"),
            ),
          ],
        ),
        BlocBuilder<GenericBloc<int>, GenericState<int>>(
          bloc: SurMedicationsOrderData().tabSelect,
          builder: (context, state) {
            return Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MyText(
                title: '${SurMedicationsOrderData().medicationsOrdersCubit.state.data.length} ${SurMedicationsOrderData().orderNumType}',
                size: 13,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),

      ],
    );
  }
}


