import 'package:flutter/material.dart';

import 'text_infomation.dart';

class MiddleTitle extends StatelessWidget {
  const MiddleTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Row(
        children: [
          TextInfomation(
            number: 128,
            title: 'Post',
          ),
          Spacer(),
          TextInfomation(
            number: 3120,
            title: 'Follwing',
          ),
          Spacer(),
          TextInfomation(
            number: 5024,
            title: 'Follower',
          ),
        ],
      ),
    );
  }
}
