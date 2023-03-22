part of '../mdt_w_imports.dart';

class BookedMDT extends StatefulWidget {
  const BookedMDT({Key? key}) : super(key: key);

  @override
  State<BookedMDT> createState() => _BookedMDTState();
}

class _BookedMDTState extends State<BookedMDT> {
  BookedMdtData bookedMdtData = BookedMdtData();
  bool isFirst = true;

  @override
  void initState() {
    // TODO: implement initState
    bookedMdtData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<MdtPatientsResponse?>,
        GenericState<MdtPatientsResponse?>>(
      bloc: bookedMdtData.bookedCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: MyText(
                  title: '${state.data?.patients?.length} Patients',
                  size: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(child: ListView.builder(
                itemCount: state.data?.patients?.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: (){
                    String curMonDay = "";
                    var monday=1;
                    if(isFirst){
                      var now = new DateTime.now();
                      log("today==> $now");
                      curMonDay = nextDay(now);
                    } else{
                      var localDate = DateTime.parse(curMonDay);
                      curMonDay = nextDay(localDate);
                    }
                    // while(now.weekday!=monday)
                    // {
                    //   now=now.add(new Duration(days: 1));
                    // }
                    // log('Recent monday $now');
                    // // print('Recent monday $now');
                    //
                    // var sevenDaysFromNow = now.add(new Duration(days: 7));
                    // log('next monday $sevenDaysFromNow');
                    // // print(now.next(DateTime.monday).weekday == DateTime.monday);
                    // //
                    // // // Works as expected when the next day is after sunday
                    // print("next==> ${now.next(DateTime.monday)}");
                    // print(today.next(DateTime.monday).weekday == DateTime.monday);
                  },
                  child: Container(
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
                                url: state.data?.patients?[index].image??'https://picsum.photos/122',
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
                                            title: state.data?.patients?[index].fullNameEn??'',
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
                                  title: state.data?.patients?[index].mdtDateTime??"",
                                  size: 11,
                                  color: MyColors.primary,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        BuildBookTimesDialog(),
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

  String nextDay(DateTime date){
    print("date==> $date");
    print("next==> ${date.next(DateTime.monday)}");
    DateTime next = date.next(DateTime.monday);
    final DateFormat dateFormat = new DateFormat('yyyy-MMMM-dd');
    String formattedDay = dateFormat.format(next);
    return formattedDay;
  }
}
