import 'package:flutter/material.dart';

class TagGridChild extends StatelessWidget {
  const TagGridChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: TextStyle(
          color: Colors.grey
        ),
        children: [
          TextSpan(
            text: '#relax, '
          ),
          TextSpan(
            text: '#travel '
          )
        ]
      ),
    );
  }
}
