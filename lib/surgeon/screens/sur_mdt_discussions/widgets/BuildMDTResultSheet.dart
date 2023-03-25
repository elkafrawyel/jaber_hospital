part  of 'SurMdtDiscussionsWImports.dart';


class BuildMDTResultSheet extends StatelessWidget {
  const BuildMDTResultSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: BlocBuilder<GenericBloc<int>,
          GenericState<int>>(
        bloc: SurMdtDiscussionsData().selectMDTResultCubit,
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            shrinkWrap: true,
            children: [
              MyText(
                alien: TextAlign.center,
                title: "Enter MDT Result",
                size: 12,
                fontWeight: FontWeight.bold,
                color: MyColors.primary,
              ),
              RadioListTile(
                value: 1,
                groupValue: state.data,
                title: MyText(
                  title: "Accept",
                  size: 12,
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (val) =>
                    SurMdtDiscussionsData().onSelectResult(val, context),
              ),
              const Divider(),
              RadioListTile(
                value: 2,
                groupValue: state.data,
                title: MyText(
                title: "Refuse",
                  fontWeight: FontWeight.bold,
                  size: 12,
          color: MyColors.black,
          ),
                onChanged: (val) =>
                    SurMdtDiscussionsData().onSelectResult(val, context),
              ),
              const Divider(),
              RadioListTile(
                value: 3,
                groupValue: state.data,
                title: MyText(
                  fontWeight: FontWeight.bold,
                  title: "Rediscuss",
                  size: 12,
                  color: MyColors.black,
                ),
                onChanged: (val) =>
                    SurMdtDiscussionsData().onSelectResult(val, context),
              ),
            ],
          );
        },
      ),
    );
  }
}
