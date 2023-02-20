import 'package:base_flutter/company/comp_home/home_data.dart';
import 'package:base_flutter/company/models/comp_home_orders_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'hrizontal_order_widget.dart';

class BuildNewOrders extends StatelessWidget {
  const BuildNewOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
                title: 'New Orders',
                size: 12,
                fontWeight: FontWeight.bold),
            MyText(
              title: 'See All',
              size: 10,
              fontWeight: FontWeight.bold,
              color: MyColors.primary,
              decoration: TextDecoration.underline,
            ),
          ],
        ),
        Container(
          height: 110,
          child: BlocBuilder<GenericBloc<CompOrdersResponse?>, GenericState<CompOrdersResponse?>>(
            bloc: CompHomeData().homeCubit,
            builder: (context, state) {
              if(state is GenericUpdateState){
                if(state.data!.data!.companyOrdersInProgress!.isNotEmpty){
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.data?.data?.companyOrdersInProgress?.length??0,
                    itemBuilder: (context, index) => HorizontalOrderWidget(index: index,orderModel: state.data?.data?.companyOrdersInProgress?[index],),
                  );
                }else{
                  return Center(
                    child: MyText(
                      title: 'No New Orders',
                      size: 12,
                      color: MyColors.grey,
                    ),
                  );
                }
              }else{
                return  Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: MyColors.greyWhite,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    height: MediaQuery.of(context).size.height / 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MyColors.white,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
