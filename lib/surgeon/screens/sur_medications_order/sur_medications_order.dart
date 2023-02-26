part of 'sur_medications_order_imports.dart';

class SurMedicationOrder extends StatefulWidget {
  const SurMedicationOrder({Key? key}) : super(key: key);

  @override
  State<SurMedicationOrder> createState() => _SurMedicationOrderState();
}

class _SurMedicationOrderState extends State<SurMedicationOrder>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SurMedicationsOrderData().init(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        back: true,
        title: "Medications Orders",
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              controller: SurMedicationsOrderData().tabController,
              onTap: (index) {
                SurMedicationsOrderData().tabSelect.onUpdateData(index);
              },
              indicatorColor: MyColors.primary,
              labelColor: MyColors.primary,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelStyle: WidgetUtils.textStyle
                  .copyWith(color: MyColors.grey, fontSize: 14),
              labelStyle: WidgetUtils.textStyle.copyWith(
                  color: MyColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              unselectedLabelColor: MyColors.grey,
              tabs: [
                Tab(
                  child: Text("Routed to Company"),
                ),
                Tab(
                  child: Text("In Progress"),
                ),
                Tab(
                  child: Text("Completed"),
                ),
              ],
            ),
            BlocBuilder<GenericBloc<int>, GenericState<int>>(
              bloc: SurMedicationsOrderData().tabSelect,
              builder: (context, state) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: MyText(
                    title: '4 ${SurMedicationsOrderData().orderNumType}',
                    size: 13,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return BuildMedicationItem();
                },
                itemCount: 4,
              ),
            ),
            DefaultButton(
              title: "Order Medications",
              onTap: () =>Nav.navigateTo(SurMedicationRequestDetails(), navigatorType: NavigatorType.push),
              margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            ),
          ],
        ));
  }
}





class BuildMedicationItem extends StatelessWidget {
  const BuildMedicationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: MyColors.grey, spreadRadius: 1, blurRadius: 5)
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: MyColors.primary.withOpacity(.1),
                      borderRadius: BorderRadius.circular(100)),
                  child: Image.asset(
                    Res.imagesOrdersDrawer,
                    color: MyColors.primary,
                    scale: 3,
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      title: "Order #1",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 5),
                    MyText(
                      title: "Liraglutide",
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(Res.imagesCalendar,
                                  scale: 3, color: MyColors.primary),
                              const SizedBox(width: 5),
                              MyText(
                                title: "14 AUG 2022",
                                size: 10,
                                color: MyColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            Image.asset(Res.imagesTime,
                                scale: 2, color: MyColors.primary),
                            const SizedBox(width: 5),
                            MyText(
                              title: "14:30 PM",
                              size: 10,
                              color: MyColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          BlocBuilder<GenericBloc<int>, GenericState<int>>(
            bloc: SurMedicationsOrderData().tabSelect,
  builder: (context, state) {
    return Visibility(
            visible: SurMedicationsOrderData().tabSelect.state.data == 1 || SurMedicationsOrderData().tabSelect.state.data==2,
            child: Column(
              children: [
                const Divider(),
                Row(
                  children: [
                    Icon(Icons.circle, color: MyColors.primary, size: 10),
                    const SizedBox(width: 5),
                    MyText(
                      title: "Changed to ${SurMedicationsOrderData().orderNumType.split("Orders").first} on 20 Feb 2023 ",
                      size: 10,
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          );
  },
)
        ],
      ),
    );
  }
}
