part of 'SurFollowUpsImports.dart';

class SurFollowUps extends StatefulWidget {
  const SurFollowUps({Key? key}) : super(key: key);

  @override
  State<SurFollowUps> createState() => _SurFollowUpsState();
}

class _SurFollowUpsState extends State<SurFollowUps> {
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      back: true,
      title: "Follow Ups",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildSurFollowUpsTabBar(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: MyText(
                    title: '5 Follow-ups',
                    size: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: 4,
                    itemBuilder: (context, index) => BuildSurFollowUpItem(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


