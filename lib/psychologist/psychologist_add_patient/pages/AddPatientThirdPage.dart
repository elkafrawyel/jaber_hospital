part of 'PagesWImports.dart';

class AddPatientThirdPage extends StatelessWidget {
  const AddPatientThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        MyText(
          title: "Reflux & Reflux Medications",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.primary,
        ),
        const SizedBox(height: 10),
        MyText(
          title: "Reflux:",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.black,
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: PsychologistAddPatientData().dmSelectionCubit,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                        value: true,
                        groupValue: state.data,
                        onChanged: (value) => PsychologistAddPatientData()
                            .dmSelectionCubit
                            .onUpdateData(value!)),
                    MyText(
                      title: "Yes",
                      size: 12,
                      color: MyColors.black,
                    ),
                    const SizedBox(width: 40),
                    Radio(
                        value: false,
                        groupValue: state.data,
                        onChanged: (value) => PsychologistAddPatientData()
                            .dmSelectionCubit
                            .onUpdateData(value!)),
                    MyText(
                      title: "No",
                      size: 12,
                      color: MyColors.black,
                    ),
                  ],
                ),
                Offstage(
                  offstage: !state.data,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        title: "Medications:",
                        size: 12,
                        fontWeight: FontWeight.bold,
                        color: MyColors.black,
                      ),
                      BlocBuilder<GenericBloc<String>, GenericState<String>>(
                        bloc: PsychologistAddPatientData().medicationsCubit,
                        builder: (context, state) {
                        return  Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            direction: Axis.horizontal,
                            children: List.generate(
                              PsychologistAddPatientData().medications.length,
                                  (index) => Container(
                                width: MediaQuery.of(context).size.width / 2.6,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Radio(
                                      value: PsychologistAddPatientData().medications[index],
                                      groupValue: state.data,
                                      onChanged: (value) => PsychologistAddPatientData().medicationsCubit.onUpdateData(value!),

                                    ),
                                    Expanded(
                                      child: MyText(
                                        title: PsychologistAddPatientData().medications[index],
                                        size: 12,
                                        color: MyColors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        const Divider(),
        MyText(
          title: "Smoking Habits:",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.primary,
        ),
        BlocBuilder<GenericBloc<String>, GenericState<String>>(
          bloc: PsychologistAddPatientData().smokingHabitsCubit,
          builder: (context, state) {
            return  Wrap(
              alignment: WrapAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: List.generate(
                PsychologistAddPatientData().smokingHabits.length,
                    (index) => Container(
                      width: MediaQuery.of(context).size.width / 2.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                  value: PsychologistAddPatientData().smokingHabits[index],
                  groupValue: state.data,
                  onChanged: (value) => PsychologistAddPatientData().smokingHabitsCubit.onUpdateData(value!),

                ),
                          Expanded(
                            child: MyText(
                              title: PsychologistAddPatientData().smokingHabits[index],
                              size: 12,
                              color: MyColors.black,
                            ),
                          )
                        ],
                      ),
                    ),
              ),
            );
          },
        ),

        Row(
          children: [
            Expanded(
              child: DefaultButton(
                title: "Previous",
                borderColor: MyColors.primary,
                color: MyColors.white,
                textColor: MyColors.primary,
                onTap: () =>PsychologistAddPatientData().previousPage(),
              ),
            ),
            Expanded(
              child: DefaultButton(
                title: "Next",
                onTap: () =>PsychologistAddPatientData().nextPage(),
              ),
            ),
          ],
        )

      ],
    );
  }
}
