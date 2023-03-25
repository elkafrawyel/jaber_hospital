part of 'mdt_w_imports.dart';

class BuildNoResultDecision extends StatefulWidget {
  const BuildNoResultDecision({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildNoResultDecision> createState() => _BuildNoResultDecisionState();
}

class _BuildNoResultDecisionState extends State<BuildNoResultDecision> with SingleTickerProviderStateMixin{
  DecisionMdtData decisionMdtData = DecisionMdtData();
  SurMdtDiscussionsData surMdtDiscussionsData = SurMdtDiscussionsData();

  @override
  void initState() {
    // TODO: implement initState
    surMdtDiscussionsData.init(this);
    decisionMdtData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<MdtPatientsResponse?>,
        GenericState<MdtPatientsResponse?>>(
      bloc: decisionMdtData.decisionCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return state.data!.patients!.isNotEmpty? ListView.builder(
                itemCount: state.data?.patients?.length,
                itemBuilder: (context, index) => Container(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                              url: state.data?.patients?[index].image??'https://picsum.photos/186',
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
                                    title: state.data?.patients?[index].fullNameEn??'',
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
                                        title: state.data?.patients?[index].surgeonId?.fullNameEn??"",
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
                                        title: state.data?.patients?[index].dietationId?.fullNameEn??"",
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
                      // DefaultButton(
                      //   title: "Enter Result",
                      //   onTap: () {
                      //     SurMdtDiscussionsData().selectMDTResultCubit.onUpdateData(0);
                      //     showModalBottomSheet(
                      //         context: context,
                      //         backgroundColor: Colors.transparent,
                      //         builder: (context) => BuildMDTResultSheet());
                      //   },
                      //   margin: const EdgeInsets.symmetric(
                      //       horizontal: 100, vertical: 5),
                      // ),
                    ],
                  ),
                ),): Center(child: MyText(title: 'No data founded', size: 12,),);
        } else {
          return LoadingWidget();
        }
      },
    );
  }
}
