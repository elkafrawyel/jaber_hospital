part of 'profileWidgetImports.dart';

class BuildProviderProfilePhoto extends StatelessWidget {

  const BuildProviderProfilePhoto();

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserCubit>().state.model;
    return BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
      bloc: SurProfileData().profileImageCubit,
      builder: (_, state){
        if(state.data == null){
          return Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CachedImage(
                        url:  user.userData?[0].image??'https://picsum.photos/212',
                        width: 120,
                        height: 120,
                        boxShape: BoxShape.circle,
                        fit: BoxFit.cover,
                        haveRadius: false,
                      ),
                    ],
                ),
                Positioned(
                  bottom: 0,
                  left: 8,
                  right: -60,
                  child: GestureDetector(
                    onTap:()=>SurProfileData().setImage(),
                    child: Container(
                      height: 35,
                      width: 35,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: MyColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: MyColors.blackOpacity,
                          ),
                          image: DecorationImage(scale: 3,image: AssetImage(Res.imagesCam))
                      ),
                      // child: Image.asset(Res.camera,scale: 90,color: MyColors.primary,),
                    ),
                  ),
                ),
              ],
            ),
          );
        }else{
          return Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(state.data??File('')),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: MyColors.greyWhite,
                      ),),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: -5,
                  right: -60,
                  child: GestureDetector(
                    onTap:()=>SurProfileData().setImage(),
                    child: Container(
                      width: 35,
                      height: 35,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: MyColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: MyColors.primary,
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: MyColors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
