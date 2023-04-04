import 'package:flutter/material.dart';

import '../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class RadioCheckItem extends StatelessWidget {
  const RadioCheckItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: Colors.white),
          ),
          const SizedBox(width: 6.0,),
          Expanded(child: MyText(title: 'Blue Echelon Reload 60 MM', size: 9,)),
        ],
      ),
    );
  }
}
