import 'package:flutter/material.dart';


class ModelBottomSheet extends StatelessWidget {
  const ModelBottomSheet({Key? key, required this.child, this.sheetHeight= 450, this.padding=28.0}) : super(key: key);
  final Widget child;
  final double sheetHeight;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: 50,
              height: 10,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
            ),
            Container(
              height: sheetHeight,
              margin: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadiusDirectional.circular(20),
                  ),
                  child: child,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
