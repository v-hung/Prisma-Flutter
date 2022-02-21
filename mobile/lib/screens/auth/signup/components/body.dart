import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile/screens/auth/login/login_screen.dart';
import 'package:mobile/utils/config.dart';
import 'package:mobile/widgets/already_have_an_account_check.dart';
import 'package:mobile/widgets/rounded_button.dart';
import 'package:mobile/widgets/rounded_input_field.dart';
import 'package:mobile/widgets/rounded_password_field.dart';

import 'background.dart';
import 'or_divider.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SIGNUP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.03,),
            SvgPicture.asset(
              'icons/signup.svg',
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03,),
            RoundedInputField(
              hintText: "Your Email",
              validator: (value) {},
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Password",
              validator: (value) {},
              onChanged: (value) {},
            ),
            RoundedButton(
              title: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03,),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Get.to(LoginScreen());
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocalIcon(
                  iconSrc: 'icons/facebook.svg',
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: 'icons/twitter.svg',
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: 'icons/google-plus.svg',
                  press: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SocalIcon extends StatelessWidget {
  const SocalIcon({
    Key? key,

    required this.iconSrc,
    required this.press
  }) : super(key: key);

  final String iconSrc;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.all(Radius.circular(99))
        ),
        child: SvgPicture.asset('$iconSrc', color: kPrimaryColor, width: 20, height: 20,),
      ),
    );
  }
}



