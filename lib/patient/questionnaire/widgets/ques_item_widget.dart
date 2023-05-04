import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../models/question_objects.dart';

class QuestionItemWidget extends StatelessWidget {
  const QuestionItemWidget({Key? key, required this.questionsObjects}) : super(key: key);
  final QuestionsObjects questionsObjects;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(title: questionsObjects.question??"", size: 11, color: MyColors.black, fontWeight: FontWeight.bold,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                horizontalTitleGap: 1.0,
                contentPadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    Radio(
                        activeColor: MyColors.primary,
                        value: questionsObjects.score1??"",
                        groupValue: questionsObjects.question??"",
                        onChanged: (index) {
                          // setState(() {
                          //   selectedHandle = "Short";
                          // });
                        }),
                    Expanded(
                      child: MyText(
                        title: questionsObjects.answer1??"",
                        size: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                horizontalTitleGap: 1.0,
                contentPadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    Radio(
                        activeColor: MyColors.primary,
                        value: questionsObjects.score2??"",
                        groupValue: questionsObjects.question??"",
                        onChanged: (index) {
                          // setState(() {
                          //   selectedHandle = "Short";
                          // });
                        }),
                    Expanded(
                      child: MyText(
                        title: questionsObjects.answer2??"",
                        size: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                horizontalTitleGap: 1.0,
                contentPadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    Radio(
                        activeColor: MyColors.primary,
                        value: questionsObjects.score3??"",
                        groupValue: questionsObjects.question??"",
                        onChanged: (index) {
                          // setState(() {
                          //   selectedHandle = "Short";
                          // });
                        }),
                    Expanded(
                      child: MyText(
                        title: questionsObjects.answer3??"",
                        size: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                horizontalTitleGap: 1.0,
                contentPadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    Radio(
                        activeColor: MyColors.primary,
                        value: questionsObjects.score4??"",
                        groupValue: questionsObjects.question??"",
                        onChanged: (index) {
                          // setState(() {
                          //   selectedHandle = "Short";
                          // });
                        }),
                    Expanded(
                      child: MyText(
                        title: questionsObjects.answer4??"",
                        size: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
