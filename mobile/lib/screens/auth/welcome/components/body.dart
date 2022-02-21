import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile/screens/auth/login/login_screen.dart';
import 'package:mobile/screens/auth/signup/signup_screen.dart';
import 'package:mobile/utils/config.dart';
import 'package:mobile/widgets/rounded_button.dart';

import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BackGround(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "welcome to edu".toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05,),
            SvgPicture.asset(
              'icons/chat.svg',
              height: size.height * 0.4,
            ),
            SizedBox(height: size.height * 0.05,),
            RoundedButton(
              title: "login",
              press: () => Get.to(LoginScreen()),
            ),
            RoundedButton(
              title: "signup",
              press: () {
                Get.to(SignupScreen());
              },
              color: Colors.black,
              background: kPrimaryLightColor,
            )
          ],
        ),
      ),
    );
  }
}
