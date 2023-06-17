part of 'mdt_w_imports.dart';

class BuildResultDecision extends StatefulWidget {
  const BuildResultDecision({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildResultDecision> createState() => _BuildResultDecisionState();
}

class _BuildResultDecisionState extends State<BuildResultDecision> with SingleTickerProviderStateMixin {
  DecisionMdtData decisionMdtData = DecisionMdtData();
  SurMdtDiscussionsData surMdtDiscussionsData = SurMdtDiscussionsData();

  @override
  void initState() {
    // TODO: implement initState
    surMdtDiscussionsData.init(context, this);
    decisionMdtData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<MdtPatientsResponse?>, GenericState<MdtPatientsResponse?>>(
      bloc: decisionMdtData.decisionCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return state.data!.patients!.isNotEmpty
              ? ListView.builder(
                  itemCount: state.data?.patients?.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Nav.navigateTo(
                      SurPatientDetails(patientId: state.data?.patients?[index].id ?? ""),
                      navigatorType: NavigatorType.push,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                CachedImage(
                                  url: state.data?.patients?[index].image ?? 'https://picsum.photos/186',
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
                                        title:
                                            '${state.data?.patients?[index].firstNameEn ?? ''} ${state.data?.patients?[index].lastNameEn ?? ''}',
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
                                          const SizedBox(width: 2.0),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              MyText(
                                                title: state.data?.patients?[index].surgeonId?.firstNameEn ?? "",
                                                size: 11,
                                                color: MyColors.grey,
                                              ),
                                              MyText(
                                                title: state.data?.patients?[index].surgeonId?.lastNameEn ?? "",
                                                size: 11,
                                                color: MyColors.grey,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          MyText(
                                            title: 'Dietitian : ',
                                            size: 11,
                                            color: MyColors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const SizedBox(width: 3.0),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              MyText(
                                                title: state.data?.patients?[index].dietationId?.firstNameEn ?? "",
                                                size: 11,
                                                color: MyColors.grey,
                                              ),
                                              MyText(
                                                title: state.data?.patients?[index].dietationId?.lastNameEn ?? "",
                                                size: 11,
                                                color: MyColors.grey,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          MyText(
                                            title: 'MDT Result : ',
                                            size: 10,
                                            color: MyColors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const SizedBox(width: 3.0),
                                          MyText(
                                            title: (state.data?.patients?[index].mdtResults ?? '').toCapitalized(),
                                            size: 10,
                                            color: (state.data?.patients?[index].mdtResults == "accept")
                                                ? MyColors.primary
                                                : (state.data?.patients?[index].mdtResults == "refuse")
                                                    ? Colors.red
                                                    : Colors.green,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Center(
                  child: MyText(
                    title: 'No data founded',
                    size: 12,
                  ),
                );
        } else {
          return Center(child: LoadingDialog.showLoadingView());
        }
      },
    );
  }
}
