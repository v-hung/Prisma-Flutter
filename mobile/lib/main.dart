import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile/models/User.dart';
import 'package:mobile/providers/user.provider.dart';
import 'package:mobile/screens/auth/login/login_screen.dart';
import 'package:mobile/screens/auth/signup/signup_screen.dart';
import 'package:mobile/screens/auth/welcome/welcome_screen.dart';
import 'package:mobile/screens/wrapper.dart';
import 'package:get/get.dart';
import 'utils/config.dart';
import 'providers/storage.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    print(box.read('jwt'));

    final UserController? _user = Get.put(UserController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(primary: kPrimaryColor),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.grey[800]),
      ),
      // initialRoute: '/',
      home: Wrapper(),
      // getPages: [
      //   GetPage(name: '/', page: () => Wrapper()),
      //   GetPage(name: '/welcome', page: () => WelcomeScreen()),
      //   GetPage(name: '/auth/login', page: () => LoginScreen()),
      //   GetPage(name: '/auth/signup', page: () => SignupScreen())
      // ],
      // routes: {
      //   '/': (context) => const Wrapper(),
      //   '/welcome': (context) => const WelcomeScreen(),
      //   '/auth/login': (context) => const LoginScreen(),
      //   '/auth/signup': (context) => const SignupScreen(),
      // },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}
