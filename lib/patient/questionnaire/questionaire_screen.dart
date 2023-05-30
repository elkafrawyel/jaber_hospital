import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/constants/MyColors.dart';
import '../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../general/utilities/utils_functions/LoadingDialog.dart';
import '../models/question_objects.dart';
import 'questionaire_data.dart';
import 'widgets/ques_appbar.dart';
import 'widgets/ques_item_widget.dart';

class QuestionnaireCompletedScreen extends StatefulWidget {
  const QuestionnaireCompletedScreen({Key? key}) : super(key: key);

  @override
  State<QuestionnaireCompletedScreen> createState() => _QuestionnaireCompletedScreenState();
}

class _QuestionnaireCompletedScreenState extends State<QuestionnaireCompletedScreen> {
  QuestionnaireData questionnaireData = QuestionnaireData();
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    questionnaireData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: BuildQuesAppBar(questionnaireData: questionnaireData),
        body: BlocBuilder<GenericBloc<List<QuestionsObjects>?>,
            GenericState<List<QuestionsObjects>?>>(
          bloc: questionnaireData.questionsCubit,
          builder: (context, state) {
            log("questionnaireState=> ${state.data}");
            if (state is GenericUpdateState) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: state.data!.isNotEmpty
                            ? SingleChildScrollView(
                          controller: _scrollController,
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: List.generate(state.data!.length, (index) =>QuestionItemWidget(
                              questionsObjects: state.data![index],
                            ),),
                          ),
                        )
                            : Center(
                          child: MyText(
                            title: 'لا يوجد أسئلة',
                            size: 14,
                            color: MyColors.grey,
                          ),
                        )),
                    const SizedBox(
                      height: 16.0,
                    ),
                    DefaultButton(
                      title: "الاستمرار",
                      onTap: () async{
                        log("answers==> ${questionnaireData.answeredQuestions.length}");
                        if(questionnaireData.questionsMap[questionnaireData.curQuesPage] != (questionnaireData.answersMap[questionnaireData.curQuesPage]??[]).length){
                          CustomToast.showSnackBar(context, "يجب استكمال أسئلة الاستبيان اولا");
                          return;
                        }
                        int page = int.parse(questionnaireData.questionnaireResponse?.pageInfo?.page??"");
                        int totalPages = questionnaireData.questionnaireResponse?.pageInfo?.total??1;
                        if (page < totalPages) {
                          log('page=> $page, total=> $totalPages');
                          _scrollController.animateTo(0, duration: Duration(milliseconds: 500),curve: Curves.ease);
                          await questionnaireData.nextPage(context);
                        } else {
                          /// finish it
                          log('page=> $page, total=> $totalPages');
                          await questionnaireData.sendQuestionnaireResult(context,
                              questionnaireData.questionnaireResponse?.data?[0].sId??"");
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                  ]);
            } else {
              return Center(child: LoadingDialog.showLoadingView());
            }
          },
        ),
      ),
    );
  }
}
