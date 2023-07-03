part of 'SurMedicationOrderWImports.dart';

class BuildMedicationItem extends StatelessWidget {
  final int index;

  const BuildMedicationItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = SurMedicationsOrderData().medicationsOrdersCubit.state.data[index];
    return InkWell(
      onTap: () => Nav.navigateTo(SurMedicationRequestDetails(index: index), navigatorType: NavigatorType.push),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: MyColors.grey, spreadRadius: 1, blurRadius: 5)]),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: MyColors.primary.withOpacity(.1), borderRadius: BorderRadius.circular(100)),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: MyText(
                              title: '${model.patientId?.firstNameEn ?? ''} ${model.patientId?.lastNameEn ?? ''}',
                              size: 14,
                              color: MyColors.primary,
                              fontWeight: FontWeight.bold,
                              alien: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          MyText(
                            title: "Order #${model.orderNum}",
                            size: 12,
                            color: MyColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        children: [
                          ...List.generate(
                              model.medications!.length,
                              (index) => Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyText(
                                        title: model.medications?[index].medicationName ?? "" + ",",
                                        size: 10,
                                        color: Colors.black87,
                                      ),
                                      // MyText(
                                      //   title: (model.medications?[index].quantity??0).toString(),
                                      //   size: 10,
                                      //   color: Colors.black87,
                                      // ),
                                    ],
                                  ))
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(Res.imagesCalendar, scale: 3, color: MyColors.primary),
                          const SizedBox(width: 5),
                          Expanded(
                            child: MyText(
                              title: Utils.getDate(model.orderStartDate!),
                              // title: model.orderStartDate??'',
                              size: 9,
                              color: MyColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                )
              ],
            ),
            BlocBuilder<GenericBloc<int>, GenericState<int>>(
              bloc: SurMedicationsOrderData().tabSelect,
              builder: (context, state) {
                return Visibility(
                  visible: SurMedicationsOrderData().tabSelect.state.data == 1 ||
                      SurMedicationsOrderData().tabSelect.state.data == 2,
                  child: Column(
                    children: [
                      const Divider(),
                      Row(
                        children: [
                          Icon(Icons.circle, color: MyColors.primary, size: 10),
                          const SizedBox(width: 5),
                          MyText(
                            title:
                                "Changed to ${SurMedicationsOrderData().orderNumType.split("Orders").first} on ${model.orderCompletedDate} ",
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
      ),
    );
  }
}
