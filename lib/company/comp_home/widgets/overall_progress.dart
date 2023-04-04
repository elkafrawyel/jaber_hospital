import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../res/res.dart';
import '../../models/comp_home_orders_response.dart';
import '../home_data.dart';

class BuildOverallProgress extends StatelessWidget {
  const BuildOverallProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: MyText(
              title: 'Overall Progress',
              size: 12,
              fontWeight: FontWeight.bold),
        ),
        BlocBuilder<GenericBloc<CompOrdersResponse?>, GenericState<CompOrdersResponse?>>(
          bloc: CompHomeData().homeCubit,
          builder: (context, state) {
            if(state is GenericUpdateState){
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 7,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xff136CFB),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            Res.imagesOperationsIcon,
                            scale: 3,
                          ),
                          const SizedBox(height: 5),
                          MyText(
                            title: '0',
                            size: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Center(
                              child: MyText(
                                  alien: TextAlign.center,
                                  title: 'Instruments',
                                  size: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 7,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xff00116E),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            Res.requestsIcon,
                            scale: 3,
                            width: 20,
                            height: 20,
                            fit:BoxFit.cover,
                          ),
                          const SizedBox(height: 5),
                          MyText(
                            title: '0',
                            size: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Center(
                              child: MyText(
                                  alien: TextAlign.center,
                                  title: 'Requests',
                                  size: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 7,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xff455BD8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                              Res.imagesOrder,
                              scale: 3,
                              width: 20,
                              height: 20,
                              color: Colors.white,
                              fit: BoxFit.cover
                          ),
                          const SizedBox(height: 5),
                          MyText(
                            title: '${state.data?.data?.companyOrdersCompleted?.length}',
                            size: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Center(
                              child: FittedBox(
                                child: MyText(
                                    alien: TextAlign.center,
                                    title: 'Completed Orders',
                                    size: 9,
                                    // overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
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
      ],
    );
  }
}
