part of 'SurgeonRepoImports.dart';

class SurgeonHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  SurgeonHttpMethods(this.context);

  Future<SurgeonHomeModel?> getHome(String doctorId) async {
    String param = "?doctor_id=$doctorId";
    return await GenericHttp<SurgeonHomeModel>(context).callApi(
      name: ApiNames.doctorHome + param,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["data"],
      toJsonFunc: (json) => SurgeonHomeModel.fromJson(json),
    );
  }
}
