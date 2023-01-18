part of 'mdt_w_imports.dart';

class DecisionMDT extends StatelessWidget {
  const DecisionMDT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BlocBuilder<GenericBloc<int>, GenericState<int>>(
            bloc: SurMdtDiscussionsData().decisionType,
            builder: (context, state) {
              return Row(
                children: [
                  InkWell(
                    onTap: () {
                      SurMdtDiscussionsData().decisionType.onUpdateData(0);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 7),
                      decoration: BoxDecoration(
                        color: state.data == 0 ? Color(0xffd3e0f6) :Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: state.data == 0
                              ? MyColors.primary
                              : MyColors.grey,
                          width: state.data == 0 ? 2 : 1,
                        ),
                      ),
                      child: MyText(
                        title: 'No Result',
                        size: 12,
                        color: state.data == 0
                            ? MyColors.primary
                            : MyColors.grey,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      SurMdtDiscussionsData().decisionType.onUpdateData(1);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 7),
                      decoration: BoxDecoration(
                        color: state.data == 1 ? Color(0xffd3e0f6) :Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: state.data == 1
                              ? MyColors.primary
                              : MyColors.grey,
                          width: state.data == 1 ? 2 : 1,
                        ),
                      ),
                      child: MyText(
                        title: 'Results',
                        size: 12,
                        color: state.data == 1
                            ? MyColors.primary
                            : MyColors.grey,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        BlocBuilder<GenericBloc<int>, GenericState<int>>(
            bloc: SurMdtDiscussionsData().decisionType,
            builder: (context, state) {
              if (state.data == 0) {
                return BuildNoResultDecision();
              } else {
                return Expanded(
                  child: ListView.builder(
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
                            const Divider(),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  MyText(
                                    title: 'MDT Result : ',
                                    size: 11,
                                    color: MyColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  MyText(
                                    title: 'Accept',
                                    size: 11,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                );
              }
            }),
      ],
    );
  }
}

