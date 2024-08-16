import 'dart:convert';
import 'package:career_compass/screens/employee_screens/notification_employee.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:path_provider/path_provider.dart';
import '../../main.dart';
//import '../shared/local_network.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  await showNotification(message);
}

Future<void> showNotification(RemoteMessage message) async {
  final localNotification = FlutterLocalNotificationsPlugin();

  final notification = message.notification;
  if (notification == null) return;
  await localNotification.show(
    notification.hashCode,
    notification.title,
    notification.body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        androidChannel.id,
        androidChannel.name,
        channelDescription: androidChannel.description,
        icon: '@drawable/ring',
        importance: Importance.max,
        priority: Priority.high,
        //sound: RawResourceAndroidNotificationSound('notification_sound'), // Use custom sound
      ),
    ),
    payload: jsonEncode(message.toMap()),
  );
}

// Future<String> _downloadAndSaveImage(String url, String fileName) async {
//   final directory = await getApplicationDocumentsDirectory();
//   final filePath = '${directory.path}/$fileName.jpg';
//   final response = await http.get(Uri.parse(url));
//   final file = File(filePath);
//   await file.writeAsBytes(response.bodyBytes);
//   return filePath;
// }

Future<void> handleMessageOnOpen(RemoteMessage? message) async {
  if (message == null) return;
  navigatorKey.currentState!
      .pushNamed(NotificationEmployeeScreen.route, arguments: message);
}

const androidChannel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications',
  importance: Importance.max,
);

class FirebaseApi {
  final firebaseMessaging = FirebaseMessaging.instance;
  final localNotification = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    try {
      // await firebaseMessaging.requestPermission(
      //   alert: true,
      //   badge: true,
      //   sound: true,
      // );
      firebaseMessaging.subscribeToTopic('all_users_in_digital_star');
      String? fcmToken = await firebaseMessaging.getToken();
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        showNotification(message);
      });

      FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        handleMessageOnOpen(message);
      });

      var initializationSettingsAndroid =
          const AndroidInitializationSettings('@drawable/ring');
      var initializationSettingsIOS = const DarwinInitializationSettings();
      var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );
      await localNotification.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (details) {
          handleMessageOnOpen(
              RemoteMessage.fromMap(jsonDecode(details.payload!)));
        },
      );
      print('The fcm token is => $fcmToken');
      // CashNetwork.insertToCash(key: 'fcm_token', value: fcmToken.toString());
      print('.................');
      //  print(CashNetwork.getCashData(key: 'fcm_token'));
    } catch (e) {
      print(e);
    }
  }
}

// import 'dart:convert';

// import 'package:career_compass/main.dart';
// import 'package:career_compass/screens/employee_screens/notification_employee.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Future<void> handelBackgroundMessage(RemoteMessage message) async {
//   print('Title : ${message.notification?.title}');
//   print('Body :${message.notification?.body}');
//   print('Payload:${message.data}');
// }

// void handleMessage(RemoteMessage? message) {
//   if (message == null) return;
//   navigatorKey.currentState?.pushNamed(
//     NotificationEmployeeScreen.route,
//     arguments: message,
//   );
// }

// class FirebaseApi {
//   final _firebaseMessagin = FirebaseMessaging.instance;
//   Future<void> initNotification() async {
//     await _firebaseMessagin.requestPermission();
//     final fCMToken = await _firebaseMessagin.getToken();
//     print('The fcm token is => $fCMToken');
//     initPushNotifications();
//     initLocalNotifications();
//   }

//   //show local notification
//   final _androidchannel = const AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     description: 'This channel is used for important notification',
//     importance: Importance.max,
//   );
//   final _localNotifications = FlutterLocalNotificationsPlugin();
//   Future initPushNotifications() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     //performing an action when the app is open from a terminated state via a notification..
//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//     //the same for the line before but for background case, when we want to open app from notification..
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     FirebaseMessaging.onBackgroundMessage(handelBackgroundMessage);
//     //to handle forground message
//     FirebaseMessaging.onMessage.listen(
//       (message) {
//         final notification = message.notification;
//         if (notification == null) return;
//         _localNotifications.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               _androidchannel.id,
//               _androidchannel.name,
//               channelDescription: _androidchannel.description,
//               icon: '@drawable/flutterlogo',
//             ),
//           ),
//           //transform local notification from object to string(into map then decode it as json string)..
//           payload: jsonEncode(message.toMap()),
//         );
//       },
//     );
//   }

//   Future initLocalNotifications() async {
//     //android
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@drawable/flutterlogo');
//     // iOS initialization settings
//     const DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       //  onDidReceiveLocalNotification: (int id, String? title, String? body ,String? payload)async {
//       // Handle the notification when the app is in the foreground on iOS
//       //print("Foreground Notification Clicked: $payload");
//       //  },
//     );
//     const iOS = initializationSettingsIOS;
//     const andriod = initializationSettingsAndroid;
//     const settings = InitializationSettings(android: andriod, iOS: iOS);
//     await _localNotifications.initialize(
//       settings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) async {
//         // Handle notification tapped when the app is in the background or terminated
//         print('Notification payload: ${response.payload}');
//       },
//     );
//   }
// }
