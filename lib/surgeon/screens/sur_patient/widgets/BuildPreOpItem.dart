part of 'SurPatientWImports.dart';

class BuildPreOpItem extends StatelessWidget {
  final int index;

  const BuildPreOpItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PatientModel> list = SurPatientData().patientsCubit.state.data;
    return InkWell(
      onTap: ()=>Nav.navigateTo(SurPatientDetails(), navigatorType: NavigatorType.push) ,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CachedImage(
                    url: list[index].image ?? 'https://picsum.photos/180',
                    height: 60,
                    width: 60,
                    borderRadius: BorderRadius.circular(10),
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MyText(
                                title: list[index].fullNameEn ?? 'Ahmed Ali',
                                size: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 3),
                              decoration: BoxDecoration(
                                color: Color(0xffaff7c3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: MyText(
                                title: 'Ready',
                                size: 9,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyText(
                              title: 'Surgeon : ',
                              size: 11,
                              color: MyColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: list[index].surgeonId?.fullNameEn ??
                                  'Samer Hany',
                              size: 11,
                              color: MyColors.grey,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyText(
                              title: 'Dietitian : ',
                              size: 11,
                              color: MyColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: list[index].dietationId?.fullNameEn ??
                                  'Ahmed Jamil',
                              size: 11,
                              color: MyColors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: MyColors.grey),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        5,
                        (index) => Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                if (index <= 3)
                                  Container(
                                    width: MediaQuery.of(context).size.width / 6,
                                    height: 5,
                                    color: MyColors.primary,
                                  ),
                                CircleAvatar(
                                  backgroundColor: MyColors.primary,
                                  radius: 12.0,
                                  child: Icon(Icons.check,
                                      color: Colors.white, size: 15),
                                ),
                              ],
                            )),
                  ),
                ),
                InkWell(
                  //open
                  onTap: () =>
                      SurPatientData().openOpdDetailsCard(context, list, index),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                        list[index].isOpen == true
                            ? Icons.keyboard_arrow_down
                            : Icons.arrow_forward_ios,
                        size:list[index].isOpen == true? 22:15),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: MyText(
                                  alien: TextAlign.center,
                                  title: "Surgery OPD",
                                  size: 9,
                                  color: MyColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: MyText(
                                  alien: TextAlign.center,
                                  title: "Dietitian",
                                  size: 9,
                                  color: MyColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: MyText(
                                  alien: TextAlign.center,
                                  title: "Physiotherapy",
                                  size: 9,
                                  color: MyColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: MyText(
                                  alien: TextAlign.center,
                                  title: "Education",
                                  size: 9,
                                  color: MyColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: MyText(
                                  alien: TextAlign.center,
                                  title: "Psychology",
                                  size: 9,
                                  color: MyColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            Visibility(
                visible: list[index].isOpen == true,
                child: Divider(color: MyColors.grey)),
            Visibility(
              visible: list[index].isOpen == true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        title: "Surgery OPD Details;",
                        size: 10,
                        fontWeight: FontWeight.bold),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: list[index].egd == true
                                  ? MyColors.primary
                                  : Colors.red,
                              radius: 12.0,
                              child: Icon(
                                  list[index].egd == true
                                      ? Icons.check
                                      : Icons.close,
                                  color: Colors.white,
                                  size: 15),
                            ),
                            const SizedBox(width: 10),
                            MyText(title: "EGD", size: 9),
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: list[index].ultrasound == true
                                  ? MyColors.primary
                                  : Colors.red,
                              radius: 12.0,
                              child: Icon(
                                  list[index].ultrasound == true
                                      ? Icons.check
                                      : Icons.close,
                                  color: Colors.white,
                                  size: 15),
                            ),
                            const SizedBox(width: 10),
                            MyText(title: "US", size: 9),
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: list[index].surgionVisit == true
                                  ? MyColors.primary
                                  : Colors.red,
                              radius: 12.0,
                              child: Icon(
                                  list[index].surgionVisit == true
                                      ? Icons.check
                                      : Icons.close,
                                  color: Colors.white,
                                  size: 15),
                            ),
                            const SizedBox(width: 10),
                            MyText(title: "Surgery OPD", size: 9),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
