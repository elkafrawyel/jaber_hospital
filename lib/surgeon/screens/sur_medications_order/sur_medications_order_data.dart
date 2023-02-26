part of 'sur_medications_order_imports.dart';


class SurMedicationsOrderData {
  SurMedicationsOrderData._();

  static final SurMedicationsOrderData _instance = SurMedicationsOrderData._();

  factory SurMedicationsOrderData() => _instance;


  late TabController tabController;
  late GenericBloc<int> tabSelect;

  void init(SingleTickerProviderStateMixin ticker) {
    tabController = TabController(length: 3, vsync: ticker);
    tabSelect = GenericBloc<int>(0);
  }


  String _setOrderNumType (){
    if(tabSelect.state.data == 0){
    return  " Pending Orders";
  }else if (tabSelect.state.data == 1){
    return  " In Progress Orders";}
    else{
      return  " Completed Orders";
    }
}


String get orderNumType => _setOrderNumType();

  void dispose() {
    tabController.dispose();
  }
}