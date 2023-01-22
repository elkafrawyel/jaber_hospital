import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SignificantLabsModel  extends Equatable{
   String? labName;
   bool isSelected;
   TextEditingController? resultController;

  SignificantLabsModel({
    this.labName,
    this.isSelected = false,
    this.resultController,
  });


  static List<SignificantLabsModel> initList = [
    SignificantLabsModel(labName: "HB",resultController: TextEditingController(text: "")),
    SignificantLabsModel(labName: "WBC",resultController: TextEditingController(text: "")),
    SignificantLabsModel(labName: "Platelets",resultController: TextEditingController(text: "")),
    SignificantLabsModel(labName: "INR",resultController: TextEditingController(text: "")),
    SignificantLabsModel(labName: "Aptt",resultController: TextEditingController(text: "")),
    SignificantLabsModel(labName: "HbA1c",resultController: TextEditingController(text: "")),

  ];

  @override
  List<Object?> get props =>[labName,isSelected,resultController];

}