part of 'SurPatientDetailsImports.dart';

class SurPatientDetails extends StatefulWidget {
  const SurPatientDetails({Key? key}) : super(key: key);

  @override
  State<SurPatientDetails> createState() => _SurPatientDetailsState();
}

class _SurPatientDetailsState extends State<SurPatientDetails> {
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      back: true,
      title: "Patient Details",
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        children: [
          Container(
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
                        url: 'https://picsum.photos/180',
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
                                    title: 'Ahmed Ali',
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
                                  title:
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
                                  title:
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
                Divider(color: MyColors.grey),
                Padding(
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
                                backgroundColor:  MyColors.primary
                                    ,
                                radius: 12.0,
                                child: Icon(Icons.check,
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
                                backgroundColor: MyColors.primary,

                                radius: 12.0,
                                child: Icon(

                                        Icons.check
                                        ,
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
                                backgroundColor:
                                     MyColors.primary
                                    ,
                                radius: 12.0,
                                child: Icon(

                                         Icons.check,

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
                )
              ],
            ),
          ),
          MyText(title: "Doctors Info", size: 14, fontWeight: FontWeight.bold,color: MyColors.primary),
          Row(
            children: [
              MyText(title: "Surgeon:", size: 12, fontWeight: FontWeight.bold),
              MyText(title: "You", size: 12, fontWeight: FontWeight.bold,color: MyColors.primary,),

            ],
          ),
          Row(
            children: [
              MyText(title: "Dietitian:", size: 12, fontWeight: FontWeight.bold),
              MyText(title: "Ahmed Jamil", size: 12, fontWeight: FontWeight.bold,color: MyColors.greyWhite,),

            ],
          ),
          Row(
            children: [
              MyText(title: "Physiotherapist:", size: 12, fontWeight: FontWeight.bold),
              MyText(title: "Tamer Mohsen", size: 12, fontWeight: FontWeight.bold,color: MyColors.greyWhite,),

            ],
          ),
          Row(
            children: [
              MyText(title: "Educator:", size: 12, fontWeight: FontWeight.bold),
              MyText(title: "Youssef Diaa", size: 12, fontWeight: FontWeight.bold,color: MyColors.greyWhite,),

            ],
          ),
          Row(
            children: [
              MyText(title: "Psychologist:", size: 12, fontWeight: FontWeight.bold),
              MyText(title: "Shady Essam", size: 12, fontWeight: FontWeight.bold,color: MyColors.greyWhite,),

            ],
          ),
        ],
      ),
    );
  }
}
