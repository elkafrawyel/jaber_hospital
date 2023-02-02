part of 'SurPatientWImports.dart';


class BuildPrePostItem extends StatelessWidget {
  final int index;
  const BuildPrePostItem({
    Key? key, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PatientModel> list = SurPatientData().patientsCubit.state.data;
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
                  url: list[index].image?? 'https://picsum.photos/182',
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
                        title:list[index].fullNameEn?? 'Ahmed Ali',
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
                            title: list[index].surgeonId?.fullNameEn??'Samer Hany',
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
                            title: list[index].dietationId?.fullNameEn??'Ahmed Jamil',
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
                      title:list[index].operationType?? 'Laparoscopic RYGBP',
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
                      title: list[index].operationDate?.split("T").first??'16 August 2022',
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
    );
  }
}
