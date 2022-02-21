import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/models/User.dart';
import 'package:mobile/providers/user.provider.dart';
import 'package:mobile/screens/wrapper.dart';
import 'package:mobile/utils/config.dart';

import 'profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final UserController? _user = Get.find();

    Size size = MediaQuery.of(context).size;

    // if (_user?.user.value == null) {
    //   return Wrapper();
    // }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red,),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.red,),
            onPressed: () {},
          ),
          SizedBox(width: 5,)
        ],
      ),
      body: ProfileScreen(),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0,-5),
              blurRadius: 10,
              color: kPrimaryColor.withOpacity(0.15)
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home_outlined, size: 30, color: Colors.red,),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.calendar_today_outlined, size: 30, color: Colors.red,),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.message_outlined, size: 30, color: Colors.red,),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_outlined, size: 30, color: Colors.red,),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person, size: 30, color: Colors.red,),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
