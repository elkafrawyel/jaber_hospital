part of 'ContactUsImports.dart';

class ContactUsData{

  final LocationCubit locationCubit =new LocationCubit();
  final TextEditingController address = new TextEditingController();

  onLocationClick(BuildContext context)async{
    var _loc = await Utils.getCurrentLocation();
    locationCubit.onLocationUpdated(LocationModel(
      lat: _loc?.latitude ?? 24.774265,
      lng: _loc?.longitude ?? 46.738586,
      address: "",
    ));
    // Navigator.of(context).push(CupertinoPageRoute(builder: (cxt)=> BlocProvider.value(
    //   value: locationCubit,
    //   child: LocationAddress(),
    // )));
    Navigator.push(
        context, PageRouteBuilder(pageBuilder: (_, animation, __) {
      return FadeTransition(opacity: animation, child: BlocProvider.value(
        value: locationCubit,
        child: LocationAddress(),
      ),);
    }));

  }


}