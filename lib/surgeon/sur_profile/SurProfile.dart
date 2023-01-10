part of 'SurProfileImports.dart';

class SurProfile extends StatefulWidget {
  const SurProfile({Key? key}) : super(key: key);

  @override
  State<SurProfile> createState() => _SurProfileState();
}

class _SurProfileState extends State<SurProfile> {
  @override
  void initState() {
    SurProfileData().initScreen(context);
    super.initState();
  }

  @override
  void dispose() {
    SurProfileData().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: GeneralScaffold(
          back: true,
          title: "Edit Profile",
          body: Column(
            children: [
              Flexible(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    Column(
                      children: [
                        BuildProviderProfilePhoto(),
                        BuildProfileBody(),
                      ],
                    ),
                  ],
                ),
              ),
              BuildProfileButtons()
            ],
          )),
    );
  }
}
