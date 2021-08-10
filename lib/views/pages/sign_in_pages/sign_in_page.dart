import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/app_style/colors.dart';
import 'package:circles/views/pages/place_owner/place_dashboard.dart';
import 'package:circles/views/pages/sign_in_pages/sign_up_page.dart';
import 'package:circles/views/widgets/backgrounds/form_background.dart';
import 'package:circles/views/widgets/buttons/app_button.dart';
import 'package:circles/views/widgets/buttons/app_flat_button.dart';
import 'package:circles/views/widgets/buttons/app_icon_button2.dart';
import 'package:circles/views/widgets/loaders/loading_manager.dart';
import 'package:circles/views/widgets/text_field/app_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SignInPage extends StatefulWidget {
  static final String id = "/sign-out";
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Size _size;
  bool _showPassword = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context){
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: FormBackground(
        child: LoadingManager(
          isLoading: _isLoading,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * AppStyle.getScaleFactor(context),
              vertical: 16 * AppStyle.getScaleFactor(context),
            ),
            children: [
              SizedBox(height: _size.height/10,),
              Center(
                child: Image(
                  width: _size.width/3,
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.contain,
                  //color: Theme.of(context).colorScheme.onPrimary
                ),
              ),
              Text(
                "Sign In",
                style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Theme.of(context).colorScheme.primary
                ),
                textScaleFactor: AppStyle.getScaleFactor(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32 * AppStyle.getScaleFactor(context),),
              ATextFormField(
                label: "Email",

              ),
              SizedBox(height: 16 * AppStyle.getScaleFactor(context),),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ATextButton(
                    text: "Forget Password?",
                    color: Theme.of(context).colorScheme.primary,
                    onTap: (){

                    },
                  ),
                ],
              ),
              SizedBox(height: 32 * AppStyle.getScaleFactor(context),),
              AButton(
                text: "Sign In",
                onPressed: () async {
                  _isLoading = true;
                  setState(() {});
                  await Future.delayed(Duration(seconds: 5));
                  _isLoading = false;
                  setState(() {});
                  Navigator.of(context).pushNamed(PlaceDashboard.id);
                },
              ),
              SizedBox(height: _size.height/10,),
             // SizedBox(height: 32 * AppStyle.getScaleFactor(context),),
              Text(
                "or sign in with",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't you have accout!",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).colorScheme.primary
                    ),
                    textScaleFactor: AppStyle.getScaleFactor(context),
                    textAlign: TextAlign.center,
                  ),
                  ATextButton(
                    text: "Sign Up Now?",
                    color: Theme.of(context).colorScheme.primary,
                    onTap: (){
                      Navigator.of(context).pushNamed(SignUpPage.id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
