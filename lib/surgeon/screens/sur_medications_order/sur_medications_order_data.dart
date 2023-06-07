part of 'sur_medications_order_imports.dart';

class SurMedicationsOrderData {
  SurMedicationsOrderData._();

  static final SurMedicationsOrderData _instance = SurMedicationsOrderData._();

  factory SurMedicationsOrderData() => _instance;

  late TabController tabController;
  late GenericBloc<int> tabSelect;
  late GenericBloc<bool> loading;
  late GenericBloc<List<MedicationsOrdersModel>> medicationsOrdersCubit;

  late GenericBloc<List<CompanyId>?> companiesCubit;
  late GenericBloc<List<MedicationModel>?> companyMedicationsCubit;
  List<MedicationModel> medications = [];
  CompanyId? selectedCompany;
  String ordersStatus = "routed to company";

  void init(BuildContext context, SingleTickerProviderStateMixin ticker) {
    tabController = TabController(length: 3, vsync: ticker);
    tabSelect = GenericBloc<int>(0);
    loading = GenericBloc<bool>(false);
    medicationsOrdersCubit = GenericBloc<List<MedicationsOrdersModel>>([]);
    getMedicationsOrders(context, ordersStatus);
  }

  String get orderNumType => _setOrderNumType();

  String _setOrderNumType() {
    if (tabSelect.state.data == 0) {
      ordersStatus = "routed to company";
      return ordersStatus;
      // return " Pending Orders";
    } else if (tabSelect.state.data == 1) {
      ordersStatus = "inprogress";
      return ordersStatus;
      // return " In Progress Orders";
    } else {
      ordersStatus = "completed";
      return ordersStatus;
      // return " Completed Orders";
    }
  }

  Future<void> getMedicationsOrders(BuildContext context, String status) async {
    loading.onUpdateData(true);
    var response = await SurgeonRepository(context).getMedicationOrders(ordersStatus);
    medicationsOrdersCubit.onUpdateData(response);
    loading.onUpdateData(false);
  }

  Future<bool> cancelOrder(BuildContext context,
      {required String orderId}) async {
    var response = await SurgeonRepository(context)
        .cancelMedicationOrder(orderId: orderId);
    if (response) {
      getMedicationsOrders(context, ordersStatus);
      navigationKey.currentState!.pop();
      navigationKey.currentState!.pop();
      return response;
    }
    return false;
  }

  void dispose() {
    tabController.dispose();
  }
}
