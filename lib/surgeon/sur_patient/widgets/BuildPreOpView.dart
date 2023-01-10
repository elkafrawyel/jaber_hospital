part of'SurPatientWImports.dart';

class BuildPreOpView extends StatelessWidget {
  const BuildPreOpView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => BuildPreOpItem(),
      ),
    );
  }
}
