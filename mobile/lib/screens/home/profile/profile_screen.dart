import 'package:flutter/material.dart';
import 'package:mobile/screens/home/profile/components/title_in_screen.dart';

import 'components/content_in_screen.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey[900],),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.settings, color: Colors.grey[900],),
              onPressed: () {},
            ),
            SizedBox(width: 5,)
          ],
        ),
        SliverPersistentHeader(
                  pinned: true,
                  delegate: PersistentHeader(
                    widget: Row(
                      // Format this to meet your need
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                      ],
                    ),
                  ),
                ),
        SliverToBoxAdapter(
          child: Container(
            // constraints: BoxConstraints(
            //   minHeight: size.height - 80 - 60
            // ),
            decoration: BoxDecoration(
              color: Colors.grey[100]
            ),
            // padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                TitleInScreen(),
                // ContentInScreen()
                // Expanded(child: Text('hihi'))
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ContentInScreen();
            },
          ),
        ),
      ]
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;

  PersistentHeader({required this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: 56.0,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Colors.white,
        elevation: 5.0,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 56.0;

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}