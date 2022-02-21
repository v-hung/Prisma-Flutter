import 'package:flutter/material.dart';

class TitleGridChild extends StatelessWidget {
  const TitleGridChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(99)),
            image: DecorationImage(
              image: AssetImage('images/user.jpg'),
              fit: BoxFit.cover
            )
          ),
        ),
        SizedBox(width:10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edward Kelly',
                style: TextStyle(
                  fontWeight:  FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 16
                ),
              ),
              SizedBox(height: 5,),
              Text(
                '2 hours ago',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey
                ),
              )
            ],
          ),
        ),
        SizedBox(width:10),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.more_horiz),
          color: Colors.grey,
        )
      ],
    );
  }
}
