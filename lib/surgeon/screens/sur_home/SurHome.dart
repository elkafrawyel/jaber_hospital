part of 'SurHomeImports.dart';

class SurHome extends StatefulWidget {
  const SurHome({Key? key}) : super(key: key);

  @override
  State<SurHome> createState() => _SurHomeState();
}

class _SurHomeState extends State<SurHome> {
  @override
  void initState() {
    SurHomeData().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: BuildSurHomeAppBar(),
        drawer: BuildSurHomeDrawer(),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          children: [
            if (context.read<UserCubit>().state.model.userData![0].doctorRoleId?.roleNameEn == 'Surgeon')
              BuildSurHomeSearchPatient(),
            BuildUpcomingAppointment(),
            BuildSurHomePatients(),
            BuildOverallProgress(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: MyText(title: 'Operation Types Statistics', size: 12, fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              Res.surBarChartSvg,
              fit: BoxFit.fill,
            ),
            // Image.asset(Res.imagesSurBarChart, fit: BoxFit.fill,),
            const SizedBox(
              height: 28,
            ),
          ],
        ),
      ),
    );
  }
}
