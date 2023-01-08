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
            BuildSurHomeSearchPatient(),
            BuildUpcomingAppointment(),
            BuildSurHomePatients(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: MyText(
                  title: 'Overall Progress',
                  size: 12,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Color(0xff136CFB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          Res.imagesOperationsIcon,
                          scale: 3,
                        ),
                        const SizedBox(height: 5),
                        MyText(
                          title: '330',
                          size: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Center(
                            child: MyText(
                                alien: TextAlign.center,
                                title: 'Operations Done',
                                size: 9,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Color(0xff00116E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          Res.imagesMinutesIcon,
                          scale: 3,
                        ),
                        const SizedBox(height: 5),
                        MyText(
                          title: '750',
                          size: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Center(
                            child: MyText(
                                alien: TextAlign.center,
                                title: 'Minutes Spent',
                                size: 9,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Color(0xff455BD8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          Res.imagesWeightLossIcon,
                          scale: 3,
                        ),
                        const SizedBox(height: 5),
                        MyText(
                          title: '88%',
                          size: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Center(
                            child: MyText(
                                alien: TextAlign.center,
                                title: 'Weight Loss Success',
                                size: 9,
                                // overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: MyText(
                  title: 'Operation Types Statistics',
                  size: 12,
                  fontWeight: FontWeight.bold),
            ),
            Image.asset(Res.imagesBarChart),
          ],
        ),
      ),
    );
  }
}
