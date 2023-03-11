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
                padding: const EdgeInsets.only(bottom: 0,left: 20,right: 20,top: 20),
                decoration: BoxDecoration(
                  color: Color(0xff136CFB),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      Res.imagesShape,
                      scale: 3,
                    ),
                    const SizedBox(height: 5),
                    MyText(
                      title: '110',
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    Flexible(
                      child: MyText(
                          alien: TextAlign.center,
                          title: 'Sessions Done',
                          size: 9,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 7,
                padding: const EdgeInsets.only(bottom: 0,left: 20,right: 20,top: 20),
                decoration: BoxDecoration(
                  color: Color(0xff00116E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      Res.imagesMinutesIcon,
                      scale: 3,
                    ),
                    const SizedBox(height: 5),
                    MyText(
                      title: '750',
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    Flexible(
                      child: MyText(
                          alien: TextAlign.center,
                          title: 'Minutes Spent',
                          size: 9,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 7,
                padding: const EdgeInsets.only(bottom: 0,left: 20,right: 20,top: 20),
                decoration: BoxDecoration(
                  color: Color(0xff455BD8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      Res.imagesWeightLossIcon,
                      scale: 3,
                    ),
                    const SizedBox(height: 5),
                    MyText(
                      title: '88%',
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    Flexible(
                      child: MyText(
                          alien: TextAlign.center,
                          title: 'Weight Loss Success',
                          size: 9,
                          // overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
