import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../general/widgets/loading_widget.dart';
import '../../../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../comp_instruments_orders/widgets/order_widget.dart';
import '../../../models/orders_response.dart';
import 'received_orders_data.dart';

class ReceivedMedicationOrders extends StatefulWidget {
  const ReceivedMedicationOrders({Key? key}) : super(key: key);

  @override
  State<ReceivedMedicationOrders> createState() => _ReceivedOrdersState();
}

class _ReceivedOrdersState extends State<ReceivedMedicationOrders> {
  ReceivedOrdersData ordersData = ReceivedOrdersData();

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
        bloc: ordersData.ordersCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: MyText(
                    title: '${ordersData.receivedOrders?.length} Orders',
                    size: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ordersData.receivedOrders!.isNotEmpty
                      ? ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemCount: ordersData.receivedOrders?.length ?? 0,
                          itemBuilder: (context, index) => OrderItemWidget(
                            index: index,
                            order: ordersData.receivedOrders![index],
                          ),
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8.0),
                        )
                      : Center(
                          child: MyText(
                            title: 'No Received Orders',
                            size: 14,
                            color: MyColors.grey,
                          ),
                        ),
                ),
              ],
            );
          } else {
            return Center(child: LoadingDialog.showLoadingView());
          }
        },
      ),
    );
  }
}
