import 'package:flutter/material.dart';
import '../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class CheckItemWidget extends StatelessWidget {
  const CheckItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, color: Colors.white),
        ),
        Expanded(
          child: MyText(title: "12 MM", size: 10),
        )
      ],
    );
  }
}
