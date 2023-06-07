part of 'sur_medications_order_imports.dart';

class SurMedicationOrder extends StatefulWidget {
  const SurMedicationOrder({Key? key}) : super(key: key);

  @override
  State<SurMedicationOrder> createState() => _SurMedicationOrderState();
}

class _SurMedicationOrderState extends State<SurMedicationOrder> with SingleTickerProviderStateMixin {
  SurMedicationsOrderData surMedicationsOrderData = SurMedicationsOrderData();

  @override
  void initState() {
    surMedicationsOrderData.init(context, this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        back: true,
        title: "Medications Orders",
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                bloc: surMedicationsOrderData.loading,
                builder: (context, state) {
                  if(!state.data){
                    return BlocBuilder<GenericBloc<List<MedicationsOrdersModel>>,
                        GenericState<List<MedicationsOrdersModel>>>(
                      bloc: surMedicationsOrderData.medicationsOrdersCubit,
                      builder: (context, state) {
                        if (state is GenericUpdateState<
                            List<MedicationsOrdersModel>>) {
                          return RefreshIndicator(
                            onRefresh: ()=> surMedicationsOrderData.getMedicationsOrders(context, surMedicationsOrderData.ordersStatus),
                            child: Column(
                              children: [
                                BuildOrderMedicationTabBar(),
                                Expanded(
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return BuildMedicationItem(index: index);
                                    },
                                    itemCount: state.data.length,
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        return Center(child: LoadingDialog.showLoadingView());
                      },
                    );
                  }else{
                    return Center(child: LoadingDialog.showLoadingView());
                  }
                },
              ),
            ),
            DefaultButton(
              title: "Order Medications",
              onTap: () =>Nav.navigateTo(SurOrderMedications(), navigatorType: NavigatorType.push),
              margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            ),
          ],
        ));
  }
}
