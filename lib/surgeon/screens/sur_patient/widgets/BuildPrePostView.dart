part of 'SurPatientWImports.dart';

class BuildPrePostView extends StatelessWidget {
  const BuildPrePostView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc: SurPatientData().isLoading,
      builder: (context, loadingState) {
        if (!loadingState.data) {
          return BlocBuilder<GenericBloc<List<PatientModel>>, GenericState<List<PatientModel>>>(
            bloc: SurPatientData().patientsCubit,
            builder: (context, patientState) {
              if (patientState is GenericUpdateState) {
                if (patientState.data.isNotEmpty) {
                  return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                    bloc: SurPatientData().isLoadingMore,
                    builder: (context, loadMoreState) => BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                      bloc: SurPatientData().isLoadingMoreEnd,
                      builder: (context, loadMoreStateEnd) => Expanded(
                        child: PaginationView(
                          loadMoreData: () {
                            SurPatientData().loaMoreData(context);
                          },
                          showLoadMoreEndWidget: false,
                          showLoadMoreWidget: loadMoreState.data,
                          child: ListView.builder(
                            itemCount: patientState.data.length,
                            itemBuilder: (context, index) => BuildPrePostItem(index: index),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: MyText(
                        title: "No Patients",
                        size: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
              } else {
                return Expanded(child: Center(child: LoadingDialog.showLoadingView()));
              }
            },
          );
        } else {
          return Expanded(child: Center(child: LoadingDialog.showLoadingView()));
        }
      },
    );
  }
}
