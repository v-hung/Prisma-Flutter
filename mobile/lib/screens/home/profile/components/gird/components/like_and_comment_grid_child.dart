import 'package:flutter/material.dart';

class LikeAndCommentGridChild extends StatelessWidget {
  const LikeAndCommentGridChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List items = [
      'images/user.jpg',
      'images/user.jpg',
      'images/user.jpg'
    ];

    final itemImageStack = items.asMap().map((index, item) {
      final value = Container(
        width: 35,
        height: 35,
        child: ItemImage(
          image: item
        ),
        margin: EdgeInsets.only(
          left: (35 - 10) * index.toDouble()
        ),
      );

      return MapEntry(index, value);
    }).values.toList();

    return Row(
      children: [
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Transform.translate(
                  offset: const Offset(0.0, 2.0),
                  child: Icon(Icons.favorite, size: 20, color: Colors.red[300],)
                )
              ),
              TextSpan(
                text: ' 1125',
              )
            ]
          ),
        ),
        SizedBox(width: 20,),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Transform.translate(
                  offset: const Offset(0.0, 3.0),
                  child: Icon(Icons.message_outlined, size: 20, color: Colors.green[300],)
                )
              ),
              TextSpan(
                text: ' 348',
              )
            ]
          ),
        ),
        Spacer(),
        Stack(
          children: itemImageStack.reversed.toList()
        )
      ],
    );

  }
}

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key? key,

    required this.image
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(2),
        color: Colors.white,
        child: ClipOval(
          child: Image.asset(
            '$image',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
