import 'package:flutter/material.dart';
import 'package:psu/widgets/custom_textField.dart';

class UpdateProfiel extends StatefulWidget {
  @override
  _UpdateProfielState createState() => _UpdateProfielState();
}

class _UpdateProfielState extends State<UpdateProfiel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Update Profile',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 1.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/friend1.jpg'),
                      radius: 40,
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                    CustomTextField(
                      hintText: 'Bereket Tadege',
                      label: 'NAME',
                      icon: Icon(Icons.person_outline,
                          color: Color.fromARGB(255, 27, 114, 251), size: 26),
                    ),
                    CustomTextField(
                      hintText: 'bereket@gmail.com',
                      label: 'EMAIL',
                      icon: Icon(Icons.mail_outline,
                          color: Color.fromARGB(255, 27, 114, 251), size: 26),
                    ),
                    CustomTextField(
                      hintText: '915 629 212',
                      label: 'PHONE NUMBER',
                      icon: Icon(Icons.phone,
                          color: Color.fromARGB(255, 27, 114, 251), size: 26),
                    ),
                    CustomTextField(
                      hintText: '*********',
                      label: 'PASSWORD',
                      icon: Icon(Icons.lock_outline,
                          color: Color.fromARGB(255, 27, 114, 251), size: 26),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color.fromARGB(255, 38, 203, 151),
                child: Container(
                  height: 60,
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ]),
      ),
    );
  }
}
