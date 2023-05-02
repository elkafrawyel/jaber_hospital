import 'package:flutter/material.dart';

import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'pages/ques_page_five.dart';
import 'pages/ques_page_four.dart';
import 'pages/ques_page_one.dart';
import 'pages/ques_page_six.dart';
import 'pages/ques_page_three.dart';
import 'pages/ques_page_two.dart';

class QuestionnaireData{
  QuestionnaireData._();

  static QuestionnaireData patientQuestionnaireData = QuestionnaireData._();

  factory QuestionnaireData() => patientQuestionnaireData;

  late PageController pageController;
  late GenericBloc<int> curPageCubit;

  void initScreen(BuildContext context) async {
    pageController = PageController();
    curPageCubit = GenericBloc(0);
    onPageChanged();
  }

  void dispose() {
    pageController.dispose();
  }

  final List<Widget> questionnairePages = [
    QuesPageOne(),
    QuesPageTwo(),
    QuesPageThree(),
    QuesPageFour(),
    QuesPageFive(),
    QuesPageSix(),
  ];

  void nextPage() {
    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
    curPageCubit.onUpdateData(curPageCubit.state.data + 1);
  }

  void onPageChanged() {
    pageController.addListener(() {
      int nextPage = pageController.page!.round();
      curPageCubit.onUpdateData(nextPage + 1);
    });
  }
}