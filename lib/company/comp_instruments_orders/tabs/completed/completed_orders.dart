import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../general/widgets/loading_widget.dart';
import '../../../models/orders_response.dart';
import '../../widgets/instruments_order_widget.dart';
import 'completed_orders_data.dart';

class CompletedOrders extends StatefulWidget {
  const CompletedOrders({Key? key,}) : super(key: key);

  @override
  State<CompletedOrders> createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
  CompletedOrdersData ordersData = CompletedOrdersData();

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
        bloc: ordersData.completedOrdersCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: MyText(
                    title: '${ordersData.completedOrders?.length} Orders',
                    size: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ordersData.completedOrders!.isNotEmpty? ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemCount: ordersData.completedOrders?.length??0,
                    itemBuilder: (context, index) => InstrumentsOrderWidget(index: index,order: ordersData.completedOrders![index]),
                    separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                  ): Center(
                    child: MyText(
                      title: 'No Completed Orders',
                      size: 14,
                      color: MyColors.grey,
                    ),
                  ),
                )
              ],
            );
          } else {
            return LoadingWidget();
          }
        },
      ),
    );
  }
}
