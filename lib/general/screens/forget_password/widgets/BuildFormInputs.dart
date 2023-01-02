part of 'ForgetPasswordWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ForgerPasswordData forgerPasswordData;

  const BuildFormInputs({required this.forgerPasswordData});

  @override
  Widget build(BuildContext context) {
    var dark = context.watch<ThemeCubit>().state.isDark;
    return Form(
      key: forgerPasswordData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            margin: const EdgeInsets.symmetric(vertical: 10),
            hint: 'Please Enter Your Email Address',
            controller: forgerPasswordData.email,
            action: TextInputAction.done,
            type: TextInputType.emailAddress,
            validate: (value) => value!.validateEmail(context),
            onSubmit: () => forgerPasswordData.onForgetPassword(context),
          ),
        ],
      ),
    );
  }
}
