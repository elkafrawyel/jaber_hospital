part of 'SponsoredByImports.dart';

class SponsoredBy extends StatefulWidget {
  const SponsoredBy({Key? key}) : super(key: key);

  @override
  State<SponsoredBy> createState() => _SponsoredByState();
}

class _SponsoredByState extends State<SponsoredBy> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 4000), () {
      Utils.manipulateSplashData(context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: MyText(
              title: "Sponsored By",
              size: 16,
              alien: TextAlign.center,
              color: MyColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Image.asset( 
                  Res.imagesNova,
                  height: 100,
                  width: 100,
                ),
              ),
              Expanded(
                child: Image.asset(
                  Res.imagesSumc,
                  height: 100,
                  width: 100,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60
          ),
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  Res.imagesMedtronic,
                  height: 100,
                  width: 170,
                ),
              ),
              Expanded( 
                child: Image.asset(
                  Res.imagesFirforme,
                  height: 100,
                  width: 170,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  Res.imagesEthicon,
                  height: 100,
                  width: 170,
                ),
              ),
              const SizedBox(
                  height: 20
              ),
              Expanded(
                child: Image.asset(
                  Res.imagesCentral,
                  height: 100,
                  width: 170,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
