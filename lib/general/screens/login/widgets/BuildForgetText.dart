part of 'LoginWidgetsImports.dart';

class BuildForgetText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: LoginData().rememberMeBloc,
            builder: (context, state) {
              return Row(
                children: [
                  Checkbox(
                      value: state.data,
                      onChanged: (value) =>
                          LoginData().rememberMeBloc.onUpdateData(value!)),
                  MyText(
                    title: 'Remember Me',
                    size: 11,
                    color: MyColors.blackOpacity,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              );
            },
          ),
          InkWell(
            onTap: () => Nav.navigateTo(
              ForgetPassword(),
              navigatorType: NavigatorType.push,
            ),
            child: MyText(
              title: 'Forget Password ?',
              size: 10,
              decoration: TextDecoration.underline,
              color: MyColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
