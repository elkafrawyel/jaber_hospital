import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/models/instrument_model.dart';
import '../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../request_instruments_data.dart';

class ReloadsItemWidget extends StatefulWidget {
  const ReloadsItemWidget({Key? key, required this.instrumentModel})
      : super(key: key);
  final InstrumentModel instrumentModel;

  @override
  State<ReloadsItemWidget> createState() => _ReloadsItemWidgetState();
}

class _ReloadsItemWidgetState extends State<ReloadsItemWidget> {
  RequestInstrumentsData requestInstrumentsData = RequestInstrumentsData();

  @override
  void initState() {
    // TODO: implement initState
    widget.instrumentModel.checked = false;
    widget.instrumentModel.quantity = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: widget.instrumentModel.checked??false,
            onChanged: (value) {
              setState(() {
                widget.instrumentModel.checked = value;
              });
              if (value ?? false)
                requestInstrumentsData.selectedInstrumentsList.add(widget.instrumentModel);
              else
                requestInstrumentsData.selectedInstrumentsList.remove(widget.instrumentModel);
            },
          ),
          const SizedBox(
            width: 6.0,
          ),
          Expanded(
              child: MyText(
            title: widget.instrumentModel.description ?? "",
            size: 10,
          )),
          Visibility(
            visible: widget.instrumentModel.checked ?? false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => requestInstrumentsData.onChangeCounter(
                        isAdd: false, instrumentModel: widget.instrumentModel),
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
                      title: widget.instrumentModel.quantity.toString(),
                      // title: state.data[index].quantity.toString(),
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ),
                  InkWell(
                    onTap: () => requestInstrumentsData.onChangeCounter(
                        isAdd: true, instrumentModel: widget.instrumentModel),
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
