import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/models/User.dart';
import 'package:mobile/providers/user.provider.dart';
import 'package:mobile/screens/auth/login/login_screen.dart';
import 'package:mobile/screens/home/layout.dart';
import 'package:mobile/screens/auth/welcome/welcome_screen.dart';
// import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final UserController? _user = Get.find();

    return Obx(() {
      if (_user?.user.value != null) {
        return WelcomeScreen();
      } else {
        print('not null');
        return HomeScreen();
      }
    });

    // return HomeScreen();

  }
}
