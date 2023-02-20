import 'package:flutter/material.dart';

import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../res/res.dart';

class BuildOverallProgress extends StatelessWidget {
  const BuildOverallProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: MyText(
              title: 'Overall Progress',
              size: 12,
              fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 7,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xff136CFB),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      Res.imagesOperationsIcon,
                      scale: 3,
                    ),
                    const SizedBox(height: 5),
                    MyText(
                      title: '330',
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Center(
                        child: MyText(
                            alien: TextAlign.center,
                            title: 'Instruments',
                            size: 9,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 7,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xff00116E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      Res.requestsIcon,
                      scale: 3,
                      width: 20,
                      height: 20,
                      fit:BoxFit.cover,
                    ),
                    const SizedBox(height: 5),
                    MyText(
                      title: '750',
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Center(
                        child: MyText(
                            alien: TextAlign.center,
                            title: 'Requests',
                            size: 9,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 7,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xff455BD8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      Res.imagesOrder,
                      scale: 3,
                      width: 20,
                      height: 20,
                      color: Colors.white,
                      fit: BoxFit.cover
                    ),
                    const SizedBox(height: 5),
                    MyText(
                      title: '312',
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Center(
                        child: FittedBox(
                          child: MyText(
                              alien: TextAlign.center,
                              title: 'Completed Orders',
                              size: 9,
                              // overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
