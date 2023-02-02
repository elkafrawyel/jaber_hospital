import 'package:flutter/material.dart';

import '../../res/res.dart';
import '../constants/MyColors.dart';
import '../utilities/tf_custom_widgets/widgets/MyText.dart';

class BuildNoResultSearch extends StatelessWidget {
  const BuildNoResultSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Res.imagesNoResult,height: MediaQuery.of(context).size.height/2.5,width: double.infinity,),
          MyText(
            title: 'No Results',
            size: 14,
            color: MyColors.primary,
            fontWeight: FontWeight.bold,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
            child: MyText(
              alien: TextAlign.center,
              title: 'There are no search results for this till now, please try again later',
              size: 12,
              color: MyColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
