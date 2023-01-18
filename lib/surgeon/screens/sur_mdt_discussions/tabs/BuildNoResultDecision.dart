part of'mdt_w_imports.dart';

class BuildNoResultDecision extends StatelessWidget {
  const BuildNoResultDecision({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CachedImage(
                        url: 'https://picsum.photos/186',
                        height: 60,
                        width: 60,
                        borderRadius: BorderRadius.circular(10),
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              title: 'Ahmed Ali',
                              size: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            Row(
                              children: [
                                MyText(
                                  title: 'Surgeon : ',
                                  size: 11,
                                  color: MyColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                MyText(
                                  title: 'Samer Hany',
                                  size: 11,
                                  color: MyColors.grey,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                MyText(
                                  title: 'Dietitian : ',
                                  size: 11,
                                  color: MyColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                MyText(
                                  title: 'Ahmed Jamil',
                                  size: 11,
                                  color: MyColors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                DefaultButton(title: "Enter Result", onTap: () {},margin: const EdgeInsets.symmetric(horizontal: 100,vertical: 5),),
              ],
            ),
          )),
    );
  }
}