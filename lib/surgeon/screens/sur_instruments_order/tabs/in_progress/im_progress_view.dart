import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../models/instrument_order_model.dart';
import '../../widgets/sur_instrument_widget.dart';
import 'inprogress_data.dart';

class InProgressView extends StatefulWidget {
  const InProgressView({Key? key}) : super(key: key);

  @override
  State<InProgressView> createState() => _InProgressViewState();
}

class _InProgressViewState extends State<InProgressView> {
  InProgressData inProgressData = InProgressData();

  @override
  void initState() {
    // TODO: implement initState
    inProgressData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<InstrumentOrderModel>?>,
        GenericState<List<InstrumentOrderModel>?>>(
      bloc: inProgressData.inProgressCubit,
      builder: (context, state) {
        log("state=> $state");
        if (state is GenericUpdateState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: MyText(
                  title: '${state.data?.length} Orders',
                  size: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: state.data!.isNotEmpty
                    ? ListView.builder(
                  itemCount: state.data?.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      SurInstrumentOrderWidget(
                        index: index,
                        ordersModel: state.data![index],
                      ),
                )
                    : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: MyText(
                      title:
                      'No orders founded',
                      size: 14,
                      color: MyColors.grey,
                      alien: TextAlign.center,
                    ),
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
    );
  }
}
