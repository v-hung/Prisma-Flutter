import 'package:flutter/material.dart';

import 'components/item_grid_child.dart';

class GridChild extends StatelessWidget {
  const GridChild({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemGridChild(),
        SizedBox(height: 20,),
        ItemGridChild(),
        SizedBox(height: 20,),
        ItemGridChild(),
        SizedBox(height: 20,),
        ItemGridChild()
      ],
    );
  }
}


