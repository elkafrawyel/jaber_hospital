part of 'RegisterWidgetsImports.dart';

class BuildRegisterInputs extends StatelessWidget {
  final RegisterData registerData;

  const BuildRegisterInputs({Key? key, required this.registerData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dark = context.watch<ThemeCubit>().state.isDark;
    return Form(
      key: registerData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: 'الاسم',
            size: 10,
            fontWeight: FontWeight.bold,
          ),
          GenericTextField(
            hintColor:
                Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            hint: "الاسم",
            controller: registerData.name,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(
            title: 'رقم الجوال',
            size: 10,
            fontWeight: FontWeight.bold,
          ),
          GenericTextField(
            hintColor:
                Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            hint: "رقم الجوال",
            controller: registerData.phone,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.phone,
            validate: (value) => value!.validatePhone(context),
          ),
          MyText(
            title: 'البريد الالكتروني',
            size: 10,
            fontWeight: FontWeight.bold,
          ),
          GenericTextField(
            hintColor:
                Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            hint: "البريد الالكتروني",
            controller: registerData.email,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value!.validateEmail(context),
          ),
          MyText(
            title: 'كلمة المرور',
            size: 10,
            fontWeight: FontWeight.bold,
          ),
          BlocBuilder<GenericBloc, GenericState>(
            bloc: registerData.passwordBloc,
            builder: (context, state) {
              return GenericTextField(
                fieldTypes:
                state.data ? FieldTypes.password : FieldTypes.normal,
                hint: 'كلمة المرور',
                controller: registerData.password,
                action: TextInputAction.next,
                fillColor: dark ? Colors.transparent : MyColors.textFields,
                type: TextInputType.text,
                validate: (value) => value!.validatePassword(context),
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
                    registerData.passwordBloc.onUpdateData(!state.data);
                  },
                ),
                margin: const EdgeInsets.symmetric(vertical: 10),
              );
            },
          ),
          MyText(
            title: 'تأكيد كلمة المرور',
            size: 10,
            fontWeight: FontWeight.bold,
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: registerData.confirmPasswordBloc,
            builder: (context, state) {
              return GenericTextField(
                fieldTypes:
                state.data ? FieldTypes.password : FieldTypes.normal,
                hint: 'تأكيد كلمة المرور',
                controller: registerData.confirmPassword,
                action: TextInputAction.done,
                type: TextInputType.text,
                fillColor: dark ? Colors.transparent : MyColors.textFields,
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.validatePasswordConfirm(context,
                    pass: registerData.password.text),
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
                    registerData.confirmPasswordBloc
                        .onUpdateData(!state.data);
                  },
                ),
                onSubmit: () {},
              );
            },
          ),

        ],
      ),
    );
  }
}
