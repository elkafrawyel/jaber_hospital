import '../../../../general/models/instrument_model.dart';

class HandlesModel {
  String? headerTitle;
  List<String>? handles;
  List<InstrumentModel>? instruments;
  bool isExpanded;

  HandlesModel({this.headerTitle, this.handles, this.isExpanded=false});

  // HandlesModel.fromJson(Map<String, dynamic> json) {
  //   headerTitle = json['_id'];
  //   if (json['data'] != null) {
  //     handles = <InstrumentModel>[];
  //     json['data'].forEach((v) {
  //       handles!.add(InstrumentModel.fromJson(v));
  //     });
  //   }
  // }
}
