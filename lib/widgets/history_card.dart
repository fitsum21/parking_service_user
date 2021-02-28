import 'package:flutter/material.dart';
import 'package:psu/screens/BookingDetail.dart';

class History_card extends StatelessWidget {

  final String status;
  final String price;
  final String title;
  final String address;
  
  const History_card({
    Key key,
    @required this.status, this.price, this.title, this.address,
  }) :  super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => BookingDetail()));
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: status == 'PARKING ONGOING' ? Color.fromARGB(255, 251, 239, 236): Color.fromARGB(255, 228, 245, 239),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 18),
                        child: Text(
                          status,
                          style: TextStyle(
                              color:  status == 'PARKING ONGOING' ? Color.fromARGB(255, 242, 169, 109): Color.fromARGB(255, 39, 176, 100),
                              fontSize: 12),
                        ),
                      ),
                    ),
                    Text('\$' + price,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30))
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,
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
                          Text(address,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(
                                      255, 177, 186, 201))),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
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
              ]),
        ),
      ),
    );
  }
}