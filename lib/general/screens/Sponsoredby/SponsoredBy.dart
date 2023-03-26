part of 'SponsoredByImports.dart';

class SponsoredBy extends StatefulWidget {
  const SponsoredBy({Key? key}) : super(key: key);

  @override
  State<SponsoredBy> createState() => _SponsoredByState();
}

class _SponsoredByState extends State<SponsoredBy> {
  List<String> images = [
    Res.imagesNova,
    Res.imagesSumc,
    Res.imagesMedtronic,
    Res.imagesFirforme,
    Res.imagesEthicon,
    Res.imagesCentral,
  ];

  static const int allValue = 3;
  double curValue = 3;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: allValue), (timer) {
      log("curValue==> $curValue}");
      log("timer==> $timer}");
      if (curValue > 0) {
        setState(() {
          curValue--;
        });
      } else {
        stopTimer();
        Utils.manipulateSplashData(context);
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  void initState() {
    // Future.delayed(Duration(seconds: allValue), () {
    //   Utils.manipulateSplashData(context);
    // });
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 36.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: "Sponsored By",
                  size: 16,
                  alien: TextAlign.center,
                  color: MyColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 48,
                ),
                SizedBox(
                  width: 56,
                  height: 56,
                  child: CircularPercentIndicator(
                    //leaner progress bar
                    animation: false,
                    radius: 16.0,
                    lineWidth: 5.0,
                    percent: curValue / allValue,
                    center: Text(
                      curValue.toStringAsFixed(0),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: MyColors.primary,
                    backgroundColor: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28.0),
              scrollDirection: Axis.vertical,
              itemCount: images.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.9),
              itemBuilder: (BuildContext context, int index) {
                return _buildSponsoredItem(
                  images[index],
                );
              },
            ),
          ),
        ],
      ),
      // body: ListView(
      //   padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.only(bottom: 20),
      //       child: MyText(
      //         title: "Sponsored By",
      //         size: 16,
      //         alien: TextAlign.center,
      //         color: MyColors.primary,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     Row(
      //       children: [
      //         Expanded(
      //           child: Image.asset(
      //             Res.imagesNova,
      //             height: 100,
      //             width: 100,
      //           ),
      //         ),
      //         Expanded(
      //           child: Image.asset(
      //             Res.imagesSumc,
      //             height: 100,
      //             width: 100,
      //           ),
      //         ),
      //       ],
      //     ),
      //     const SizedBox(
      //       height: 60
      //     ),
      //     Row(
      //       children: [
      //         Expanded(
      //           child: Image.asset(
      //             Res.imagesMedtronic,
      //             height: 100,
      //             width: 170,
      //           ),
      //         ),
      //         Expanded(
      //           child: Image.asset(
      //             Res.imagesFirforme,
      //             height: 100,
      //             width: 170,
      //           ),
      //         ),
      //       ],
      //     ),
      //     Row(
      //       children: [
      //         Expanded(
      //           child: Image.asset(
      //             Res.imagesEthicon,
      //             height: 100,
      //             width: 170,
      //           ),
      //         ),
      //         const SizedBox(
      //             height: 20
      //         ),
      //         Expanded(
      //           child: Image.asset(
      //             Res.imagesCentral,
      //             height: 100,
      //             width: 170,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildSponsoredItem(String imgPath) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16.0)), boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 1.0,
          spreadRadius: 1.0,
          offset: Offset(0.0, 1.0),
        )
      ]),
      alignment: Alignment.center,
      child: Image.asset(
        imgPath,
      ),
    );
  }
}
