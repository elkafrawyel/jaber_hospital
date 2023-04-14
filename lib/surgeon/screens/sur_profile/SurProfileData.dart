part of 'SurProfileImports.dart';

class SurProfileData {
  static final SurProfileData _instance = SurProfileData._internal();

  factory SurProfileData() => _instance;

  SurProfileData._internal();

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController age;
  late TextEditingController job;
  late GlobalKey<FormState> formKey;
  late GlobalKey<CustomButtonState> btnKey;
  late GenericBloc<File?> profileImageCubit;
  late GenericBloc<int> genderBloc;

  void initScreen(BuildContext context) {
    this.firstName = TextEditingController();
    this.lastName = TextEditingController();
    this.email = TextEditingController();
    this.age = TextEditingController();
    this.job = TextEditingController();
    this.formKey = GlobalKey<FormState>();
    this.btnKey = GlobalKey<CustomButtonState>();
    this.profileImageCubit = GenericBloc(null);
    this.genderBloc = GenericBloc(0);

    this.initProfile(context);
  }

  void initProfile(BuildContext context) {
    UserModel user = context.read<UserCubit>().state.model;
    firstName.text = user.userData?[0].firstNameEn??"";
    lastName.text = user.userData?[0].lastNameEn??"";
    email.text =user.userData?[0].email ?? '';
    age.text = (user.userData?[0].age??0).toString();
    job.text = user.userData?[0].role ?? 'doctor';
    genderBloc.onUpdateData(user.userData?[0].gender=="male"?0:1);
  }

  setImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      profileImageCubit.onUpdateData(image);
    }
  }

  saveUserProfile(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      ProfileModel model = ProfileModel(
        email: email.text,
        firstNameEn: firstName.text,
        lastNameEn: lastName.text,
        title: "title",
        civilId: "civilId",
        age: age.text,
        file: profileImageCubit.state.data,
        gender: genderBloc.state.data == 0 ?"male":"female",

      );
      var result = await SurgeonRepository(context).updateSurgeonProfile(model);
      if (result) {
        CustomToast.showSnackBar(context,'Edited Successfully');
        btnKey.currentState!.animateReverse();
        navigationKey.currentState!.pop();
      }
      btnKey.currentState!.animateReverse();
    }
    btnKey.currentState!.animateReverse();
  }

  dispose() {
    email.dispose();
    firstName.dispose();
    lastName.dispose();
    age.dispose();
  }
}
