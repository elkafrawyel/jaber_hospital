part of 'LoginWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final LoginData loginData;

  const BuildFormInputs({required this.loginData});

  @override
  Widget build(BuildContext context) {
    var dark = context.watch<ThemeCubit>().state.isDark;
    return Form(
      key: loginData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: 'رقم الجوال/ البريد الالكتروني',
            size: 10,
            fontWeight: FontWeight.bold,
          ),
          GenericTextField(
            hintColor:
                Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            hint: "رقم الجوال/ البريد الالكتروني",
            controller: loginData.phone,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(
            title: tr(context, "password"),
            size: 10,
            fontWeight: FontWeight.bold,
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
                hint: tr(context, "password"),
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
    );
  }
}
