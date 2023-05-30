import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../general/constants/MyColors.dart';
import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../general/widgets/GenScaffold.dart';
import '../models/instruments_response.dart';
import 'instruments_data.dart';
import 'widgets/handles_body.dart';

class InstrumentsScreen extends StatefulWidget {
  const InstrumentsScreen({Key? key}) : super(key: key);

  @override
  State<InstrumentsScreen> createState() => _InstrumentsScreenState();
}

class _InstrumentsScreenState extends State<InstrumentsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    InstrumentsData().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        back: true,
        title: "Instruments",
        body: BlocBuilder<GenericBloc<InstrumentsResponse?>, GenericState<InstrumentsResponse?>>(
        bloc: InstrumentsData().instrumentsCubit,
      builder: (context, state) {
        if(state is GenericUpdateState){
          if(state.data!.instruments!.isNotEmpty){
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.data?.instruments?.length??0,
              itemBuilder: (context, index) => InstrumentsBody(instrumentModel: state.data!.instruments![index]),
            );
          }else{
            return Center(
              child: MyText(
                title: 'No Instruments Orders',
                size: 12,
                color: MyColors.grey,
              ),
            );
          }
        }else{
          return Shimmer.fromColors(
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
        // body: ListView(
        //   children: [
        //
        //     InstrumentsBody(),
        //     const SizedBox(height: 10.0),
        //     ReloadsBody(),
        //     const SizedBox(height: 10.0),
        //   ],
        // )
    );
  }
}
