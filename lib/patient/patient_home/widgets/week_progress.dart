import 'package:flutter/material.dart';

import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../res/res.dart';

class BuildWeekProgress extends StatelessWidget {
  const BuildWeekProgress({
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
              title: 'تقدم هذا الأسبوع',
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
                  color: Color(0xffD84545),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      Res.caloriesIcon,
                      scale: 3,
                      width: 20,
                      height: 20,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: 5),
                    MyText(
                      title: '0',
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Center(
                        child: MyText(
                            alien: TextAlign.center,
                            title: 'سعرات محروقة',
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
                  color: Color(0xffEB7826),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      Res.timerIcon,
                      scale: 3,
                      width: 20,
                      height: 20,
                      fit:BoxFit.cover,
                    ),
                    const SizedBox(height: 5),
                    MyText(
                      title: '0',
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Center(
                        child: MyText(
                            alien: TextAlign.center,
                            title: 'دقيقة مقضية',
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
                  color: Color(0xff24C647),
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
                      title: '0',
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Center(
                        child: FittedBox(
                          child: MyText(
                              alien: TextAlign.center,
                              title: 'خطوات تحركت',
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
