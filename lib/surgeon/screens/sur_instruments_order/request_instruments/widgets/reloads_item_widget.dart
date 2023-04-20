import 'package:flutter/material.dart';

import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class ReloadsItemWidget extends StatelessWidget {
  const ReloadsItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Container(
          //   padding: const EdgeInsets.all(1.0),
          //   decoration: BoxDecoration(
          //     color: Colors.grey.shade100,
          //     shape: BoxShape.circle,
          //   ),
          //   child: Icon(Icons.check, color: Colors.white),
          // ),
          Checkbox(
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(
            width: 6.0,
          ),
          Expanded(
              child: MyText(
            title: 'Blue Echelon Reload 60 MM',
            size: 9,
          )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: MyColors.primary)),
                  child: Icon(Icons.add)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: MyText(
                  title: '4',
                  size: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: MyColors.primary)),
                  child: Icon(Icons.remove)),
            ],
          ),
        ],
      ),
    );
  }
}
