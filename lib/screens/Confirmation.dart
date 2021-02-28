import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:psu/main.dart';

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController()
    ..text = null;

  StreamController<ErrorAnimationType> errorController;
  String currentText = "";

  bool hasError = false;
  bool _showProgressIndicator = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   setState(() {
  //     _showProgressIndicator = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 10,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Enter your code',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('Please type the code we sent you',
                        style: TextStyle(fontSize: 17, color: Colors.black54)),
                    Text('+251 915 629 212',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 38, 203, 151)))
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 18,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 12,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: PinCodeTextField(
                      autoFocus: true,
                      length: 4,
                      obsecureText: false,
                      textInputType: TextInputType.phone,
                      textStyle: TextStyle(fontSize: 30),
                      animationType: AnimationType.fade,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width / 40),
                          fieldHeight: MediaQuery.of(context).size.height / 22,
                          fieldWidth: MediaQuery.of(context).size.width / 10,
                          activeFillColor: Colors.white,
                          inactiveColor: Colors.black87,
                          inactiveFillColor: Colors.white,
                          selectedColor: Colors.white,
                          activeColor: Colors.white,
                          selectedFillColor: Colors.white),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.white,
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      onCompleted: (v) {
                        setState(() {
                          _showProgressIndicator = true;
                        });

                        Future.delayed(Duration(seconds: 4)).then((value) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyHomePage()));
                          setState(() {
                            _showProgressIndicator = false;
                          });
                        });
                      },

                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      // beforeTextPaste: (text) {
                      //   print("Allowing to paste $text");
                      //   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //   //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      //   return true;
                      // },
                    ),
                  ),
                  if(!_showProgressIndicator)
                  Container(
                      width: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 235, 242, 253),
                          borderRadius: BorderRadius.circular(15)),
                      child: FlatButton(
                        
                          onPressed: () {
                            textEditingController.clear();
                          },
                          child: Icon(Icons.history,
                              color: Color.fromARGB(255, 27, 114, 251)))),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            if (_showProgressIndicator)
              Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
