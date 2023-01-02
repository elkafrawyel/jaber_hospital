part of 'ConfirmPasswordWidgetsImports.dart';

class BuildButtonList extends StatelessWidget {
  final ConfirmPasswordData confirmPasswordData;
  final String userId;
  final String email;

  const BuildButtonList(
      {required this.confirmPasswordData,
      required this.userId,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingButton(
          title: "Confirm",
          onTap: () => confirmPasswordData.onSendCode(context, userId: userId),
          color: MyColors.primary,
          margin: const EdgeInsets.symmetric(
            horizontal: 100,
          ),
          btnKey: confirmPasswordData.btnKey,
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: confirmPasswordData.checkSendCubit,
          builder: (context, state) {
            return Visibility(
              visible: state.data,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    title: 'OTP Code will be expired in ',
                    color: MyColors.blackOpacity,
                    size: 12,
                  ),
                  SizedBox(width: 5),
                  BlocBuilder<GenericBloc<int>, GenericState<int>>(
                    bloc: confirmPasswordData.currentSecondCubit,
                    builder: (context, state) {
                      return MyText(
                        title: "${confirmPasswordData.timerText}",
                        color: MyColors.primary,
                        size: 12,
                        fontWeight: FontWeight.bold,
                      );
                    },
                  ),
                ],
              ),
              replacement: BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                bloc: confirmPasswordData.reSendCubit,
                builder: (context, state) {
                  return Visibility(
                    visible: state.data,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          title: tr(context, "noReceiveCode"),
                          size: 12,
                          color: MyColors.blackOpacity,
                        ),
                        InkWell(
                          onTap: () {
                            confirmPasswordData.onResendCode(context,
                                email: email, userId: userId);
                          },
                          child: MyText(
                            title: tr(context, "sendCode"),
                            size: 12,
                            color: MyColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
