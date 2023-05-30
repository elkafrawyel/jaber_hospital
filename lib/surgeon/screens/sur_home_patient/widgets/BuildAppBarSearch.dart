part  of'SurHomePatientWImports.dart';


class BuildAppBarSearch extends StatelessWidget with PreferredSizeWidget {
  const BuildAppBarSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 100,
      leadingWidth: 30,
      backgroundColor: MyColors.white,
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 20,left: 20),
        child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios, color: MyColors.primary,size: 30,)),
      ),
      title: Hero(
        tag: "search",
        child: GenericTextField(
          hintColor:
          Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.5),
          fieldTypes: FieldTypes.normal,
          fillColor: MyColors.white,
          hint: "Search Patients",
          controller: SurHomePatientData().search,
          prefixIcon: Icon(Icons.search),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          margin: const EdgeInsets.only(bottom: 20),
          action: TextInputAction.search,
          type: TextInputType.text,
          validate: (value) => value!.noValidate(),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size.fromHeight(70);
}
