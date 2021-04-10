import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amcCarePlanner/account/login/login_repository.dart';
import 'package:amcCarePlanner/generated/l10n.dart';
import 'package:amcCarePlanner/keys.dart';
import 'package:amcCarePlanner/main/bloc/main_bloc.dart';
import 'package:amcCarePlanner/shared/widgets/drawer/bloc/drawer_bloc.dart';
import 'package:amcCarePlanner/shared/widgets/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: AmcCarePlannerKeys.mainScreen);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) =>
          previous.currentUser != current.currentUser,
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Color.fromRGBO(114, 57, 241, 1),
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(114, 57, 241, 1),
              centerTitle: true,
              title: Text(
                'CarePlanner',
                style: TextStyle(
                    fontFamily: 'Roboto Medium',
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            body: body(context),
            drawer: BlocProvider<DrawerBloc>(
                create: (context) =>
                    DrawerBloc(loginRepository: LoginRepository()),
                child: AmcCarePlannerDrawer()));
      },
    );
  }

  Widget body(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 60.0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),
            child: SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(top: 80.0, bottom: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // Container(
                    //   child: Text(
                    //     employee.firstName + " " + employee.lastName,
                    //     style: TextStyle(
                    //         fontFamily: 'Roboto Regular',
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 19.0),
                    //   ),
                    // ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 10.0),
                        // child: Text(
                        //   employee.phone  + "\n" + employee.email,
                        //   style: TextStyle(
                        //       fontFamily: 'Roboto Regular',
                        //       color: Colors.black38,
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 14.0),
                        // ),
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Container(
                            // height:_height,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0, left: 20.0, right: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Vitals',
                                        style: TextStyle(
                                            fontFamily: 'Roboto Regular',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0),
                                      ),
                                      Icon(Icons.more_horiz),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                  EdgeInsets.only(left: 20.0, top: 5.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Daily Activity Followups',
                                    style: TextStyle(
                                        fontFamily: 'Roboto Regular',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                        color: Colors.black38),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20.0),
                                  height:
                                  MediaQuery.of(context).size.height / 4.5,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: Text(""),
                                  // ListView.builder(
                                  //     itemCount: dailyActivity.length,
                                  //     scrollDirection: Axis.horizontal,
                                  //     shrinkWrap: true,
                                  //     itemBuilder:
                                  //         (BuildContext context, int index) {
                                  //       return _buildDailyActivity(
                                  //           dailyActivity[index], index);
                                  //     }),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0, left: 20.0, right: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Plan Of Care',
                                        style: TextStyle(
                                            fontFamily: 'Roboto Regular',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0),
                                      ),
                                      Icon(Icons.more_horiz),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                  EdgeInsets.only(left: 20.0, top: 5.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Choose your plan that Fits you',
                                    style: TextStyle(
                                        fontFamily: 'Roboto Regular',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                        color: Colors.black38),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20.0),
                                  height:
                                  MediaQuery.of(context).size.height / 8,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(0.0)),
                                  ),
                                  child: Text(""),
                                  // ListView.builder(
                                  //     itemCount: planCare.length,
                                  //     scrollDirection: Axis.horizontal,
                                  //     shrinkWrap: true,
                                  //     itemBuilder:
                                  //         (BuildContext context, int index) {
                                  //       return _buildPlanCare(
                                  //           planCare[index], index);
                                  //     }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ClipOval(
              child: CircleAvatar(
                radius: 55.0,
                child: Image.asset(
                  'assets/images/female_above40.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget currentUserWidget(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
        buildWhen: (previous, current) =>
            previous.currentUser != current.currentUser,
        builder: (context, state) {
          String user = state.currentUser.firstName;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(S.of(context).pageMainCurrentUser(user),
                  style: Theme.of(context).textTheme.headline3),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: Text(S.of(context).pageMainWelcome,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3)),
            ],
          );
        });
  }

  Widget linkWidget(BuildContext context, String text, String url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: RaisedButton(
          onPressed: () => _launchURL(url),
          child: Container(
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
            width: MediaQuery.of(context).size.width * 0.5,
          )),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
