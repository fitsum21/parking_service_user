import 'package:flutter/material.dart';
import 'package:psu/screens/BookingDetail.dart';
import 'package:psu/widgets/history_card.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List _bookings = [
    {
      'status': 'PARKING ONGOING',
      'price': '9',
      'title': 'Easkarton Shopping Mall',
      'address': '10 Bilpar Road, Sylhet'
    },
    {
      'status': 'PARKING COMPLETED',
      'price': '7',
      'title': 'Hillview Hotel MC.',
      'address': 'Bole 24, Addis Ababa'
    },
    {
      'status': 'PARKING COMPLETED',
      'price': '13',
      'title': 'Century Shopping Mall',
      'address': 'Gurd Shola, Addis Ababa'
    },
    {
      'status': 'PARKING ONGOING',
      'price': '5',
      'title': 'Piassa Parking ',
      'address': 'Arada Building, Piassa ,Addis Ababa'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 247, 251),
      appBar: AppBar(
        title: Text('My Booking',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 22)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:30.0),
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return History_card(
                status:_bookings[index]['status'],
                price:_bookings[index]['price'],
                title:_bookings[index]['title'],
                address:_bookings[index]['address']
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 20,
                ),
            itemCount: _bookings.length),
      ),
      
    );
  }
}


