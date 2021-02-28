import 'package:flutter/material.dart';
import 'package:psu/blocs/user_bloc.dart';
import 'package:psu/screens/NewLogin.dart';
import 'package:psu/screens/Profile.dart';


class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 247, 251),
      appBar: AppBar(
        title: Text('My Account',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 22)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.height / 12,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 16,
                        width: MediaQuery.of(context).size.width / 10,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 235, 242, 253),
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.person_outline,
                            color: Color.fromARGB(255, 27, 114, 251))),
                  ),
                  Text('My Profile',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.height / 12,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 16,
                        width: MediaQuery.of(context).size.width / 10,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 235, 242, 253),
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.payment,
                            color: Color.fromARGB(255, 27, 114, 251))),
                  ),
                  Text('Payment Passes',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.height / 12,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 16,
                        width: MediaQuery.of(context).size.width / 10,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 235, 242, 253),
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.help_outline,
                            color: Color.fromARGB(255, 27, 114, 251))),
                  ),
                  Text('Help',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.height / 12,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 16,
                        width: MediaQuery.of(context).size.width / 10,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 235, 242, 253),
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.settings,
                            color: Color.fromARGB(255, 27, 114, 251))),
                  ),
                  Text('Settings',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.height / 12,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 16,
                        width: MediaQuery.of(context).size.width / 10,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 235, 242, 253),
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.date_range,
                            color: Color.fromARGB(255, 27, 114, 251))),
                  ),
                  Text('Legal',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              UserBloc().signOut().then((onValue)=>{
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewLogin()))
              });
             
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.height / 12,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 16,
                        width: MediaQuery.of(context).size.width / 10,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 235, 242, 253),
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.remove_circle_outline,
                            color: Color.fromARGB(255, 27, 114, 251))),
                  ),
                  Text('Logout',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
