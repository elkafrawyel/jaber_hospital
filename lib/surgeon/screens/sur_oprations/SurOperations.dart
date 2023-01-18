part of 'SurOperationsImports.dart';

class SurOperations extends StatefulWidget {
  const SurOperations({Key? key}) : super(key: key);

  @override
  State<SurOperations> createState() => _SurOperationsState();
}

class _SurOperationsState extends State<SurOperations> {
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        back: true,
        title: "Operations",
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildSurOperationsTabBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: MyText(
                title: '5 Operations',
                size: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric( horizontal: 20),
                itemCount: 4,
                itemBuilder: (context, index) => BuildSurOperationsItem(),
              ),
            )
          ],
        ));
  }
}


