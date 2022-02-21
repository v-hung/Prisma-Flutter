import 'package:flutter/material.dart';
import 'package:mobile/screens/home/profile/components/gird/gird_child.dart';

class ContentInScreen extends StatelessWidget {
  const ContentInScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: GridChild(),
    );
  }
}
