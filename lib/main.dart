import 'package:circles/app_style/colors.dart';
import 'package:circles/controlers/providers/page_index_provider.dart';
import 'package:circles/pages/home_pages/home.dart';
import 'package:circles/pages/home_pages/place_page/place_details/place_detials_page.dart';
import 'package:circles/pages/land_page.dart';
import 'package:circles/pages/splach_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_pages/place_page/reserve_page/researve_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PageIndexProvider()),
        ],
        child: MaterialApp(
          title: 'Circles',
          theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: CirclesColors.yellow,
            scaffoldBackgroundColor: Colors.black,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.dark,
            appBarTheme: AppBarTheme(
              brightness: Brightness.light,
              color: Colors.white,
            ),

          ),
          initialRoute: LandPage.id,
          routes: {
            Home.id: (_) => Home(),
            PlaceDetailsPage.id: (_) => PlaceDetailsPage(),
            LandPage.id: (_) => LandPage(),
            SplashPage.id: (_) => SplashPage(),
            ReservePage.id: (_) => ReservePage(),
          },
        ),
      ),
    );
  }
}

