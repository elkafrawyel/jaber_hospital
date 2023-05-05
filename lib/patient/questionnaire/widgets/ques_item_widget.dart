import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../models/answered_question_model.dart';
import '../../models/question_objects.dart';
import '../questionaire_data.dart';

class QuestionItemWidget extends StatefulWidget {
  const QuestionItemWidget({Key? key, required this.questionsObjects}) : super(key: key);
  final QuestionsObjects questionsObjects;

  @override
  State<QuestionItemWidget> createState() => _QuestionItemWidgetState();
}

class _QuestionItemWidgetState extends State<QuestionItemWidget> {
  QuestionnaireData questionnaireData = QuestionnaireData();
  String _selectedScore = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(title: widget.questionsObjects.question??"", size: 11, color: MyColors.primary, fontWeight: FontWeight.bold,),
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
                        value: widget.questionsObjects.score1??"",
                        groupValue: _selectedScore,
                        onChanged: (index) {
                          setState(() {
                            _selectedScore = widget.questionsObjects.score1??"";
                          });
                          questionnaireData.updateQuesAnswered(
                              AnsweredQuestionModel(ques: widget.questionsObjects.question??"",
                                  quesAnswer: widget.questionsObjects.answer1??"",answerScore: _selectedScore));
                        }),
                    Expanded(
                      child: MyText(
                        title: widget.questionsObjects.answer1??"",
                        size: 9,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87
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
                        value: widget.questionsObjects.score2??"",
                        groupValue: _selectedScore,
                        onChanged: (index) {
                          setState(() {
                            _selectedScore = widget.questionsObjects.score2??"";
                          });
                          questionnaireData.updateQuesAnswered(
                              AnsweredQuestionModel(ques: widget.questionsObjects.question??"",
                                  quesAnswer: widget.questionsObjects.answer2??"",answerScore: _selectedScore));
                        }),
                    Expanded(
                      child: MyText(
                        title: widget.questionsObjects.answer2??"",
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
                        value: widget.questionsObjects.score3??"",
                        groupValue: _selectedScore,
                        onChanged: (index) {
                          setState(() {
                            _selectedScore = widget.questionsObjects.score3??"";
                          });
                          questionnaireData.updateQuesAnswered(
                              AnsweredQuestionModel(ques: widget.questionsObjects.question??"",
                                  quesAnswer: widget.questionsObjects.answer3??"",answerScore: _selectedScore));
                        }),
                    Expanded(
                      child: MyText(
                        title: widget.questionsObjects.answer3??"",
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
                        value: widget.questionsObjects.score4??"",
                        groupValue: _selectedScore,
                        onChanged: (index) {
                          setState(() {
                            _selectedScore = widget.questionsObjects.score4??"";
                          });
                          questionnaireData.updateQuesAnswered(
                              AnsweredQuestionModel(ques: widget.questionsObjects.question??"",
                                  quesAnswer: widget.questionsObjects.answer4??"",answerScore: _selectedScore));
                        }),
                    Expanded(
                      child: MyText(
                        title: widget.questionsObjects.answer4??"",
                        size: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
