import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/providers/user.provider.dart';
import 'text_infomation.dart';

class MiddleTitle extends StatelessWidget {
  const MiddleTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final UserController? _user = Get.find();


    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Obx( () => Row(
        children: [
          TextInfomation(
            number: _user?.user.value?.posts ?? 0,
            title: 'Posts',
          ),
          Spacer(),
          TextInfomation(
            number: _user?.user.value?.following ?? 0,
            title: 'Follwing',
          ),
          Spacer(),
          TextInfomation(
            number: _user?.user.value?.followers ?? 0,
            title: 'Followers',
          ),
        ],
      ),)
    );
  }
}
