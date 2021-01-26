import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amcCarePlanner/account/login/bloc/login_bloc.dart';
import 'package:amcCarePlanner/generated/l10n.dart';
import 'package:amcCarePlanner/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amcCarePlanner/routes.dart';
import 'package:amcCarePlanner/shared/repository/http_utils.dart';
import 'package:formz/formz.dart';

import 'bloc/login_models.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: AmcCarePlannerKeys.mainScreen);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.pushNamed(context, AmcCarePlannerRoutes.main);
        }
      },
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: Text(S.of(context).pageLoginTitle),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage(
                    'assets/images/bg-atas.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              header(context),
              loginForm(),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage(
                    'assets/images/bg-bawah.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              // register(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          image: AssetImage('assets/images/amc_logo.png'),
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width * 0.4,
        ),
      ],
    );
  }

  Widget loginField() {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.login != current.login,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: <Widget>[
                Material(
                  elevation: 15.0,
                  shadowColor: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                  child: TextFormField(
                    initialValue: state.login.value,
                    onChanged: (value) {
                      context.bloc<LoginBloc>().add(LoginChanged(login: value));
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.person_outline,
                            size: 35.0,
                            color: Colors.black,
                          ),
                        ),
                        // border: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.black),
                        // ),
                        labelText: S.of(context).pageLoginBar,
                        errorText: state.login.invalid
                            ? LoginValidationError.invalid.invalidMessage
                            : null,),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: <Widget>[
                Material(
                  elevation: 15.0,
                  shadowColor: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                  child: TextFormField(
                    initialValue: state.password.value,
                    onChanged: (value) {
                      context
                          .bloc<LoginBloc>()
                          .add(PasswordChanged(password: value));
                    },
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.lock_outline, size: 35.0,
                            color: Colors.black,
                          ),
                        ),
                        // border: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.black),
                        // ),
                        labelText: S.of(context).pageRegisterFormPassword,
                        errorText: state.password.invalid
                            ? PasswordValidationError.invalid.invalidMessage
                            : null),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget loginForm() {
    return Form(
      child: Wrap(runSpacing: 15, children: <Widget>[
        loginField(),
        passwordField(),
        validationZone(),
        submit(),
      ]),
    );
  }

  // Widget register(BuildContext context) {
  //   return RaisedButton(
  //     color: Colors.red,
  //     child: Container(
  //         width: MediaQuery.of(context).size.width,
  //         height: 50,
  //         child: Center(
  //           child: Text(S.of(context).pageRegisterTitle.toUpperCase()),
  //         )),
  //     onPressed: () =>
  //         Navigator.pushNamed(context, AmcCarePlannerRoutes.register),
  //   );
  // }

  Widget validationZone() {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Visibility(
              visible: state.status.isSubmissionFailure,
              child: Center(
                child: Text(
                  generateError(state, context),
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                    color: Theme.of(context).errorColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ));
        });
  }

  Widget submit() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Material(
              elevation: 10.0,
              color: Colors.blue,
              // shadowColor: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(
                30.0,
              ),
              child: ButtonTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minWidth: MediaQuery.of(context).size.width / 2,
                height: 50,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: RaisedButton(
                    child: Center(
                      child: Visibility(
                        replacement: CircularProgressIndicator(value: null),
                        visible: !state.status.isSubmissionInProgress,
                        child: Text(
                          S.of(context).pageLoginLoginButton.toUpperCase(),
                          style: TextStyle(
                            fontSize:15.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onPressed: state.status.isValidated
                        ? () => context.bloc<LoginBloc>().add(FormSubmitted())
                        : null,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String generateError(LoginState state, BuildContext context) {
    String errorTranslated = '';
    if (state.generalErrorKey
            .toString()
            .compareTo(LoginState.authenticationFailKey) ==
        0) {
      errorTranslated = S.of(context).pageLoginErrorAuthentication;
    } else if (state.generalErrorKey
            .toString()
            .compareTo(HttpUtils.errorServerKey) ==
        0) {
      errorTranslated = S.of(context).genericErrorServer;
    }
    return errorTranslated;
  }
}

// Column(
// children: <Widget>[
// Expanded(
// flex: 2,
// child: Container(
// width: MediaQuery.of(context).size.width,
// child: Image(
// image: AssetImage(
// 'assets/bg-atas.png',
// ),
// fit: BoxFit.fill,
// ),
// ),
// ),
// Expanded(
// flex: 4,
// child: Container(
// child: Column(
// children: <Widget>[
// Expanded(
// flex: 2,
// child: Container(
// child: Image(
// image: AssetImage(
// 'assets/logo-text.png',
// )
// ),
// ),
// ),
// Expanded(
// flex: 8,
// child: Container(
// child: Form(
// //key: _formKey,
// child: Padding(
// padding: const EdgeInsets.only(left: 30, right: 30),
// child: Column(
// children: <Widget>[
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Material(
// elevation: 15.0,
// shadowColor: Colors.black,
// borderRadius: BorderRadius.circular(30.0),
// child: new InputFieldArea(
// controller: _usernameController,
// enableValidation: false,
// hint: "Username",
// obscure: false,
// icon: Icons.person,
// suffixIcon: null,
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(
// top: 10, left: 8.0, right: 8.0, bottom: 8.0),
// child: Material(
// elevation: 15.0,
// shadowColor: Colors.black,
// borderRadius: BorderRadius.circular(30.0),
// child: new InputFieldArea(
// controller: _passwordController,
// enableValidation: false,
// hint: "Password",
// obscure: showPassword,
// icon: Icons.lock_outline,
// suffixIcon: IconButton(
// icon: showPassword
// ? (Icon(Icons.visibility_off, color: Colors.black26))
// : (Icon(Icons.visibility, color: Colors.black26)),
// onPressed: (){
// setState(() {
// showPassword = !showPassword;
// });
// },
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(top: 30),
// child: Material(
// elevation: 10.0,
// shadowColor: Colors.deepOrangeAccent,
// borderRadius: BorderRadius.circular(30.0),
// child: ButtonTheme(
// shape: new RoundedRectangleBorder(
// borderRadius:
// new BorderRadius.circular(30.0)
// ),
// minWidth: MediaQuery.of(context).size.width / 2,
// height: 50,
// child: FlatButton(
// padding: EdgeInsets.all(5),
// color: Colors.deepOrangeAccent,
// textColor: Colors.blue,
// child: new Text('Login',
// style: const TextStyle(
// color: Colors.white,
// fontSize: 16.0,
// fontWeight: FontWeight.bold,
// )
// ),
// onPressed: state is! LoginLoading ? _onLoginButtonPressed : null,
// )
// ),
// ),
// )
// ],
// ),
