import 'dart:async';
import 'dart:convert';
import "dart:developer";

// import "package:firebase_core/firebase_core.dart";
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';


/// --------------- old notification --------------
// class GlobalNotification {
//   static StreamController<Map<String, dynamic>> _onMessageStreamController =
//   StreamController.broadcast();
//
//   late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
//   static late BuildContext context;
//   static GlobalNotification instance = new GlobalNotification._();
//   static FirebaseMessaging messaging = FirebaseMessaging.instance;
//   GlobalNotification._();
//
//
//
//   setupNotification(BuildContext cxt)async{
//     context = cxt;
//     _flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//     var android = new AndroidInitializationSettings("@mipmap/launcher_icon");
//
//     var ios = new IOSInitializationSettings();
//     var initSettings = new InitializationSettings(android: android, iOS: ios);
//     _flutterLocalNotificationsPlugin.initialize(
//       initSettings,
//       onSelectNotification: flutterNotificationClick,
//     );
//     NotificationSettings settings = await messaging.requestPermission(provisional: true);
//     print('User granted permission: ${settings.authorizationStatus}');
//     if(settings.authorizationStatus==AuthorizationStatus.authorized){
//       messaging.getToken().then((token) {
//         print(token);
//       });
//       messaging.setForegroundNotificationPresentationOptions(alert: false,badge: false,sound: false);
//       // messaging.getInitialMessage().then((message) => _showLocalNotification(message));
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         print("_____________________Message data:${message.data}");
//         print("_____________________notification:${message.notification?.android?.imageUrl}");
//         _showLocalNotification(message);
//         _onMessageStreamController.add(message.data);
//         if (int.parse(message.data["type"]??"0") == -1) {
//           Utils.clearSavedData();
//           Nav.navigateTo( Login(), navigatorType: NavigatorType.push);
//           // AutoRouter.of(context).push(LoginRoute());
//         }
//       });
//       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//         print('A new onMessageOpenedApp event was published!');
//         flutterNotificationClick(json.encode(message.data));
//       });
//       FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     }
//
//   }
//
//   static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//     print("Handling a background message: ${message.messageId}");
//     flutterNotificationClick(json.encode(message.data));
//   }
//
//   StreamController<Map<String, dynamic>> get notificationSubject {
//     return _onMessageStreamController;
//   }
//
//   _showLocalNotification(RemoteMessage? message) async {
//     if (message == null) return;
//     String? path;
//     BigPictureStyleInformation? bigPictureStyleInformation;
//     if (message.notification?.android?.imageUrl!=null) {
//       path = await _downloadAndSaveFile("${message.notification?.title}");
//       bigPictureStyleInformation = BigPictureStyleInformation(
//         FilePathAndroidBitmap(path),
//         largeIcon: FilePathAndroidBitmap(path),
//         contentTitle: "${message.notification?.title}",
//         summaryText: "${message.notification?.body}",
//       );
//     }
//
//     var android = AndroidNotificationDetails(
//       "${DateTime.now()}",
//       "DEFAULT",
//       priority: Priority.high,
//       importance: Importance.max,
//       playSound: true,
//       largeIcon: path!=null? FilePathAndroidBitmap(path):null,
//       shortcutId: DateTime.now().toIso8601String(),
//       styleInformation: bigPictureStyleInformation,
//     );
//     var ios = IOSNotificationDetails();
//     var _platform = NotificationDetails(android: android, iOS: ios);
//     _flutterLocalNotificationsPlugin.show(
//         DateTime.now().microsecond, "${message.notification?.title}", "${message.notification?.body}", _platform,
//         payload: json.encode(message.data));
//   }
//
//   Future<String> _downloadAndSaveFile(String url) async {
//     final Directory directory = await getApplicationDocumentsDirectory();
//     final String filePath = '${directory.path}/${directory.path.split("/").last}';
//     await Dio().download(url,filePath);
//     return filePath;
//   }
//
//   static Future flutterNotificationClick(String? payload) async {
//     print("tttttttttt $payload");
//     var _data = json.decode("$payload");
//
//     int _type = int.parse(_data["type"] ?? "4");
//   }
//
// }

/// --------------- new notification --------------
/*final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> backgroundHandler(RemoteMessage message) async {
  log('========= >>> backGroundMessage ${message.data}');
  log('where r u 2');
  await Firebase.initializeApp();
}

void requestPermissions() {
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
    alert: true,
    badge: true,
    sound: true,
  );
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.requestPermission();
}

void showNotification(RemoteMessage event, String payload) async {
  var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
      presentAlert: true, presentBadge: true, presentSound: true);
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    "sa.aait.flutter.haidiProvider",
    "haidiProvider",
    channelDescription: "haidiProvider",
    enableVibration: true,
    playSound: true,
    icon: "appicon",
    importance: Importance.high,
    priority: Priority.high,
  );
  var notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  String title = "${event.notification!.title}";
  String body = "${event.notification!.body}";
  await flutterLocalNotificationsPlugin
      .show(200, title, body, notificationDetails, payload: payload);
  log('========= >>> show notification title ${event.notification!.title}');
  log('========= >>> show notification body ${event.notification!.body}');
}

void initLocalNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings("appicon");

  const IOSInitializationSettings initializationSettingsIOS =
  IOSInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) {
        log('where r u 3');
        return handleNotificationsTap(payload);
      });
}

Future<void> registerNotification() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  await firebaseMessaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
}

void initializeFlutterFire() async => await registerNotification();

handleNotificationsTap(String? payload) async {
  log('on tab $payload');
  if (payload!.isEmpty || payload == '{}') {
    log('========= >>> null');
    // Nav.navigateTo(Wallet(), navigatorType: NavigatorType.push);
  } else {
    List<String> str =
    payload.replaceAll("{", "").replaceAll("}", "").split(",");
    Map<String, dynamic> data = {};
    for (int i = 0; i < str.length; i++) {
      List<String> s = str[i].split(":");
      data.putIfAbsent(s[0].trim(), () => s[1].trim());
    }
    // var data = json.decode("$payload");
    log('========= >>> on tab Data is $data');
    int _type = int.parse(data["type"]??-1);
    int _orderId = int.parse(data["orderId"] ?? 0);
    int _orderType = int.parse(data["orderType"]);
    if (_type == 7) {
      // Nav.navigateTo( Notifications(), navigatorType: NavigatorType.push);
    }else {
      // Nav.navigateTo( Home(), navigatorType: NavigatorType.push);

    }

  }
}

void saveFcmToken() async {
  var token = await FirebaseMessaging.instance.getToken();
  log("Firebase Fcm token : ${token.toString()}");
}

void setupNotifications() async{
  saveFcmToken();
  initializeFlutterFire();
  initLocalNotification();
  requestPermissions();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    if (event.data != {}) {
      log("========= >>> on listen for event notification ${event.notification?.body.toString()}");
      log("========= >>> on listen for event notification ${event.notification?.title.toString()}");
      log("========= >>> on listen for event data ${event.data}");
      showNotification(event, "${event.data}");
    } else {
      showNotification(event, "${event.notification}");
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
    log('where r u 1');
    handleNotificationsTap(json.encode(event.data));
  });
  log("Notifications init complete");
}*/




