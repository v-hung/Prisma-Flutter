import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/providers/user.provider.dart';

class TopTitle extends StatelessWidget {
  const TopTitle({
    Key? key,
  }) : super(key: key);
  // final Function() edit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final UserController? _user = Get.find();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Container(
              width: size.width * 0.25,
              height: size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(_user?.user.value?.image ?? ''),
                  fit: BoxFit.cover,
                  onError: (error, stackTrace) {
                    if (_user?.user.value == null)
                      return;
                    
                    _user?.user.value?.image = 'images/user.jpg';
                    _user?.user.refresh();
                  },
                )
              ),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Flexible(
                          child: Text(
                            '${_user?.user.value?.name}',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Icon(
                        Icons.edit,
                        color: Colors.green[700],
                        size: 20,
                      )
                    ],
                  ),
                  Text(
                    '@${_user?.user.value?.email}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
