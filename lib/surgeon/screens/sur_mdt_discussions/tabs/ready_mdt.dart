part of 'mdt_w_imports.dart';

class ReadyMDT extends StatelessWidget {
  const ReadyMDT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                          url: 'https://picsum.photos/186',
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
                  DefaultButton(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 5),
                    title: "Book MDT",
                    onTap: () {
                      SurMdtDiscussionsData().mdtDurationCubit.onUpdateData(0);
                     showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => BuildPatientMDTDurationSheet());
                    },
                  ),
                ],
              ),
            ));
  }
}

