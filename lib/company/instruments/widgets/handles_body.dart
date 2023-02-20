import 'package:flutter/material.dart';

import '../../../general/models/instrument_model.dart';
import 'header_widget.dart';
import 'instrument_list_item.dart';

class InstrumentsBody extends StatelessWidget {
  const InstrumentsBody({Key? key,required this.instrumentModel}) : super(key: key);
  final InstrumentModel instrumentModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(title: instrumentModel.code),
        InstrumentsItemWidget(itemDesc: instrumentModel.description),
        // ListView.builder(
        //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //   shrinkWrap: true,
        //   physics: NeverScrollableScrollPhysics(),
        //   itemCount: 4,
        //   itemBuilder: (context, index) => InstrumentsItemWidget(index: index, itemDesc: "Long Handles",),
        // ),
      ],
    );
  }
}
