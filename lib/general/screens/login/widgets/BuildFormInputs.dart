part of 'LoginWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final LoginData loginData;

  const BuildFormInputs({required this.loginData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: 'رقم الجوال/ البريد الالكتروني',
            size: 10,
            fontWeight: FontWeight.bold,
            // color: MyColors.primary,
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            // fillColor: Theme.of(context).,
            hint:"رقم الجوال/ البريد الالكتروني",
            controller: loginData.phone,
            // hintColor: Colors.red,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.phone,
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(
            title: tr(context, "password"),
            size: 10,
            fontWeight: FontWeight.bold,
            // color: MyColors.primary,
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.password,
            fillColor: MyColors.textFields,

            hint: tr(context, "password"),
            margin: const EdgeInsets.symmetric(vertical: 10),
            controller: loginData.password,
            validate: (value) => value!.validateEmpty(context),
            type: TextInputType.text,
            action: TextInputAction.done,
            onSubmit: () => loginData.userLogin(context),
          ),
        ],
      ),
    );
  }
}
