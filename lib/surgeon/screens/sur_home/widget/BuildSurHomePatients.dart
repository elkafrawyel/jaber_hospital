part of 'SurHomeWImports.dart';

class BuildSurHomePatients extends StatelessWidget {
  const BuildSurHomePatients({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: MyText(
              title: 'Patients',
              size: 12,
              fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: ()=>Nav.navigateTo(SurPatient(index: 0,), navigatorType: NavigatorType.push),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: MyColors.greyWhite,
                        spreadRadius: .1,
                        blurRadius: 1,
                        offset: const Offset(-1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(Res.imagesMyPatients,scale: 2.5,),
                      const SizedBox(height: 5),
                      MyText(title: 'My Patients',size: 10,fontWeight: FontWeight.bold,)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: GestureDetector(
                onTap: ()=>Nav.navigateTo(SurPatient(index: 1), navigatorType: NavigatorType.push),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: MyColors.greyWhite,
                        spreadRadius: .3,
                        blurRadius: 3,
                        offset: const Offset(-1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(Res.imagesAllPatients,scale: 2.5,),
                      const SizedBox(height: 5),
                      MyText(title: 'All Patients',size: 10,fontWeight: FontWeight.bold,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
