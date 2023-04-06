part of 'LoginWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final LoginData loginData;

  const BuildFormInputs({required this.loginData});

  @override
  Widget build(BuildContext context) {
    var dark = context.watch<ThemeCubit>().state.isDark;
    return Form(
      key: loginData.formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<GenericBloc<int>, GenericState<int>>(
              bloc: loginData.selectAuthType,
              builder: (context, state) {
                return GenericTextField(
                  hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                  fieldTypes: FieldTypes.normal,
                  fillColor: dark ? Colors.transparent : MyColors.textFields,
                  hint:
                      state.data==1 ? "Enter Your fileNo" : "Enter Your Email",
                  controller:
                      state.data==1 ? loginData.civilId : loginData.email,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.text,
                  validate: (value) {
                    if (state.data==1) {
                      return value!.isEmpty ? "File no required" : null;
                    } else {
                      return value!.validateEmail(context);
                    }
                  },
                );
              },
            ),
            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: loginData.passwordBloc,
              builder: (context, state) {
                return GenericTextField(
                  hintColor: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.color
                      ?.withOpacity(.8),
                  fieldTypes:
                      state.data ? FieldTypes.password : FieldTypes.normal,
                  fillColor: dark ? Colors.transparent : MyColors.textFields,
                  hint: "Enter Your Password",
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  controller: loginData.password,
                  validate: (value) => value!.validatePassword(context),
                  type: TextInputType.text,
                  action: TextInputAction.done,
                  suffixIcon: IconButton(
                    icon: state.data
                        ? Icon(
                            Icons.visibility,
                            size: 20,
                            color: Colors.grey,
                          )
                        : Icon(
                            Icons.visibility_off,
                            size: 20,
                            color: Colors.grey,
                          ),
                    onPressed: () {
                      loginData.passwordBloc.onUpdateData(!state.data);
                    },
                  ),
                  onSubmit: () => loginData.userLogin(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
