// SHA1: 31:24:3E:D7:BF:80:4D:94:C4:BC:B5:8E:D2:BA:55:4B:8A:4C:AF:0B

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _streamMessage = StreamController.broadcast();
  static Stream<String> get streamMessage => _streamMessage.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    //print('background Handler: ${message.messageId}');
    _streamMessage.add(message.data['info'] ?? 'No data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    //print('onMessage Handler: ${message.messageId}');
    print(message.data);
    _streamMessage.add(message.data['info'] ?? 'No data');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    //print('onMessageOpenApp Handler: ${message.messageId}');
    _streamMessage.add(message.data['info'] ?? 'No data');
  }

  static Future iniApp() async {
    //Push Notification
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
    //Local Notification
  }

  static closeStreams() {
    _streamMessage.close();
  }
}
