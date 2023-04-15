part of 'SurHomeWImports.dart';

class BuildSurHomeSearchPatient extends StatelessWidget {
  const BuildSurHomeSearchPatient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericTextField(
      hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.5),
      fieldTypes: FieldTypes.clickable,
      fillColor: MyColors.white,
      hint: "Search Patients",
      controller: SurHomeData().search,
      prefixIcon: Icon(Icons.search),
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      margin: const EdgeInsets.only(bottom: 20),
      action: TextInputAction.search,
      type: TextInputType.text,
      // onTab: () => Nav.navigateTo(SearchScreen(), navigatorType: NavigatorType.push),
      validate: (value) => value!.noValidate(),
    );
  }
}
