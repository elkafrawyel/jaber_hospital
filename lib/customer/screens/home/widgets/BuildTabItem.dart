part of 'HomeWidgetImports.dart';

class BuildTabItem extends StatelessWidget {
  final bool isClicked ;
  final String title;
  final String bNVIcon;
  final double? scale ;

  const BuildTabItem({required this.title, required this.bNVIcon, required this.isClicked, this.scale, });

  @override
  Widget build(BuildContext context) {
    return  Container(
        // padding: const EdgeInsets.symmetric(
        //     horizontal: 15.0, vertical: 5.0),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Column(
            children: [
              Image.asset(
                bNVIcon,
                scale:scale?? 4.0,
                // color:isClicked ?MyColors.white : MyColors.black.withOpacity(.8)  ,
              ),
              Text(
                title,
              ),
              Visibility(
                visible:isClicked ,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
                ),
              )
            ],
          ),
        ));
  }
}

