part of 'SurHomePatientImports.dart';

class SurHomePatient extends StatefulWidget {
  const SurHomePatient({Key? key}) : super(key: key);

  @override
  State<SurHomePatient> createState() => _SurHomePatientState();
}

class _SurHomePatientState extends State<SurHomePatient> {
  @override
  void initState() {
    SurHomePatientData().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: BuildAppBarSearch(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(Res.imagesNoResult,height: MediaQuery.of(context).size.height/2.5,width: double.infinity,),
              MyText(
                title: 'No Results',
                size: 14,
                color: MyColors.primary,
                fontWeight: FontWeight.bold,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                child: MyText(
                  alien: TextAlign.center,
                  title: 'There are no search results for this till now, please try again later',
                  size: 12,
                  color: MyColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

