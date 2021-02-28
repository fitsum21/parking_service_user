import 'package:flutter/material.dart';
import 'package:psu/main.dart';

class AddPayment extends StatefulWidget {
  @override
  _AddPaymentState createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  List _cities = [
    "Cluj-Napoca",
    "Bucuresti",
    "Timisoara",
    "Brasov",
    "Constanta"
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;
  bool _showProgressIndicator = false;

  @override
  void initState() {
    // TODO: implement initState
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = null;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add a Vehicle',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          backgroundColor: Color.fromARGB(255, 246, 247, 251),
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
          color: Color.fromARGB(255, 246, 247, 251),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'assets/payment_image.png',
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height / 7,
                        width: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Add Credit Card',
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 36, 54, 87),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Please add your credit card information',
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
                                    hintText: "CARD HOLDER NAME",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 0),
                                        borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 0.0),
                                        borderRadius: BorderRadius.circular(8)),
                                    prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 10,
                                        ),
                                        child: Icon(
                                          Icons.person_outline,
                                          color:
                                              Color.fromARGB(255, 27, 114, 251),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    hintText: "CARD NUMBER",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 0),
                                        borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 0.0),
                                        borderRadius: BorderRadius.circular(8)),
                                    prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 10,
                                        ),
                                        child: Icon(
                                          Icons.dashboard,
                                          color:
                                              Color.fromARGB(255, 27, 114, 251),
                                        )),
                                    suffixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 0.0,
                                          right: 10,
                                        ),
                                        child: Container(
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 242, 253),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Icon(
                                              Icons.camera_enhance,
                                              color: Color.fromARGB(
                                                  255, 27, 114, 251),
                                            ))),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: TextFormField(
                                        autofocus: false,
                                        decoration: InputDecoration(
                                          hintText: "EXPIRY DATE",
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 0),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 0.0),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TextFormField(
                                        autofocus: false,
                                        decoration: InputDecoration(
                                          hintText: "CVV",
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 0),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 0.0),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      _showProgressIndicator = true;
                                    });

                                    Future.delayed(Duration(seconds: 4))
                                        .then((value) {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  MyHomePage()));
                                      setState(() {
                                        _showProgressIndicator = false;
                                      });
                                    });
                                  },

                                  color: Color.fromARGB(255, 38, 203, 151),
                                  child: Container(
                                    height: 60,
                                    child: Center(
                                      child: _showProgressIndicator ? 
                                      CircularProgressIndicator(backgroundColor: Colors.white)
                                      : Text(
                                        'Save Card Details',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                
                              ]),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 45, 59, 84),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: FlatButton(
                        onPressed: () {},
                        color: Color.fromARGB(255, 27, 114, 251),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.link,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Link Wallet',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
