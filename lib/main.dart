import 'package:flutter/material.dart';

import 'package:notifications_template/Screens/screens.dart';
import 'package:notifications_template/Services/pushNotificationService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.iniApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    PushNotificationService.streamMessage.listen((message) {
      print(('MyApp $message'));
      final snackBar = SnackBar(content: Text(message));
      navigatorKey.currentState?.pushNamed('notify', arguments: message);
      scaffoldKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldKey,
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/',
        routes: {'/': (_) => HomeScreen(), 'notify': (_) => NotifyScreen()});
  }
}
