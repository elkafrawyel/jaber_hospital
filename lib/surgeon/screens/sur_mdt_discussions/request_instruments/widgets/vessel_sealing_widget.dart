import 'package:flutter/material.dart';

class VesselSealingWidget extends StatefulWidget {
  const VesselSealingWidget({Key? key}) : super(key: key);

  @override
  State<VesselSealingWidget> createState() => _VesselSealingWidgetState();
}

class _VesselSealingWidgetState extends State<VesselSealingWidget> {

  List<String> data = ["item1", "item2", "item3"];

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('ExpansionTile'),
      children: data.map((data) {
        return ListTile(title: Text(data));
      }).toList());
  }
}
