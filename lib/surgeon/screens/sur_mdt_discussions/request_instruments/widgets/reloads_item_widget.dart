import 'package:flutter/material.dart';

import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class ReloadsItemWidget extends StatelessWidget {
  const ReloadsItemWidget({Key? key}) : super(key: key);

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
        Expanded(child: MyText(title: '', size: 9,)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: MyColors.primary)
              ),
              child: Icon(Icons.add)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: MyText(title: '', size: 9,),
            ),
            Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: MyColors.primary)
                ),
                child: Icon(Icons.remove)
            ),
          ],
        ),
      ],
    );
  }
}
