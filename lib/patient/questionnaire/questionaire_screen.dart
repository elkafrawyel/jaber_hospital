import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/constants/MyColors.dart';
import '../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../general/widgets/GenScaffold.dart';
import '../models/question_objects.dart';
import 'questionaire_data.dart';
import 'widgets/ques_item_widget.dart';

class QuestionnaireCompletedScreen extends StatefulWidget {
  const QuestionnaireCompletedScreen({Key? key}) : super(key: key);

  @override
  State<QuestionnaireCompletedScreen> createState() => _QuestionnaireCompletedScreenState();
}

class _QuestionnaireCompletedScreenState extends State<QuestionnaireCompletedScreen> {
  QuestionnaireData questionnaireData = QuestionnaireData();

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
      child: BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: questionnaireData.curPageCubit,
        builder: (context, state) {
          return GeneralScaffold(
            back: true,
            title: "استبيان نفسي(${state.data}/${questionnaireData.questionnaireResponse?.pageInfo?.total})",
            body: BlocBuilder<GenericBloc<List<QuestionsObjects>?>,
                GenericState<List<QuestionsObjects>?>>(
              bloc: questionnaireData.questionsCubit,
              builder: (context, state) {
                if (state is GenericUpdateState) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: state.data!.isNotEmpty
                                ? SingleChildScrollView(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: List.generate(state.data!.length, (index) =>QuestionItemWidget(
                           questionsObjects: state.data![index],
                       ),),
                              ),
                            )
                            //     ? ListView.separated(
                            //   padding: const EdgeInsets.all(10),
                            //   scrollDirection: Axis.vertical,
                            //   physics: const BouncingScrollPhysics(),
                            //   itemCount: state.data?.length ?? 0,
                            //   itemBuilder: (context, index) =>
                            //       QuestionItemWidget(
                            //         questionsObjects: state.data![index],
                            //       ),
                            //   separatorBuilder: (_, __) => const Divider(color: Colors.grey),
                            // )
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
                            if(state.data?.length != questionnaireData.answeredQuestions.length){
                              CustomToast.showSnackBar(context, "يجب استكمال أسئلة الاستبيان اولا");
                              return;
                            }
                            bool hasNext = questionnaireData.questionnaireResponse?.pageInfo?.hasNext??false;
                            if (hasNext && state.data!.isNotEmpty) {
                              log('hasNext=> $hasNext');
                              await questionnaireData.nextPage(context);
                            } else {
                              /// finish it
                              log('notHasNext=> $hasNext');
                              await questionnaireData.sendQuestionnaireResult(context,
                                  questionnaireData.questionnaireResponse?.data?[0].sId??"");
                            }
                          },
                        ),
                      ]);
                } else {
                  return Center(child: LoadingDialog.showLoadingView());
                }
              },
            ),
          );
        },
      ),
    );
  }
}
