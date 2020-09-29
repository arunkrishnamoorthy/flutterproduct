import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Body extends StatelessWidget {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _logout() async {
    try {
      await _googleSignIn.signOut();
      // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Go to home",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Log Out",
            press: () {
              // _googleSignIn.signOut();
              _logout();
              // Navigator.pushNamed(context, HomeScreen.SignInScreen);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
