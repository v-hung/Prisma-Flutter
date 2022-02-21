import 'package:flutter/material.dart';

import 'content_grid_child.dart';
import 'like_and_comment_grid_child.dart';
import 'tag_grid_child.dart';
import 'title_grid_child.dart';

class ItemGridChild extends StatelessWidget {
  const ItemGridChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleGridChild(),
          SizedBox(height: 20,),
          TagGridChild(),
          SizedBox(height: 10,),
          ContentGridChild(),
          SizedBox(height: 10,),
          LikeAndCommentGridChild()
        ],
      ),
    );
  }
}
