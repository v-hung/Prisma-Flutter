import 'package:flutter/material.dart';

import 'bottom_title.dart';
import 'middel_title.dart';
import 'top_title.dart';

class TitleInScreen extends StatelessWidget {
  const TitleInScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopTitle(),
        MiddleTitle(),
        BottomTitle()
      ],
    );
  }
}
