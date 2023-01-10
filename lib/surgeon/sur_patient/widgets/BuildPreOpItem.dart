part  of 'SurPatientWImports.dart';


class BuildPreOpItem extends StatelessWidget {
  const BuildPreOpItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xfff2f2f2),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
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
                            title: 'Samer Hany',
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
                            title: 'Ahmed Jamil',
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 30,top: 30),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              child: Container(
                                color: MyColors.primary,
                                height: 2,
                              ),
                            ),
                            Positioned(
                              bottom: -10,
                              left: -30,
                              child: Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  color: MyColors.primary,
                                  borderRadius:
                                  BorderRadius.circular(100),
                                ),
                                child: Icon(Icons.check,color: Colors.white,size: 20),
                              ),
                            ),
                            Positioned(
                              bottom: -30,
                              left: -20,
                              child: MyText(
                                title: 'Surgery OPD',
                                size: 9,
                                color: MyColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30,top: 30),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              child: Container(
                                color: MyColors.primary,
                                height: 2,
                              ),
                            ),
                            Positioned(
                              bottom: -10,
                              left: -30,
                              child: Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  color: MyColors.primary,
                                  borderRadius:
                                  BorderRadius.circular(100),
                                ),
                                child: Icon(Icons.check,color: Colors.white,size: 20),
                              ),
                            ),
                            Positioned(
                              bottom: -30,
                              left: -20,
                              child: MyText(
                                title: 'Surgery OPD',
                                size: 9,
                                color: MyColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30,top: 30),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              child: Container(
                                color: MyColors.primary,
                                height: 2,
                              ),
                            ),
                            Positioned(
                              bottom: -10,
                              left: -30,
                              child: Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  color: MyColors.primary,
                                  borderRadius:
                                  BorderRadius.circular(100),
                                ),
                                child: Icon(Icons.check,color: Colors.white,size: 20),
                              ),
                            ),
                            Positioned(
                              bottom: -30,
                              left: -20,
                              child: MyText(
                                title: 'Surgery OPD',
                                size: 9,
                                color: MyColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30,top: 30),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              child: Container(
                                color: MyColors.primary,
                                height: 2,
                              ),
                            ),
                            Positioned(
                              bottom: -10,
                              left: -30,
                              child: Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  color: MyColors.primary,
                                  borderRadius:
                                  BorderRadius.circular(100),
                                ),
                                child: Icon(Icons.check,color: Colors.white,size: 20),
                              ),
                            ),
                            Positioned(
                              bottom: -30,
                              left: -20,
                              child: MyText(
                                title: 'Surgery OPD',
                                size: 9,
                                color: MyColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30,top: 30),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            child: Container(
                              color: MyColors.primary,
                              height: 2,
                            ),
                          ),
                          Positioned(
                            bottom: -10,
                            left: -30,
                            child: Container(
                              height: 30,
                              width: 30,
                              margin: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                color: MyColors.primary,
                                borderRadius:
                                BorderRadius.circular(100),
                              ),
                              child: Icon(Icons.check,color: Colors.white,size: 20),
                            ),
                          ),
                          Positioned(
                            bottom: -30,
                            left: -20,
                            child: MyText(
                              title: 'Surgery OPD',
                              size: 9,
                              color: MyColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios,color: MyColors.black,size: 20,)
            ],
          )
        ],
      ),
    );
  }
}
