part of 'HomeImports.dart';

class Home extends StatefulWidget {
  final int index;
  const Home({Key? key, required this.index}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final homeData = HomeData();
  @override
  void initState() {
    homeData.controller = TabController(length: 4, vsync: this);
    // FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    //   log(' =========== >>>>> message $message');
    //   log('where r u 4');
    //   if (message != null) {
    //     if (message.data != {}) {
    //       handleNotificationsTap(
    //         message.data.toString(),
    //       );
    //     }
    //   }
    // });
    final user = context.read<UserCubit>().state.model;
    if (user.userData?[0].role == "patient") {
      context.read<LangCubit>().onUpdateLanguage("ar");
      Future.delayed(Duration(microseconds: 100), () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => BuildTermsDialog(),
        );
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserCubit>().state.model;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
                title: user.userData?[0].role == "patient"
                    ? "الرئيسية لل ${user.userData?[0].role}"
                    : 'Home for ${user.userData?[0].role}',
                size: 15,
                fontWeight: FontWeight.bold),
            const SizedBox(height: 20),
            DefaultButton(
              title: tr(context, "signOut"),
              onTap: () => GeneralHttpMethods(context).logOut(),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildTermsDialog extends StatelessWidget {
  const BuildTermsDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralAlertDialog(
      alertButtonType: AlertButtonType.dueButton,
      alertTextType: AlertContentType.noTitle,
      alertImageType: AlertImageType.noImg,
      onTapRightButton: () => navigationKey.currentState!.pop(),
      onTapLeftButton: () => navigationKey.currentState!.pop(),
      rightButtonTitle: "موافق",
      leftButtonTitle: "غير موافق",
      customWidget: Flexible(
        child: ListView(
          shrinkWrap: true,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: CloseButton(
                color: MyColors.primary,
                onPressed: () => navigationKey.currentState!.pop(),
              ),
            ),
            MyText(
              alien: TextAlign.center,
              title: 'إقرار',
              size: 17,
              fontWeight: FontWeight.bold,
              color: MyColors.primary,
            ),
            MyText(
              alien: TextAlign.center,
              title:
                  '-ان دخولك علي هذه القواعد يعني قبولك في جميع الشروط والأحكام الواردة هنا، واي شروط اخري يتم نشرها وتحديثها علي صفحات لقواعد او موقع الشركة.',
              size: 12,
              // fontWeight: FontWeight.bold,
            ),
            MyText(
              alien: TextAlign.center,
              title:
                  '-إذا كنت غير موافق علي الشروط والأحكام يرجي عدم استخدام قواعد الموقع.',
              size: 12,
            ),
            MyText(
              alien: TextAlign.center,
              title:
                  'تحتفظ شركة المنظومة لنفسها بحق تغيير أو تعديل او إضافة او إزالة اجزاء من هذه الشروط والاحكام وفقا لتقديرها في اي وقت بدون اشعار مسبق.',
              size: 12,
            ),
            MyText(
              alien: TextAlign.center,
              title:
                  '-يرجي مراجعة هذه الصفحة بشكل دوري لاي تعديلات، علما بأن ستمرار استخدامك لهذا الموقع بعد شر اي تغييرات سوف يعني انك قد قبلت هذه التغييرات .',
              size: 12,
            ),
            MyText(
              alien: TextAlign.center,
              title:
                  'حقوق التأليف والنشروالملكية الفكرية والقيود المفروضة علي الإستخدام :',
              size: 12,
            ),
            MyText(
              alien: TextAlign.center,
              title:
                  '1. جميع المحويات في هذا الموقع ، بما ان في ذلكالنصوص الكاملة للوثائق ، والتصميم والصور والبرامج النصوص وغيرها من المعلومات (اجمالا، "المحتوي" ) هي من ممتلكات شركة المنظومة أو الجهات المرخص بموجب العقود الموقعة معها ، وجميع هذه المحتوايات محمية بموجب قوانين وانظمة قوق المؤلف غيرها من قوانين الملكية الفكرية .',
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
// return AuthScaffold(
//   notificationIcon: true,
//   title: 'الرئيسية',
//   back: false,
//   bottomNavigationBar: BuildBottomTabBar(homeData: homeData),
//   body: BuildTabsView(homeData: homeData),
// );
