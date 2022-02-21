import 'package:flutter/material.dart';
import 'package:mobile/utils/config.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  const AlreadyHaveAnAccountCheck({
    Key? key,

    this.login = true,
    required this.press
  }) : super(key: key);

  final bool login;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? 'Dont have an account? ' : 'Already have an account? ',
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? 'Sign up' : 'Sign in',
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}
