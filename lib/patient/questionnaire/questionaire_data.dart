import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/MyApp.dart';
import '../../general/blocks/user_cubit/user_cubit.dart';
import '../../general/models/UserModel.dart';
import '../../general/network/api_service.dart';
import '../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../general/utilities/http/dio/utils/DioUtils.dart';
import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../general/utilities/utils_functions/ApiNames.dart';
import '../../general/utilities/utils_functions/Navigator.dart';
import '../models/answered_question_model.dart';
import '../models/question_objects.dart';
import '../models/questionaire_model.dart';
import '../resources/PatientRepository.dart';
import 'questionnaire_result_screen.dart';

class QuestionnaireData{
  QuestionnaireData._();

  static QuestionnaireData patientQuestionnaireData = QuestionnaireData._();

  factory QuestionnaireData() => patientQuestionnaireData;

  late GenericBloc<int> curPageCubit;
  late GenericBloc<List<QuestionsObjects>?> questionsCubit;
  QuestionnaireResponse? questionnaireResponse;
  int curQuesPage = 1;
  List<AnsweredQuestionModel> answeredQuestions = [];
  List<QuestionsObjects>? curQues = [];

  void init(BuildContext context) async{
    this.curPageCubit = GenericBloc<int>(1);
    this.questionsCubit = GenericBloc<List<QuestionsObjects>?>([]);
    await fetchPatientQuestionnaire(context, curQuesPage);
    answeredQuestions = [];
  }

  Future<void> fetchPatientQuestionnaire(BuildContext context,int page) async {
    curQues = [];
    questionnaireResponse = await PatientRepository(context).getPatientQuestionnaire(page);
    curQues = questionnaireResponse?.data?[0].questionsObjects??[];
    log("Questionnaire=> ${questionnaireResponse?.data?[0].questionsObjects?.length}");
    log("curQues=> ${curQues?.length}");
    curPageCubit.onUpdateData(page);
    questionsCubit.onUpdateData(curQues);
  }

  Future<void> nextPage(BuildContext context) async{
    curQuesPage++;
    curPageCubit.onUpdateData(curQuesPage);
    await fetchPatientQuestionnaire(context, curQuesPage);
  }

  void updateQuesAnswered(AnsweredQuestionModel answeredModel){
    log("answeredModel=> ${answeredModel.quesId}, ${answeredModel.answerScore}");
    if(answeredQuestions.any((item) => item.quesId == answeredModel.quesId)){
      log("contains true...");
      AnsweredQuestionModel ansModel = answeredQuestions.firstWhere((element) => element.quesId == answeredModel.quesId);
      ansModel.answerScore = answeredModel.answerScore;
    } else{
      log("contains false...");
      answeredQuestions.add(answeredModel);
    }
    log("answeredQuestions=> ${answeredQuestions.length}");
  }

  Future<void> sendQuestionnaireResult(BuildContext context, String quesId) async {
    UserModel? users = context.read<UserCubit>().state.model;
      DioUtils.showLoadingDialog();
      List<dynamic> answers = answeredQuestions.map((item) => {
        "Question1": item.ques,
        "answer2":item.quesAnswer,
        "score2":item.answerScore,
      }).toList();
      Map<String, dynamic> body = {
        "status": true,
        "questionnaire_id": quesId,
        "patient_id": users.userData?[0].sId??"",
        "answers_objects": answers,
      };
      log("instrumentsOrderBody=> $body");
      final response = await ApiService.post(ApiNames.questionnaireAnsPath, body: body,);
      log("responseData==> ${response.data}");
      DioUtils.dismissDialog();
      if(response.statusCode==200){
        CustomToast.showSnackBar(context, response.data["message"]["message_en"]);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const QuestionnaireResultScreen()),
        );
      } else{
        CustomToast.showSnackBar(context, response.data["message"]["message_en"]);
      }
  }
}