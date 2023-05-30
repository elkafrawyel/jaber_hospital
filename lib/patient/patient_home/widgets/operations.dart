import 'package:flutter/material.dart';

import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'operation_widget.dart';

class OperationsDate extends StatelessWidget {
  const OperationsDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(title: 'تاريخ العملية', size: 12, fontWeight: FontWeight.bold),
          ],
        ),
        Container(
          height: 110,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (context, index) => OperationWidget(index: index,),
          ),
        ),
      ],
    );
  }
}
