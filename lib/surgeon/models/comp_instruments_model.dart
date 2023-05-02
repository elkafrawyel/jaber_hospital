import '../../../../general/models/instrument_model.dart';

class CompInstrumentsModel {
  String? headerTitle;
  List<String>? handles;
  List<InstrumentModel>? instruments;
  bool isExpanded;

  CompInstrumentsModel({this.headerTitle, this.handles, this.instruments, this.isExpanded=false});
}
