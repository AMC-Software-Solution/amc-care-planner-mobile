import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';

class CurvedNavigation extends StatelessWidget {
  CurvedNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: 0,
      height: 50.0,
      items: <Widget>[
        Icon(
          Icons.home,
          size: 25,
          color: Colors.white,
        ),
        Icon(
          Icons.notifications,
          size: 25,
          color: Colors.white,
        ),
        Icon(
          Icons.add,
          size: 25,
          color: Colors.white,
        ),
        Icon(
          Icons.person,
          size: 25,
          color: Colors.white,
        ),
        Icon(
          Icons.settings,
          size: 25,
          color: Colors.white,
        ),
        Icon(
          Icons.more_horiz_outlined,
          size: 30,
          color: Colors.white,
        ),

      ],
      color: Color.fromRGBO(114, 57, 241, 1),
      buttonBackgroundColor: Colors.deepPurple,
      backgroundColor: Colors.white,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: (index) {
        if (index == 4)
          Navigator.pushNamed(context, AmcCarePlannerRoutes.settings);
        if (index == 0)
          Navigator.pushNamed(context, AmcCarePlannerRoutes.main);
      },
    );
  }
}
