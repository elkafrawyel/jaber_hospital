import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../comp_instruments_orders/widgets/order_widget.dart';
import '../../../models/orders_response.dart';
import 'inProgress_orders_data.dart';

class InProgressMedicationOrders extends StatefulWidget {
  const InProgressMedicationOrders({Key? key}) : super(key: key);

  @override
  State<InProgressMedicationOrders> createState() => _InProgressOrdersState();
}

class _InProgressOrdersState extends State<InProgressMedicationOrders> {
  InProgressOrdersData ordersData = InProgressOrdersData();

  @override
  void initState() {
    // TODO: implement initState
    ordersData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GenericBloc<OrdersResponse?>,
          GenericState<OrdersResponse?>>(
        bloc: ordersData.inProgressOrdersCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: MyText(
                    title: '${ordersData.inProgressOrders?.length} Orders',
                    size: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ordersData.inProgressOrders!.isNotEmpty
                      ? ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemCount: ordersData.inProgressOrders?.length ?? 0,
                    itemBuilder: (context, index) => OrderItemWidget(
                      index: index,
                      order: ordersData.inProgressOrders![index],
                    ),
                    separatorBuilder: (_, __) =>
                    const SizedBox(height: 8.0),
                  )
                      : Center(
                    child: MyText(
                      title: 'No inProgress Orders',
                      size: 14,
                      color: MyColors.grey,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Expanded(
                child: Center(child: LoadingDialog.showLoadingView()));
          }
        },
      ),
    );
  }
}
