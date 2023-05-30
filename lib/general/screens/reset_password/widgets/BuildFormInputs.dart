part of 'ResetPasswordWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ResetPasswordData resetPasswordData;
  final String userId;

  const BuildFormInputs(
      {required this.resetPasswordData, required this.userId});

  @override
  Widget build(BuildContext context) {
    var dark = context.watch<ThemeCubit>().state.isDark;
    return Form(
      key: resetPasswordData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<GenericBloc, GenericState>(
            bloc: resetPasswordData.passwordBloc,
            builder: (context, state) {
              return GenericTextField(
                fieldTypes:
                    state.data ? FieldTypes.password : FieldTypes.normal,
                hint: tr(context, "newPass"),
                controller: resetPasswordData.password,
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
                    resetPasswordData.passwordBloc.onUpdateData(!state.data);
                  },
                ),
                margin: const EdgeInsets.symmetric(vertical: 10),
              );
            },
          ),
        ],
      ),
    );
  }
}
