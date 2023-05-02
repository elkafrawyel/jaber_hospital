import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../general/widgets/GenScaffold.dart';
import 'questionaire_data.dart';

class QuestionnaireCompletedScreen extends StatefulWidget {
  const QuestionnaireCompletedScreen({Key? key}) : super(key: key);

  @override
  State<QuestionnaireCompletedScreen> createState() => _QuestionnaireCompletedScreenState();
}

class _QuestionnaireCompletedScreenState extends State<QuestionnaireCompletedScreen> {
  QuestionnaireData questionnaireData = QuestionnaireData();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: questionnaireData.curPageCubit,
        builder: (context, state) {
          return GeneralScaffold(
            back: true,
            title: "استبيان نفسي(1/6)",
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: questionnaireData.questionnairePages[questionnaireData.curPageCubit.state.data]),
                const SizedBox(height: 16.0,),
                DefaultButton(
                  title: "الاستمرار",
                  onTap: () => questionnaireData.nextPage(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
