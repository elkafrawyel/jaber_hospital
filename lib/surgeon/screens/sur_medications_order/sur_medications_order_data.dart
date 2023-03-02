part of 'sur_medications_order_imports.dart';


class SurMedicationsOrderData {
  SurMedicationsOrderData._();

  static final SurMedicationsOrderData _instance = SurMedicationsOrderData._();

  factory SurMedicationsOrderData() => _instance;


  late TabController tabController;
  late GenericBloc<int> tabSelect;
  late GenericBloc<bool> loading;
  late GenericBloc<List<MedicationsOrdersModel>> medicationsOrdersCubit;

  void init(BuildContext context,SingleTickerProviderStateMixin ticker) {
    tabController = TabController(length: 3, vsync: ticker);
    tabSelect = GenericBloc<int>(0);
    loading = GenericBloc<bool>(false);
    medicationsOrdersCubit = GenericBloc<List<MedicationsOrdersModel>>([]);
    getMedicationsOrders(context);
  }
  String get orderNumType => _setOrderNumType();

  String _setOrderNumType (){
    if(tabSelect.state.data == 0){
    return  " Pending Orders";
  }else if (tabSelect.state.data == 1){
    return  " In Progress Orders";}
    else{
      return  " Completed Orders";
    }
}

void getMedicationsOrders ( BuildContext context) async {
    loading.onUpdateData(true);
    var response = await SurgeonRepository(context).getMedicationOrders(tabSelect.state.data);
    medicationsOrdersCubit.onUpdateData(response);
    loading.onUpdateData(false);
  }

  void cancelOrder(BuildContext context, {required String orderId}) async {
    var response = await SurgeonRepository(context).cancelMedicationOrder(orderId: orderId);
    if(response){
      getMedicationsOrders(context);
      navigationKey.currentState!.pop();
    }
  }




  void dispose() {
    tabController.dispose();
  }
}