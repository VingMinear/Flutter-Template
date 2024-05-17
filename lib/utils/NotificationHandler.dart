/* config notifcation

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:m_health_app/utils/LocalStorage.dart';

import 'package:vibration/vibration.dart';

import 'LocalNotificationHandler.dart';
import 'SingleTon.dart';
import 'utils.dart';

Future<void> _handleBackgroundNotification(RemoteMessage message) async {
  logSuccess('lisent background :${message.notification!.title}');
  if (await Vibration.hasVibrator() ?? false) {
    Vibration.vibrate();
  }
}

void _handleMessageOnAppOpen(RemoteMessage message) async {
  if (message.notification == null) return;
  logSuccess("lisent in app >${message.notification!.title}");

  if (LocalStorage.getToken.isNotEmpty) {
    // 3 call for in app open
  }
  if (Platform.isAndroid) {
    _pushLocalNotification(message);
  }
}

void _pushLocalNotification(RemoteMessage message) async {
  final notification = message.notification;
  if (notification == null) return;
  var name = 'PE Merchant App';
  // var type =jsonEncode(message.toMap());
  // if(){
  //   name= 'PE New Order';
  // }
  var msg = ReceivedNotification(
    id: notification.hashCode,
    title: notification.title,
    body: notification.body,
    name: name,
    sound: notification.android?.sound,
    channel: notification.android?.channelId,
    image: notification.android?.imageUrl,
    payload: jsonEncode(message.toMap()),
  );
  await LocalNotificationHandler.showBigNotification(msg: msg);
}

final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

class NotificationHandler {
  final _firebaseMsg = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    try {
      var permission = await _firebaseMsg.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      FlutterAppBadger.removeBadge();
      if (permission.authorizationStatus == AuthorizationStatus.authorized) {
        logSuccess('User granted permission');
      } else if (permission.authorizationStatus ==
          AuthorizationStatus.provisional) {
        logSuccess('User granted provisional permission');
      } else {
        logSuccess('User declined or has not accepted permission');
      }
      await getToken();

      _initPushNotification();
    } catch (error) {
      logError(
        'CatchError while initNotification ( error message ) : >> $error',
      );
    }
  }

  Future<void> _initPushNotification() async {
    await _firebaseMsg.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // on while in app
    FirebaseMessaging.onMessage.listen(_handleMessageOnAppOpen);
    // on background while app running
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundNotification);
  }

  static Future<void> logOut() async {
    await FirebaseMessaging.instance.deleteToken();
    GlobalClass().deviceToken = '';
    await getToken();
  }

  static Future<void> getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      logSuccess("device token ----------> : $token");
      GlobalClass().deviceToken = token ?? '';
    });
  }

  Future<void> subcriptTopic() async {
    await _firebaseMsg.subscribeToTopic('pe_merchant_all');
  }

  // this all function are work not in app open * the function to handle click on app in local noti
  static Future<void> onClickTerminate({
    required Function(RemoteMessage? value) onTap,
  }) async {
    logSuccess("handleOnClickOutApp");
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      onTap(value);
    });
  }

  // this all function are work not in app open * the function to handle click on app in local noti
  static Future<void> onClickRunningBackground({
    void Function(RemoteMessage)? onData,
  }) async {
    FirebaseMessaging.onMessageOpenedApp.listen(onData);
  }
}

*/