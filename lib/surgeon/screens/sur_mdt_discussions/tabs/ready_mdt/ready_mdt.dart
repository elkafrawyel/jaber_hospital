part of '../mdt_w_imports.dart';

class ReadyMDT extends StatefulWidget {
  const ReadyMDT({Key? key}) : super(key: key);

  @override
  State<ReadyMDT> createState() => _ReadyMDTState();
}

class _ReadyMDTState extends State<ReadyMDT> {
  ReadyMdtData readyData = ReadyMdtData();

  @override
  void initState() {
    // TODO: implement initState
    readyData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<MdtPatientModel>?>,
        GenericState<List<MdtPatientModel>?>>(
      bloc: readyData.readyCubit,
      builder: (context, state) {
        log("state=> $state");
        if (state is GenericUpdateState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: MyText(
                  title: '${state.data?.length} Patients',
                  size: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: state.data!.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.data?.length,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Color(0xfff2f2f2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    CachedImage(
                                      url: state.data?[index].image??'https://picsum.photos/186',
                                      height: 60,
                                      width: 60,
                                      borderRadius: BorderRadius.circular(10),
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: MyText(
                                                  title: "${state.data?[index].firstNameEn} ${state.data?[index].lastNameEn}",
                                                  size: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 3),
                                                decoration: BoxDecoration(
                                                  color: Color(0xffaff7c3),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
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
                                                title: "${state.data?[index].surgeonId?.firstNameEn} ${state.data?[index].surgeonId?.lastNameEn}",
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
                                                title: "${state.data?[index].dietationId?.firstNameEn} ${state.data?[index].dietationId?.lastNameEn}",
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
                                  SurMdtDiscussionsData()
                                      .mdtDurationCubit
                                      .onUpdateData(0);
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) =>
                                          BuildPatientMDTDurationSheet(patientId: state.data?[index].id??"", index: index));
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: MyText(
                            title: 'There are no ready patients at the moment,  start booking for the patients, and check later',
                            size: 14,
                            color: MyColors.grey,
                            alien: TextAlign.center,
                          ),
                        ),
                      ),
              ),
            ],
          );
        } else {
          return LoadingWidget();
        }
      },
    );
  }
}
