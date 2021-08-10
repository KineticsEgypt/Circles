
import 'package:circles/views/app_style/colors.dart';
import 'package:circles/views/pages/home_pages/cinema_page/buy_cinema_ticket.dart';
import 'package:circles/views/pages/home_pages/cinema_page/movie_details.dart';
import 'package:circles/views/pages/home_pages/home.dart';
import 'package:circles/views/pages/home_pages/place_page/place_details/place_detials_page.dart';
import 'package:circles/views/pages/home_pages/place_page/reserve_page/researve_page.dart';
import 'package:circles/views/pages/land_page.dart';
import 'package:circles/views/pages/sign_in_pages/sign_in_page.dart';
import 'package:circles/views/pages/sign_in_pages/sign_up_page.dart';
import 'package:circles/views/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controlers/providers/widgets/page_index_provider.dart';
import 'views/pages/place_owner/place_dashboard.dart';


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
          themeMode: ThemeMode.system,
          theme: ThemeData(
            fontFamily: "Gothic",
            scaffoldBackgroundColor: Colors.grey[100],
            accentColor: AColors.golden,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            canvasColor: AColors.blue,
            colorScheme: ColorScheme.light(
              primary: Colors.white,
              onPrimary: Colors.black,
              secondary: AColors.lightBlue,
              secondaryVariant: AColors.deepBlue,
            ),
          ),
          darkTheme: ThemeData(
            fontFamily: "Gothic",
            accentColor: AColors.golden,
            scaffoldBackgroundColor: Colors.grey[850],
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.dark,
            canvasColor: Colors.grey[900],
            colorScheme: ColorScheme.dark(
              primary: Colors.white,
              onPrimary: Colors.black,
              secondary: Colors.grey[900],
              onSecondary: Colors.white,
              secondaryVariant: Colors.black,
            ),
          ),
          initialRoute: SignInPage.id,
          routes: {
            Home.id: (_) => Home(),
            SignInPage.id: (_) => SignInPage(),
            SignUpPage.id: (_) => SignUpPage(),
            PlaceDashboard.id: (_) => PlaceDashboard(),
            PlaceDetailsPage.id: (_) => PlaceDetailsPage(),
            LandPage.id: (_) => LandPage(),
            SplashPage.id: (_) => SplashPage(),
            ReservePage.id: (_) => ReservePage(),
            MovieDetails.id: (_) => MovieDetails(),
            BuyCinemaTicket.id: (_) => BuyCinemaTicket(),
          },
        ),
      ),
    );
  }
}

