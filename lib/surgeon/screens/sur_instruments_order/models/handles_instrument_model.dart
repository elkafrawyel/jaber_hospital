class HandlesModel {
  String? headerTitle;
  List<String>? handles;
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
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.sId;
  //   return data;
  // }
}
