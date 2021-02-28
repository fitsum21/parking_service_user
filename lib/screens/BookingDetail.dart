import 'package:flutter/material.dart';
import 'package:psu/screens/History.dart';
import 'package:psu/screens/Profile.dart';

class BookingDetail extends StatefulWidget {
  @override
  _BookingDetailState createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 246, 247, 251),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 59, 84),
        title: Text('Booking Details', style: TextStyle(color: Colors.white)),
        elevation: 1,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 11,
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Parking ID',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                          ),
                          Text('#235416',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))
                        ]),
                    Icon(Icons.content_copy)
                  ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text('Parking Info',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold)),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 228, 245, 239),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 18),
                        child: Text(
                          'PARKING COMPLETED',
                          style: TextStyle(
                              color: Color.fromARGB(255, 39, 176, 100),
                              fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Easkarton Shopping Mall',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 1, 20, 54))),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Color.fromARGB(255, 177, 186, 201),
                              ),
                              Text('10 Bilpar Road, Sylhet',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          Color.fromARGB(255, 177, 186, 201))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(children: <Widget>[
                      Icon(Icons.date_range, color: Colors.black54),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Thu 27 Jan',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            Text('10:00',
                                style: TextStyle(color: Colors.black54))
                          ]),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black54,
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Thu 27 Jan',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '12:00',
                              style: TextStyle(color: Colors.black54),
                            )
                          ])
                    ]),
                    Divider()
                  ]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                      Widget>[
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '2 hour parking',
                                style: TextStyle(fontSize: 17),
                              ),
                              Text('US \$7',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Tax',
                                style: TextStyle(fontSize: 17),
                              ),
                              Text('US \$0',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Service fee',
                                style: TextStyle(fontSize: 17),
                              ),
                              Text('US \$0',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Trip Total',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text('US \$7',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))
                            ],
                          )
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => History()));
                          },
                          child: Text('REPORT ISSUE',
                              style: TextStyle(color: Colors.red)),
                        )
                      ]),
                )
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:30.0, vertical: 20),
            child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              color: Color.fromARGB(255, 27, 114, 251),
              child: Container(
                height: 60,
                child: Center(
                  child: Text(
                    'Rebook Parking',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          )
        ],
      ),
    );
  }
}
