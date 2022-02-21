import 'package:flutter/material.dart';
import 'package:mobile/screens/home/profile/components/title_in_screen.dart';

import 'components/content_in_screen.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        minHeight: size.height - 80 - 50
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100]
      ),
      // padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          TitleInScreen(),
          Expanded(child: ContentInScreen())
        ],
      ),
    );
  }
}
