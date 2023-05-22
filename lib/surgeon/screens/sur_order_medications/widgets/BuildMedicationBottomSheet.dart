part of 'SurOrderMedicationWidgetImports.dart';

class BuildMedicationBottomSheet extends StatefulWidget {
  const BuildMedicationBottomSheet({Key? key}) : super(key: key);

  @override
  State<BuildMedicationBottomSheet> createState() =>
      _BuildMedicationBottomSheetState();
}

class _BuildMedicationBottomSheetState
    extends State<BuildMedicationBottomSheet> {
  @override
  void initState() {
    SurOrderMedicationsData().getMedication(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<GenericBloc<List<MedicationInfo>?>,
                GenericState<List<MedicationInfo>?>>(
              bloc: SurOrderMedicationsData().companyMedicationsCubit,
              // bloc: SurOrderMedicationsData().medicationCubit,
              builder: (context, state) {
                if (state is GenericUpdateState) {
                  if (state.data!.isNotEmpty) {
                    return ListView.builder(
                        controller: SurOrderMedicationsData().scrollController,
                        padding: const EdgeInsets.only(top: 10, bottom: 30),
                        itemCount: (state.data?.length??0) + 1,
                        itemBuilder: (context, index) {
                          if (index < (state.data?.length??0)) {
                            return BuildMedicationItem(index: index);
                          } else {
                            return BuildPaginationLoadingIndicator(
                              paginationLoadingBloc: SurOrderMedicationsData()
                                  .paginationDto
                                  .paginationLoading,
                            );
                          }
                        });
                  } else {
                    return Center(
                      child: MyText(
                        title: "No Medications",
                        size: 13,
                        color: MyColors.black,
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: LoadingDialog.showLoadingView(),
                  );
                }
              },
            ),
          ),
          DefaultButton(
            title: "Save Results",
            onTap: () {
              SurOrderMedicationsData().selectedMedicationCubit.onUpdateData(
                  SurOrderMedicationsData()
                      .medicationCubit
                      .state
                      .data
                      .where((element) => element.isSelected == true)
                      .toList());
              navigationKey.currentState!.pop();
              log("selectedMedicationCubit ${SurOrderMedicationsData().selectedMedicationCubit.state.data} ");
            },
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10)
          ),
        ],
      ),
    );
  }
}

class BuildMedicationItem extends StatelessWidget {
  final int index;

  const BuildMedicationItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // list of checkbox values with counter for each item in the list if selected you can access to change counter
    // and if not selected you can't access to change counter
    return BlocBuilder<GenericBloc<List<MedicationInfo>>,
        GenericState<List<MedicationInfo>>>(
      bloc: SurOrderMedicationsData().medicationCubit,
      builder: (context, state) {
        return Container(
          // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              // checkbox list tile
              CheckboxListTile(
                contentPadding: EdgeInsets.zero ,
                value: state.data[index].isSelected ?? false,
                onChanged: (value) {
                  SurOrderMedicationsData().medicationCubit.state.data[index]
                      .isSelected = value;
                  SurOrderMedicationsData().medicationCubit.onUpdateData(
                      SurOrderMedicationsData().medicationCubit.state.data);
                },
                title: MyText(
                  title: state.data[index].medicationName??'',
                  size: 13,
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: MyText(
                  title: state.data[index].description??'',
                  size: 12,
                  color: MyColors.grey,
                  // fontWeight: FontWeight.bold,
                ),
                controlAffinity: ListTileControlAffinity.leading,
              ),

              Visibility(
                visible: state.data[index].isSelected ?? false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        title: "Quantity",
                        size: 12,
                        color: MyColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: ()=> SurOrderMedicationsData().onChangeCounter(index: index, isAdd: false),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: MyColors.white,
                                border: Border.all(
                                  color: MyColors.primary,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: MyColors.primary,
                                size: 20,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: MyText(
                              title: state.data[index].quantity.toString(),
                              size: 12,
                              color: MyColors.blackOpacity,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              SurOrderMedicationsData().onChangeCounter(index: index, isAdd: true);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: MyColors.primary,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(
                                Icons.add,
                                color: MyColors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,

              ),

            ],
          ),
        );
      },
    );
  }
}
