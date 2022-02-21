import 'package:flutter/material.dart';
import 'package:mobile/utils/config.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.title,
    required this.press,
    this.color = Colors.white,
    this.background = kPrimaryColor
  }) : super(key: key);

  final String title;
  final Function() press;
  final Color background , color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        onPressed: press,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            background
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 25, horizontal: 40)
          )
        ),
        child: Text(
          '$title'.toUpperCase(),
          style: TextStyle(
            color: color
          ),
        ),
      ),
    );
  }
}
