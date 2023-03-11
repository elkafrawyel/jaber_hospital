part of 'PsychologistPatientWImports.dart';


class BuildPrePostView extends StatelessWidget {
  const BuildPrePostView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc: PsychologistPatientData().isLoading,
      builder: (context, state) {
        if(!state.data){
          return BlocBuilder<GenericBloc<List<PatientModel>>, GenericState<List<PatientModel>>>(
            bloc: PsychologistPatientData().patientsCubit,
            builder: (context, state) {
              if(state is GenericUpdateState){
                if(state.data.isNotEmpty){
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, index) => BuildPrePostItem(index: index),
                    ),
                  );
                }else{
                  return Expanded(child: Center(child: MyText(title: "No Patients",size: 14,fontWeight: FontWeight.bold,)));
                }

              }else{
                return Expanded(child: Center(child: LoadingDialog.showLoadingView()));
              }
            },
          );
        }
        else{
          return Expanded(child: Center(child: LoadingDialog.showLoadingView()));
        }
      },
    );



  }
}

