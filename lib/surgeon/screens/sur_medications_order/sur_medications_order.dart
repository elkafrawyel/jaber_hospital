part of 'sur_medications_order_imports.dart';

class SurMedicationOrder extends StatefulWidget {
  const SurMedicationOrder({Key? key}) : super(key: key);

  @override
  State<SurMedicationOrder> createState() => _SurMedicationOrderState();
}

class _SurMedicationOrderState extends State<SurMedicationOrder>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SurMedicationsOrderData().init(context, this);
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
                bloc: SurMedicationsOrderData().loading,
                builder: (context, state) {
                  if(!state.data){
                    return BlocBuilder<GenericBloc<List<MedicationsOrdersModel>>,
                        GenericState<List<MedicationsOrdersModel>>>(
                      bloc: SurMedicationsOrderData().medicationsOrdersCubit,
                      builder: (context, state) {
                        if (state is GenericUpdateState<
                            List<MedicationsOrdersModel>>) {
                          return Column(
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
