import 'dart:async';

import 'package:flutter/material.dart';
import 'package:psu/blocs/user_bloc.dart';
import 'package:psu/constants/auth_state.dart';
import 'package:psu/main.dart';
import 'package:psu/screens/NewLogin.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserBloc _userBloc = UserBloc();
  AuthState userState;

  @override
  void initState() {
    super.initState();
    _userBloc.userState.listen((onData){
      setState(() {
        userState = onData;
      });
      print(onData);
    });
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => 
           userState == AuthState.LOGGED_IN ? MyHomePage():NewLogin())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: Column(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/2,
              child: Image.asset(
            'assets/splash_image.png',
            alignment: Alignment.bottomCenter,
          )),
          SizedBox(
            height: MediaQuery.of(context).size.width / 7,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 30),
            child: Column(
              children: <Widget>[
                Text(
                  'Welcome To Smart Parking',
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 36, 54, 87),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.width/ 18,),
                Text(
                  'Find the best possible parking space nearby',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 128, 146, 172),
                    // fontWeight: FontWeight.bold
                  ), 
                ),
                SizedBox(height: 8),
                Text(
                  'your desired destination',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 128, 146, 172),
                    // fontWeight: FontWeight.bold
                  ), 
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
