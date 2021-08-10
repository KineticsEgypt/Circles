import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/app_style/colors.dart';
import 'package:circles/views/widgets/backgrounds/form_background.dart';
import 'package:circles/views/widgets/buttons/app_button.dart';
import 'package:circles/views/widgets/buttons/app_flat_button.dart';
import 'package:circles/views/widgets/buttons/app_button_with_icon.dart';
import 'package:circles/views/widgets/buttons/app_icon_button2.dart';
import 'package:circles/views/widgets/text_field/app_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SignUpPage extends StatefulWidget {
  static final String id = "/sign-up";
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Size _size;
  bool _showPassword = false;
  @override
  Widget build(BuildContext context){
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: FormBackground(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * AppStyle.getScaleFactor(context),
              vertical: 16 * AppStyle.getScaleFactor(context),
            ),
            children: [
              SizedBox(height: 16 * AppStyle.getScaleFactor(context),),
              Center(
                child: Image(
                  width: _size.width/3,
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.contain,
                  //color: Theme.of(context).colorScheme.onPrimary
                ),
              ),
              SizedBox(height: 19 * AppStyle.getScaleFactor(context),),
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Theme.of(context).colorScheme.primary
                ),
                textScaleFactor: AppStyle.getScaleFactor(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32 * AppStyle.getScaleFactor(context),),
              ATextFormField(
                label: "Name",

              ),
              SizedBox(height: 8 * AppStyle.getScaleFactor(context),),
              ATextFormField(
                label: "Email",

              ),
              SizedBox(height: 8 * AppStyle.getScaleFactor(context),),
              ATextFormField(
                label: "Phone",

              ),
              SizedBox(height: 8 * AppStyle.getScaleFactor(context),),
              ATextFormField(
                label: "Password",
                obscureText: _showPassword,
                suffixIcon: MaterialButton(
                  padding: EdgeInsets.zero,
                  minWidth: 26 * AppStyle.getScaleFactor(context),
                  child: Icon(
                    _showPassword
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: (){
                    _showPassword = !_showPassword;
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 8 * AppStyle.getScaleFactor(context),),
              ATextFormField(
                label: "Confirm Password",
                obscureText: _showPassword,
                suffixIcon: MaterialButton(
                  padding: EdgeInsets.zero,
                  minWidth: 26 * AppStyle.getScaleFactor(context),
                  child: Icon(
                    _showPassword
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: (){
                    _showPassword = !_showPassword;
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 32 * AppStyle.getScaleFactor(context),),
              AButton(
                text: "Sign Up",
                onPressed: (){

                },
              ),
              SizedBox(height: 16 * AppStyle.getScaleFactor(context),),
              Text(
                "or sign up with",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Theme.of(context).colorScheme.primary
                ),
                textScaleFactor: AppStyle.getScaleFactor(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8 * AppStyle.getScaleFactor(context),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AIconButton2(
                    iconData: FontAwesomeIcons.facebookF,
                    color: AColors.faceBookColor,
                    onPressed: (){},
                  ),
                  AIconButton2(
                    iconData: FontAwesomeIcons.google,
                    color: AColors.googleColor,
                    onPressed: (){},
                  ),
                  AIconButton2(
                    iconData: FontAwesomeIcons.apple,
                    color: AColors.appleColor,
                    onPressed: (){},
                  ),
                ],
              ),
              SizedBox(height: 32 * AppStyle.getScaleFactor(context),),
            ],
          ),
        ),
      ),
    );
  }
}
