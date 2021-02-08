import 'package:amcCarePlanner/entities/branch/branch_route.dart';
import 'package:amcCarePlanner/entities/eligibility/eligibility_route.dart';
import 'package:amcCarePlanner/entities/employee/employee_route.dart';
import 'package:amcCarePlanner/entities/employee_document/employee_document_route.dart';
import 'package:amcCarePlanner/entities/notifications/notifications_route.dart';
import 'package:amcCarePlanner/entities/service_user/service_user_route.dart';
import 'package:amcCarePlanner/shared/widgets/curved_navigation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amcCarePlanner/account/login/login_repository.dart';
import 'package:amcCarePlanner/generated/l10n.dart';
import 'package:amcCarePlanner/keys.dart';
import 'package:amcCarePlanner/more/bloc/more_bloc.dart';
import 'package:amcCarePlanner/shared/widgets/drawer/bloc/drawer_bloc.dart';
import 'package:amcCarePlanner/shared/widgets/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({Key key}) : super(key: AmcCarePlannerKeys.moreScreen);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreBloc, MoreState>(
      buildWhen: (previous, current) =>
          previous.currentUser != current.currentUser,
      builder: (context, state) {
        return Scaffold(
            // backgroundColor: Color.fromRGBO(114, 57, 241, 1),
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Color.fromRGBO(114, 57, 241, 1),
              // leading: Icon(Icons.sort),
              title: Text(
                'CarePlanner',
                style: TextStyle(
                    fontFamily: 'Roboto Medium',
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            // appBar: AppBar(
            //   centerTitle: true,
            //   title: Text(S.of(context).pageMoreTitle),
            // ),
            // backgroundColor: Colors.white,
            body: body(context),
            bottomNavigationBar: CurvedNavigation(),
            drawer: BlocProvider<DrawerBloc>(
                create: (context) =>
                    DrawerBloc(loginRepository: LoginRepository()),
                child: AmcCarePlannerDrawer()));
      },
    );
  }

  Widget body(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            createGridItem(0),
            createGridItem(1),
            createGridItem(2),
            createGridItem(3),
            createGridItem(4),
            createGridItem(5),
          ],
        ),
      ),
    );
  }

  Widget createGridItem(int position) {
    var color = Colors.white;
    var icondata = Icons.add;

    switch (position) {
      case 0:
        color = Colors.cyan;
        icondata = Icons.map;
        break;
      case 1:
        color = Colors.deepPurple;

        icondata = Icons.add_location;
        break;
      case 2:
        color = Colors.orange[300];
        icondata = Icons.library_books;
        break;
      case 3:
        color = Colors.pinkAccent;
        icondata = Icons.access_time;
        break;
      case 4:
        color = Colors.teal[900];
        icondata = Icons.add_shopping_cart;
        break;
      case 5:
        color = Colors.green[600];
        icondata = Icons.list;
        break;
    }
    return Builder(builder: (context) {
      return Padding(
        padding:
            const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
        child: Card(
          elevation: 10,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.white),
          ),
          child: InkWell(
            onTap: () {
              if (position == 0)
              if (position == 1)
              if (position == 2)
              if (position == 3)
              if (position == 4)
              if (position == 5)
              Navigator.pushNamed(context, ServiceUserRoutes.list);
              Navigator.pushNamed(context, NotificationsRoutes.list);
              Navigator.pushNamed(context, EmployeeDocumentRoutes.list);
              Navigator.pushNamed(context, EligibilityRoutes.list);
              Navigator.pushNamed(context, BranchRoutes.list);
              Navigator.pushNamed(context, EmployeeRoutes.list);
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Selected Item $position")));
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    icondata,
                    size: 40,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
      ;
    });
  }
}
