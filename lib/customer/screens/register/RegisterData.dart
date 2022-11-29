part of 'RegisterImports.dart';

class RegisterData {
  final GenericBloc<File?> imageCubit = new GenericBloc(null);
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GenericBloc<bool> passwordBloc = GenericBloc(true);
  final GenericBloc<bool> confirmPasswordBloc = GenericBloc(true);
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmPassword = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController name = new TextEditingController();
  final TextEditingController email = new TextEditingController();

  setImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      imageCubit.onUpdateData(image);
    }
  }

  userRegister(BuildContext context) {
    Nav.navigateTo(ActiveAccount(userId: "userId"),
        navigatorType: NavigatorType.push);
  }
}
