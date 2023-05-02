import 'package:flutter/material.dart';

import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/models/instrument_model.dart';
import '../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class ReloadsItemWidget extends StatelessWidget {
  const ReloadsItemWidget({Key? key, required this.instrumentModel, this.isChecked= false}) : super(key: key);
  final InstrumentModel instrumentModel;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {

            },
          ),
          const SizedBox(
            width: 6.0,
          ),
          Expanded(
              child: MyText(
            title: 'Blue Echelon Reload 60 MM',
            size: 9,
          )),
          Visibility(
            visible: isChecked ?? false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child:Row(
                children: [
                  InkWell(
                    // onTap: ()=> SurOrderMedicationsData().onChangeCounter(index: index, isAdd: false),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        border: Border.all(
                          color: MyColors.primary,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: MyColors.primary,
                        size: 20,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyText(
                      title: "11",
                      // title: state.data[index].quantity.toString(),
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // SurOrderMedicationsData().onChangeCounter(index: index, isAdd: true);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: MyColors.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.add,
                        color: MyColors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
