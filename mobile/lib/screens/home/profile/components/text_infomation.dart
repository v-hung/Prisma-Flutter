import 'package:flutter/material.dart';

class TextInfomation extends StatelessWidget {
  const TextInfomation({
    Key? key,

    required this.number,
    required this.title
  }) : super(key: key);

  final int number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$number',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          '$title',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey
          ),
        )
      ],
    );
  }
}
