import 'package:flutter/material.dart';
import 'package:psu/blocs/user_bloc.dart';
import 'package:psu/screens/Confirmation.dart';
import 'package:psu/screens/NewRegister.dart';

class NewLogin extends StatefulWidget {
  @override
  _NewLoginState createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
  final UserBloc _userBloc = UserBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromARGB(255, 246, 247, 251),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/logo3.png',
                      width: 70,
                      height: 70,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Smart Parking',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 36, 54, 87),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome Back!',
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 36, 54, 87),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Enter your mobile number to login',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 128, 146, 172),
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Ethiopia",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                            borderRadius: BorderRadius.circular(8)),
                        prefixIcon: Image.asset('assets/Flag_of_Ethiopia.png'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "915629212",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                            borderRadius: BorderRadius.circular(8)),
                        prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 10, top: 14),
                            child: Text(
                              '+251',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 140, 144, 153),
                                  fontSize: 16),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                      onPressed: () {
                        _userBloc.getUserPhone.add('+251953057156');
                        _userBloc.getVerificationStatus.listen((value){
                          if (value == true) {
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Confirmation()));
                        }
                        });
                        
                      },
                      color: Color.fromARGB(255, 27, 114, 251),
                      child: Container(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Send Code',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    )
                  ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'New user?',
                style: TextStyle(color: Colors.black45, fontSize: 18),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewRegister()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Color.fromARGB(255, 27, 114, 251), fontSize: 18),
                ),
              ),
            ],
          ),
        ]),
      ),
    ));
  }
}
