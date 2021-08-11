import 'package:flutter/material.dart';

import 'package:notifications_template/Screens/screens.dart';
import 'package:notifications_template/Services/pushNotificationService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.iniApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/',
        routes: {'/': (_) => HomeScreen(), 'notify': (_) => NotifyScreen()});
  }
}
