import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:circles/widgets/buttons/c_flat_button.dart';
import '../widgets/buttons/c_button.dart';
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
            image: AssetImage("assets/images/land_page_background.png"),
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
              style:CirclesTextStyles.header6,
              textScaleFactor: CirclesTextStyles.getScaleFactor(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: _height/2.2,
            ),
            Center(
              child: SizedBox(
                width: _width/1.2,
                child: CButton(
                  text: "Get started",
                  onTap: (){
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
                child: CFlatButton(
                    onTap: (){},
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
