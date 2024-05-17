/*
import 'dart:convert';
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vibration/vibration.dart';
import 'package:http/http.dart' as http;

import 'utils.dart';

class ReceivedNotification {
  ReceivedNotification({
    required this.channel,
    required this.sound,
    required this.name,
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
    required this.image,
  });
  final String? channel;
  final String? sound;
  final String? name;
  final String? image;
  final int? id;
  final String? title;
  final String? body;
  final String? payload;
  @override
  String toString() {
    return 'YourClass{'
        'channel: $channel, '
        'sound: $sound, '
        'name: $name, '
        'image: $image, '
        'id: $id, '
        'title: $title, '
        'body: $body, '
        'payload: $payload'
        '}';
  }
}

final _localNotifications = FlutterLocalNotificationsPlugin();
Set<int> processedNotifications = <int>{};

class LocalNotificationHandler {
  static const _iOS = DarwinInitializationSettings();
  static const _android = AndroidInitializationSettings('@drawable/noti_icons');
  static const _iosDetail = DarwinNotificationDetails(
    presentSound: true,
    presentAlert: true,
    presentBadge: true,
    badgeNumber: 0,
    sound: 'app_sound',
  );
  // use _andriodDetail for notification inside app
  static AndroidNotificationDetails _andriodDetail({
    required String channel,
    required String name,
    required String sound,
    String? iconPath,
    StyleInformation? style,
  }) =>
      AndroidNotificationDetails(
        channel,
        name,
        playSound: true,
        importance: Importance.max,
        priority: Priority.high,
        sound: RawResourceAndroidNotificationSound(sound),
        largeIcon: iconPath != null ? FilePathAndroidBitmap(iconPath) : null,
        icon: '@drawable/noti_icons',
        styleInformation: style,
      );
  // use _androidChannel for notification out side app
  static AndroidNotificationChannel _androidChannel(
      {required String channel, required String name, required String sound}) {
    return AndroidNotificationChannel(
      channel,
      name,
      playSound: true,
      importance: Importance.high,
      enableVibration: true,
      showBadge: true,
      sound: RawResourceAndroidNotificationSound(sound),
    );
  }

  static Future<NotificationDetails> _notificationDetail({
    String? url,
    required String channel,
    required String name,
    required String sound,
  }) async {
    BigPictureStyleInformation? bigPicture;
    String? filePath;
    if (url != null && url.isNotEmpty) {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final image = response.bodyBytes;
        bigPicture = BigPictureStyleInformation(
          ByteArrayAndroidBitmap.fromBase64String(base64Encode(image)),
          largeIcon:
              ByteArrayAndroidBitmap.fromBase64String(base64Encode(image)),
        );
        final Directory directory = await getApplicationDocumentsDirectory();
        filePath = '${directory.path}/iosBigImage.jpg';
        final File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
      }
    }

    return NotificationDetails(
      android: _andriodDetail(
        channel: channel,
        name: name,
        sound: sound,
        style: bigPicture,
        iconPath: filePath,
      ),
      iOS: _iosDetail,
    );
  }

  static Future<void> onClickAppOpening(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      var data = json.decode(payload!);
      var type = data['data']['type'] ?? '';
      var id = data['data']['id'];
      if (id != null) {
        if (id.runtimeType == String) {
          id = int.parse(id);
        }
      }

      // InboxMessageController.onClickNotificationBanner(type, id: id);
      logWarning('notification payload: $id $type');
    }
  }

  static _createChannel(AndroidNotificationChannel notificationChannel) async {
    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(notificationChannel);
  }

  static Future initLocalNotification() async {
    if (Platform.isAndroid) {
      await _createChannel(_androidChannel(
        channel: 'channel-01',
        name: 'PE Merchant App',
        sound: 'app_sound',
      ));
      await _createChannel(
        _androidChannel(
          channel: 'channel-order',
          name: 'PE New Order',
          sound: "order_sound",
        ),
      );
    }
    const settings = InitializationSettings(android: _android, iOS: _iOS);
    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: onClickAppOpening,
    );
  }

  static Future showBigNotification({
    required ReceivedNotification msg,
  }) async {
    logSuccess(msg.toString());
    if (!processedNotifications.contains(msg.id)) {
      processedNotifications.add(msg.id!);
      await _localNotifications.show(
        msg.id!,
        msg.title,
        msg.body,
        payload: msg.payload,
        await _notificationDetail(
          url: msg.image,
          channel: msg.channel ?? 'channel-01',
          name: msg.name ?? 'PE Merchant App',
          sound: 'app_sound',
        ),
      );
      logInfo('id $msg');

      if (await Vibration.hasVibrator() ?? false) {
        Vibration.vibrate();
      }
    }
  }
}
*/