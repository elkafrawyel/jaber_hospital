part of 'SurPatientWImports.dart';


class BuildPrePostView extends StatelessWidget {
  const BuildPrePostView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Container(
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
                          MyText(
                            title: 'Ahmed Ali',
                            size: 12,
                            fontWeight: FontWeight.bold,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyText(
                          title: 'Operation Type : ',
                          size: 11,
                          color: MyColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        MyText(
                          title: 'Laparoscopic RYGBP',
                          size: 11,
                          color: MyColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyText(
                          title: 'Operation Done On : ',
                          size: 11,
                          color: MyColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        MyText(
                          title: '16 August 2022',
                          size: 11,
                          color: MyColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
