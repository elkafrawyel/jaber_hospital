import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class GeneralProgress extends StatelessWidget {
  const GeneralProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                  title: 'التقدم العام', size: 12, fontWeight: FontWeight.bold),
            ],
          ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        5,
                            (index) => Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            if (index >= 1&&index <= 4)
                              Container(
                                width: MediaQuery.of(context).size.width / 5,
                                height: 5,
                                color: MyColors.primary,
                              ),
                            CircleAvatar(
                              backgroundColor: MyColors.primary,
                              radius: 12.0,
                              child: Icon(Icons.check,
                                  color: Colors.white, size: 15),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: MyText(
                                  alien: TextAlign.center,
                                  title: "الجراحة",
                                  size: 9,
                                  color: MyColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: MyText(
                                  alien: TextAlign.center,
                                  title: "التغذية",
                                  size: 9,
                                  color: MyColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: MyText(
                                  alien: TextAlign.center,
                                  title: "العلاج الطبيعي",
                                  size: 9,
                                  color: MyColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: MyText(
                                  alien: TextAlign.center,
                                  title: "التعليم",
                                  size: 9,
                                  color: MyColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: MyText(
                                  alien: TextAlign.center,
                                  title: "النفسية",
                                  size: 9,
                                  color: MyColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey),
            const SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                      title: "تفاصيل الجراحة:",
                      size: 10,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: MyColors.primary,
                            radius: 12.0,
                            child: Icon(Icons.check,
                                color: Colors.white,
                                size: 15),
                          ),
                          const SizedBox(width: 10),
                          MyText(title: "الجراحة", size: 9),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:  MyColors.primary,
                            radius: 12.0,
                            child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15),
                          ),
                          const SizedBox(width: 10),
                          MyText(title: "التنظير", size: 9),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:  MyColors.primary,
                            radius: 12.0,
                            child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15),
                          ),
                          const SizedBox(width: 10),
                          MyText(title: "الموجات فوق الصوتية", size: 9),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}
