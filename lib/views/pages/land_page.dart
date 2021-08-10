import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/pages/sign_in_pages/sign_in_page.dart';
import 'package:circles/views/widgets/buttons/app_flat_button.dart';

import '../widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';

import 'home_pages/home.dart';
class LandPage extends StatelessWidget {
  static final String id = "/land-page";
  double _width;
  double _height;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_dark.png"),
            fit: BoxFit.cover,
          )
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: _height/10,
            ),
            Center(
              child: Image(
                  width: _width/3,
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.contain,
              ),
            ),
            Text(
                "Party in luxuriously",
              style: Theme.of(context).textTheme.subtitle2,
              textScaleFactor: AppStyle.getScaleFactor(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: _height/2.2,
            ),
            Center(
              child: SizedBox(
                width: _width/1.2,
                child: AButton(
                  text: "Get started",
                  onPressed: (){
                    Navigator.of(context).pushNamed(Home.id);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: SizedBox(
                width: _width/1.2,
                child: ATextButton(
                    onTap: (){
                      Navigator.of(context).pushNamed(SignInPage.id);
                    },
                    text:"Already have an account"
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
