import 'package:flutter/material.dart';
import 'package:ingreso/src/pages/check_auth_page.dart';
import 'package:ingreso/src/pages/home_page.dart';
import 'package:ingreso/src/pages/login_page.dart';
import 'package:ingreso/src/services/auth_service.dart';
import 'package:ingreso/src/services/notifications_service.dart';
import 'package:ingreso/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new AuthService()),
      ],
      child: MaterialApp(
        title: 'Ingreso App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'checking',
        routes: {
          'checking': (_) => CheckAuthPage(),
          'home': (BuildContext context) => HomePage(),
          'login': (BuildContext context) => LoginPage(),
        },
        scaffoldMessengerKey: NotificationsService.messengerKey,
        theme: miTema,
      ),
    );
  }
}