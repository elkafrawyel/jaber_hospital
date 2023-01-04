part of 'LoginWidgetsImports.dart';

class BuildSelectAuthType extends StatelessWidget {
  const BuildSelectAuthType({
    Key? key,
    required this.loginData,
  }) : super(key: key);

  final LoginData loginData;

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
          bloc: loginData.selectAuthType,
          builder: (context, state) {
            return Row(
              children: List.generate(
                  3,
                  (index) => Expanded(
                        child: InkWell(
                          onTap: () {
                            loginData.selectAuthType.onUpdateData(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                              color: MyColors.textFields,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: index == state.data
                                    ? MyColors.primary
                                    : MyColors.textFields,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: index == state.data
                                              ? MyColors.primary
                                              : MyColors.grey),
                                      color: index == state.data
                                          ? MyColors.primary
                                          : MyColors.white,
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
                                  child: MyText(
                                    title: loginData.authTypesList[index],
                                    size: 10,
                                    color: index == state.data
                                        ? MyColors.primary
                                        : MyColors.blackOpacity,
                                    fontWeight: index == state.data
                                        ? FontWeight.bold
                                        : null,
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
