import 'dart:developer';

import 'package:base_flutter/general/models/company_model.dart';
import 'package:flutter/material.dart';

import '../utilities/tf_custom_widgets/widgets/MyText.dart';

class AppDropMenu<T> extends StatefulWidget {
  final List<CompanyId> items;
  final Function(CompanyId?) onChanged;
  final String hint;
  final CompanyId? selectedItem;
  final bool isBordered;
  final bool isUnderLined;
  final double radius;
  final bool expanded;
  final Color? backgroundColor;
  final bool centerHint;

  AppDropMenu({
    this.selectedItem,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.isBordered = false,
    this.isUnderLined = false,
    this.radius = 8,
    this.expanded = false,
    Key? key,
    this.backgroundColor,
    this.centerHint = false,
  }) : super(key: key);

  @override
  State<AppDropMenu<T>> createState() => AppDropMenuState<T>();
}

class AppDropMenuState<T> extends State<AppDropMenu<T>> {

  @override
  Widget build(BuildContext context) {
    // log("selectedItem==> ${widget.selectedItem?.id}, ${widget.selectedItem?.name}, ${widget.selectedItem?.desc},");
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: widget.isBordered
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius),
              border: Border.all(color: Colors.black),
              color: widget.backgroundColor ?? Colors.white,
            )
          : BoxDecoration(color: widget.backgroundColor ?? Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton<CompanyId>(
        value: widget.selectedItem,
        hint: Align(
          alignment:
              widget.centerHint ? AlignmentDirectional.center : AlignmentDirectional.centerStart,
          child: Text(widget.selectedItem == null ? widget.hint : widget.selectedItem?.companyNameEn??"",
          maxLines: 1, textAlign: TextAlign.center, style:const TextStyle(fontSize: 12,),),
        ),
        isExpanded: widget.expanded,
        iconEnabledColor: Colors.black,
        iconSize: 25,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: widget.items.isEmpty
            ? []
            : widget.items
                .map((item){
                      return DropdownMenuItem<CompanyId>(
                        child: MyText(
                          title: item.companyNameEn.toString(), size: 11,
                        ),
                        value: item,
                      );
                    }).toList(),
        onChanged: (value) {
          setState(() {
            // widget.selectedItem = value;
          });
          widget.onChanged(value);
        },
      ),
    );
  }
}
