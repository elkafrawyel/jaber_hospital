import 'package:flutter/material.dart';

import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../request_instruments_data.dart';

class RadioCheckItem extends StatefulWidget {
  const RadioCheckItem({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RadioCheckItem> createState() => _RadioCheckItemState();
}

class _RadioCheckItemState extends State<RadioCheckItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
              horizontalTitleGap: 1.0,
              contentPadding: EdgeInsets.zero,
              title: Row(
                children: [
                  Radio(
                      activeColor: MyColors.primary,
                      value: RequestInstrumentsData().selectedHandle,
                      groupValue: "handles",
                      onChanged: (index) {
                        RequestInstrumentsData().selectedHandle = widget.title;
                        setState(() {});
                  }),
                  Expanded(
                    child: MyText(
                      title: widget.title,
                      size: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            );
  }
}
