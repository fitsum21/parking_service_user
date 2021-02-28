import 'package:flutter/material.dart';
import 'package:psu/screens/AddPayment.dart';
import 'package:psu/widgets/custom_textField.dart';

class AddVehicle extends StatefulWidget {
  @override
  _AddVehicleState createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  List _cities = [
    "Cluj-Napoca",
    "Bucuresti",
    "Timisoara",
    "Brasov",
    "Constanta"
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

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
        extendBodyBehindAppBar: true,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/add_vehicle.png',
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.width / 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Vehicle details!',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 36, 54, 87),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Add your vehicle details below',
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
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              hintText: "Type",
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 0, 10, 20),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 0),
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
                                    Icons.directions_car,
                                    color: Color.fromARGB(255, 27, 114, 251),
                                  )),
                            ),
                            value: _currentCity,
                            items: _dropDownMenuItems,
                            onChanged: changedDropDownItem),

                        SizedBox(
                          height: 20,
                        ),
                        // TextFormField(
                        //   autofocus: false,
                        //   decoration: InputDecoration(
                        //     hintText: "License Plate No",
                        //    hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                        //     fillColor: Colors.white,
                        //     filled: true,
                        //     enabledBorder: OutlineInputBorder(
                        //         borderSide:
                        //             BorderSide(color: Colors.white, width: 0),
                        //         borderRadius: BorderRadius.circular(8)),
                        //     focusedBorder: OutlineInputBorder(
                        //         borderSide:
                        //             BorderSide(color: Colors.white, width: 0.0),
                        //         borderRadius: BorderRadius.circular(8)),
                        //     prefixIcon: Padding(
                        //         padding: const EdgeInsets.only(
                        //           left: 20.0,
                        //           right: 10,
                        //         ),
                        //         child: Icon(
                        //           Icons.dashboard,
                        //           color: Color.fromARGB(255, 27, 114, 251),
                        //         )),
                        //     suffixIcon: Padding(
                        //         padding: const EdgeInsets.only(
                        //           left: 0.0,
                        //           right: 10,
                        //         ),
                        //         child: Container(
                        //             width: 40,
                        //             decoration: BoxDecoration(
                        //                 color: Color.fromARGB(255, 235, 242, 253),
                        //                 borderRadius: BorderRadius.circular(10)),
                        //             child: Icon(
                        //               Icons.camera_enhance,
                        //               color: Color.fromARGB(255, 27, 114, 251),
                        //             ))),
                        //   ),
                        // ),
                        CustomTextField(
                          hintText: 'AA 12834',
                          label: 'LICENSE PLATE NO',
                          icon: Icon(Icons.dashboard,
                              color: Color.fromARGB(255, 27, 114, 251),
                              size: 26),
                          suffix: Padding(
                              padding: const EdgeInsets.only(
                                left: 0.0,
                                right: 10,
                              ),
                              child: Container(
                                  height:60 ,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 235, 242, 253),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                    Icons.camera_enhance,
                                    color: Color.fromARGB(255, 27, 114, 251),
                                  ))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hintText: 'Mercedez Benz Z3',
                          label: 'CAR MODEL',
                          icon: Icon(Icons.settings,
                              color: Color.fromARGB(255, 27, 114, 251),
                              size: 26),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPayment()));
                          },
                          color: Color.fromARGB(255, 27, 114, 251),
                          child: Container(
                            height: 60,
                            child: Center(
                              child: Text(
                                'Add Vehicle',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        )
                      ]),
                ),
              ),
            ]),
          ),
        ));
  }
}
