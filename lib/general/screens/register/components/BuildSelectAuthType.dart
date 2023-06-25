import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/MyColors.dart';
import '../../../utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../utilities/tf_custom_widgets/widgets/MyText.dart';
import '../registerData.dart';

class BuildSelectAuthType extends StatelessWidget {
  BuildSelectAuthType({
    Key? key,
  }) : super(key: key);

  final RegisterData registerData = RegisterData();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: 'Choose Your Account Type',
          size: 14,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),
        BlocBuilder<GenericBloc<int>, GenericState<int>>(
          bloc: registerData.selectAuthType,
          builder: (context, state) {
            return Row(
              children: List.generate(
                  3,
                  (index) => Expanded(
                        child: InkWell(
                          onTap: () {
                            registerData.selectAuthType.onUpdateData(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                            decoration: BoxDecoration(
                              color: MyColors.textFields,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: index == state.data ? MyColors.primary : MyColors.textFields,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: index == state.data ? MyColors.primary : MyColors.grey),
                                      color: index == state.data ? MyColors.primary : MyColors.white,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: index == state.data
                                      ? Icon(
                                          Icons.check,
                                          color: MyColors.white,
                                          size: 15,
                                        )
                                      : const SizedBox(),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Center(
                                      child: MyText(
                                        title: registerData.authTypesList[index],
                                        size: 10,
                                        color: index == state.data ? MyColors.primary : MyColors.blackOpacity,
                                        fontWeight: index == state.data ? FontWeight.bold : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
            );
          },
        ),
      ],
    );
  }
}
