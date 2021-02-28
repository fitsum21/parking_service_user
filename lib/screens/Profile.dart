import 'package:flutter/material.dart';
import 'package:psu/screens/UpdateProfile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Stack(children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 40,
                        child: Icon(
                          Icons.person,
                          color: Colors.black54,
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.camera_enhance,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            )),
                      )
                    ]),
                    Divider(color: Colors.black38,),
                    Row(children: <Widget>[
                      Icon(Icons.person_outline,
                          size: 25, color: Color.fromARGB(255, 27, 114, 251)),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('NAME',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14)),
                            SizedBox(
                              height: 6,
                            ),
                            Text('Bereket Tadege',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 18))
                          ])
                    ]),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.mail_outline,
                              size: 25,
                              color: Color.fromARGB(255, 27, 114, 251)),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('EMAIL',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                SizedBox(
                                  height: 6,
                                ),
                                Text('berekettadage09@gmail.com',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 18))
                              ]),
                        ]),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.phone,
                              size: 25,
                              color: Color.fromARGB(255, 27, 114, 251)),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('PHONE NUMBER',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: <Widget>[
                                    Image.asset('assets/Flag_of_Ethiopia.png', width: 25,height: 25,),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('+251915629212',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18)),
                                  ],
                                )
                              ]),
                        ]),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.lock_outline,
                              size: 25,
                              color: Color.fromARGB(255, 27, 114, 251)),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('PASSWORD',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                SizedBox(
                                  height: 6,
                                ),
                                Text('*********',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 18))
                              ]),
                        ])
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UpdateProfiel()));
                },
                color: Color.fromARGB(255, 218, 223, 230),
                child: Container(
                  height: 60,
                  child: Center(
                    child: Text(
                      'Update Profile',
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
