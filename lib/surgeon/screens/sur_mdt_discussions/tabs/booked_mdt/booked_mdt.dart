part of '../mdt_w_imports.dart';

class BookedMDT extends StatefulWidget {
  const BookedMDT({Key? key}) : super(key: key);

  @override
  State<BookedMDT> createState() => _BookedMDTState();
}

class _BookedMDTState extends State<BookedMDT> {
  BookedMdtData bookedMdtData = BookedMdtData();

  @override
  void initState() {
    // TODO: implement initState
    bookedMdtData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<MdtPatientModel>?>,
        GenericState<List<MdtPatientModel>?>>(
      bloc: bookedMdtData.bookedCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: MyText(
                  title: '${state.data?.length} Patients',
                  size: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(child: ListView.builder(
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            CachedImage(
                              url: state.data?[index].image??'https://picsum.photos/122',
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
                                          title: '${state.data?[index].firstNameEn} ${state.data?[index].lastNameEn}',
                                          size: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 3),
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
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            MyText(
                              title: 'MDT Date : ',
                              size: 11,
                              color: MyColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            Expanded(
                              child: MyText(
                                title: state.data?[index].mdtDateTime??"",
                                size: 11,
                                color: MyColors.primary,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      BuildBookTimesDialog(patientId: state.data?[index].id??""),
                                );
                              },
                              child: MyText(
                                title: '(Change)',
                                size: 11,
                                decoration: TextDecoration.underline,
                                color: MyColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),),),
            ],
          );
        } else {
          return LoadingWidget();
        }
      },
    );
  }

  DateTime nextDay(DateTime date){
    print("date==> $date");
    date.add(Duration(days: 7));
    print("next==> ${date.add(Duration(days: 7))}");
    // DateTime next = date.next(DateTime.monday);
    return date;
  }
}
