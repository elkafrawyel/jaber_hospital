import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import '../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../questionaire_data.dart';
import '../../../general/MyApp.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';


class BuildQuesAppBar extends StatelessWidget implements PreferredSizeWidget {
  QuestionnaireData? questionnaireData;
  BuildQuesAppBar({Key? key, required this.questionnaireData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 30,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => navigationKey.currentState!.pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: MyColors.primary,
        ),
      ),
      title: BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: questionnaireData?.curPageCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return Text.rich(
              TextSpan(
                text: 'استبيان نفسي',
                style: WidgetUtils.textStyle.copyWith(color: MyColors.primary, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ' (',
                    style: WidgetUtils.textStyle.copyWith(color: MyColors.primary, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '${state.data}/${questionnaireData?.questionnaireResponse?.pageInfo?.total}',
                    style: WidgetUtils.textStyle.copyWith(
                        color: state.data == 7 ? MyColors.primary : MyColors.black, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ')',
                    style: WidgetUtils.textStyle.copyWith(color: MyColors.primary, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox(
              height: 36,
              child: Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: MyColors.greyWhite,
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  height: MediaQuery.of(context).size.height / 6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyColors.white,
                  ),
                ),
              ),
            );;
          }
        },
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);
}
