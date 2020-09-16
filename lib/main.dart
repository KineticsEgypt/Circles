import 'package:circles/app_style/colors.dart';
import 'package:circles/pages/home.dart';
import 'package:circles/pages/land_page.dart';
import 'package:circles/pages/splach_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circles',
      theme: ThemeData(
        primaryColor: Colors.grey,
        accentColor: CirclesColors.yellow,
        scaffoldBackgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark
      ),
      initialRoute: LandPage.id,
      routes: {
        Home.id: (_) => Home(),
        LandPage.id: (_) => LandPage(),
        SplashPage.id: (_) => SplashPage(),
      },
    );
  }
}

