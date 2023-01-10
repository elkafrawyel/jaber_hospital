part of 'SurProfileImports.dart';

class SurProfileData {
  static final SurProfileData _instance = SurProfileData._internal();

  factory SurProfileData() => _instance;

  SurProfileData._internal();

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController age;
  late TextEditingController job;
  late GlobalKey<FormState> formKey;
  late GlobalKey<CustomButtonState> btnKey;
  late GenericBloc<File?> profileImageCubit;
  late GenericBloc<int> genderBloc;

  void initScreen(BuildContext context) {
    this.name = TextEditingController();
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
    name.text = user.userData?[0].name ?? '';
    email.text =user.userData?[0].email ?? '';
    // age.text = user.userData?[0].age ?? '';
    job.text = user.userData?[0].role ?? '';
  }

  setImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      profileImageCubit.onUpdateData(image);
    }
  }

  dispose() {
    email.dispose();
    name.dispose();
    age.dispose();
  }
}
