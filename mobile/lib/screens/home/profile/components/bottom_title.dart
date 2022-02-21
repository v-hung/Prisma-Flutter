import 'package:flutter/material.dart';
import 'package:mobile/utils/config.dart';

class BottomTitle extends StatelessWidget {
  const BottomTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xFFEEEEEE)
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,1),
            blurRadius: 1,
            color: Colors.grey
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.grid_view_rounded),
            onPressed: () {},
            color: Colors.red,
          ),
          IconButton(
            icon: Icon(Icons.image_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.play_circle),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.queue_music_rounded),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

