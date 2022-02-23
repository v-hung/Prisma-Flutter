import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/apis/auth.api.dart';
import 'package:mobile/models/User.dart';
import 'package:mobile/screens/home/layout.dart';
import 'package:mobile/utils/config.dart';
import 'dart:async';

class UserController extends GetxController {
  final user = Rxn<User>();

  Future? login({email, password}) async {
    try {

      showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
      );

      // await Future.delayed(Duration(milliseconds : 500));

      User? result = await loginAPI(email: email, password: password);
      user.value = result;

      Timer timer = Timer(Duration(milliseconds: 1000), (){
        Navigator.of(Get.overlayContext!).pop();
      });

      showDialog(
        context: Get.overlayContext!,
        barrierDismissible: true,
        builder: (_) => Center(
          child: Container(
            height: 100,
            // color: Colors.white,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
            ),
            padding: EdgeInsets.all(20),
            child: Text(
              'Đăng nhập thành công',
              style: TextStyle(
                fontSize: 20,
                color: Colors.green[700],
                decoration: TextDecoration.none
              ),
            ),
          )
        )
      ).then((value){
        Get.to(HomeScreen());
      });

    }
    catch (e) {
      Navigator.of(Get.overlayContext!).pop();

      var _buildButton = AlertDialog(
        title: const Text('Đăng nhập không thành công'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('$e'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Đóng'),
            onPressed: () {
              Navigator.of(Get.overlayContext!).pop();
            },
          ),
        ],
      );

      Get.dialog(
        _buildButton,
        barrierDismissible: true,
      );
      
      return null;
    }
  }
}
