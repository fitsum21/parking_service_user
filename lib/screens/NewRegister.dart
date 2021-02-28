import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psu/screens/AddVehicle.dart';
import 'package:psu/widgets/custom_textField.dart';

class NewRegister extends StatefulWidget {
  @override
  _NewRegisterState createState() => _NewRegisterState();
}

class _NewRegisterState extends State<NewRegister> {
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
              height: MediaQuery.of(context).size.height / 3,
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
                'Get Started!',
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 36, 54, 87),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Let\'s create your account!',
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
                    CustomTextField(
                      hintText: 'Bereket Tadege',
                      label: 'FULL NAME',
                      icon: Icon(Icons.person_outline,color: Color.fromARGB(255, 27, 114, 251),size: 26,),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    
                    CustomTextField(
                      hintText: 'bereket@gmail.com',
                      label: 'EMAIL',
                      icon: Icon(Icons.mail_outline,color: Color.fromARGB(255, 27, 114, 251),size: 26),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hintText: '915 629 212',
                      label: 'PHONE NUMBER',
                      icon: Icon(Icons.phone,color: Color.fromARGB(255, 27, 114, 251),size: 26),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                      onPressed: () async {
                        // print("success!");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddVehicle()));
                        // final firestoreInstance = Firestore.instance;
                        // firestoreInstance
                        //     .collection("users")
                        //     .document()
                        //     .setData({
                        //   "name": "john",
                        //   "age": 50,
                        //   "email": "example@example.com",
                        //   "address": {"street": "street 24", "city": "new york"}
                        // }).then((_) {
                        //   print("success!");
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => AddVehicle()));
                        // });
                      },
                      color: Color.fromARGB(255, 27, 114, 251),
                      child: Container(
                        height: 60,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
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
                'Already have an account?',
                style: TextStyle(color: Colors.black45, fontSize: 18),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  ' Login',
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
