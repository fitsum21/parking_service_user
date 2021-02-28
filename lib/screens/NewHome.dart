import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:psu/screens/BookingDetail.dart';
import 'package:psu/MapStyle.dart';

class NewHome extends StatefulWidget {
  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> with SingleTickerProviderStateMixin {
  Completer<GoogleMapController> _controller = Completer();
  LatLng _currentLocation = LatLng(10.3296, 37.7344);
  List<LatLng> postions = [
    LatLng(10.1100, 37.4044),
    LatLng(10.3026, 38.3344),
    LatLng(10.2800, 37.0344),
    LatLng(10.4546, 37.9044),
    LatLng(10.3656, 38.0014),
    LatLng(10.5566, 38.5000)
  ];

  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'A',
    'B',
    'C',
    'A',
    'B',
    'C'
  ];
  int selected;

  void _getIndex(index) {
    print(index);
    setState(() {
      selected = index;
    });
  }

  bool _markerClicked = false;
  TabController _tabcontroller;
  List locations = [
    'bole',
    'piassa',
    'addisu gebeya',
    '4 kilo',
    'megenagna',
    'merkato',
    'bole mikael',
    '22 mazoria'
  ];

  Set<Marker> _markers = {};
  Uint8List markerIcon;
  Uint8List dragIcon;
  bool _showSearch = false;
  Location _location = new Location();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabcontroller = new TabController(length: 3, vsync: this);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  void _mapController(GoogleMapController controller) async {
    controller.setMapStyle(Utils.mapStyles);
    _controller.complete(controller);
    markerIcon = await getBytesFromAsset('assets/search_here_icon.png', 200);
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId("dfasfasd"),
          draggable: true,
          position: LatLng(10.3296, 37.7344),
          infoWindow: InfoWindow(
            title: 'Search here',
          ),
          zIndex: 3,
          onDragEnd: _addMarkers,
          icon: BitmapDescriptor.fromBytes(markerIcon)));
    });
  }

  Future<BitmapDescriptor> createCustomMarkerBitmap(String title) async {
    TextSpan span = new TextSpan(
      style: new TextStyle(
        color: Colors.black,
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
      text: title,
    );

    TextPainter tp = new TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    PictureRecorder recorder = new PictureRecorder();
    Canvas c = new Canvas(recorder);

    tp.layout();
    tp.paint(c, new Offset(20.0, 10.0));

    /* Do your painting of the custom icon here, including drawing text, shapes, etc. */

    Picture p = recorder.endRecording();
    ByteData pngBytes =
        await (await p.toImage(tp.width.toInt() + 40, tp.height.toInt() + 20))
            .toByteData(format: ImageByteFormat.png);

    Uint8List data = Uint8List.view(pngBytes.buffer);

    return BitmapDescriptor.fromBytes(data);
  }

  _addMarkers(LatLng point) async {
    dragIcon = await getBytesFromAsset('assets/logo3.png', 100);
    for (var i = 0; i < 6; i++) {
      setState(() {
        _markers.add(Marker(
            markerId: MarkerId(postions[i].toString()),
            draggable: true,
            position: postions[i],
            infoWindow: InfoWindow(
              title: 'Search here',
            ),
            zIndex: 3,
            onDragEnd: _addMarkers,
            onTap: () {
              setState(() {
                _markerClicked = true;
              });
            },
            icon: BitmapDescriptor.fromBytes(dragIcon)));
      });
    }
  }
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          GoogleMap(
              onTap: (LatLng) async{
                setState(() {
                  _markerClicked = false;
                  _showSearch = false;
                });
                
              },
              myLocationButtonEnabled: true,
              onMapCreated: _mapController,
              markers: _markers,
              initialCameraPosition:
                  CameraPosition(target: _currentLocation, zoom: 8)),
          if (_markerClicked)
            Positioned(
              bottom: 40,
              left: 30,
              right: 30,
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
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
                                            color: Color.fromARGB(
                                                255, 177, 186, 201))),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('\$3',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                Text('per hour',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(
                                            255, 177, 186, 201))),
                              ],
                            ),
                          ],
                        ),
                        Row(children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 27, 114, 251),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.directions_walk,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '800m away',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 177, 186, 201),
                                    fontSize: 20),
                              )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 27, 114, 251),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(Icons.local_parking,
                                        color: Colors.white, size: 20),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '17 spots',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 39, 176, 100),
                                    fontSize: 18),
                              )
                            ],
                          ),
                        ]),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.camera_enhance,
                                  color: Color.fromARGB(255, 39, 176, 100),
                                ),
                                Icon(
                                  Icons.child_care,
                                  color: Color.fromARGB(255, 39, 176, 100),
                                ),
                                Icon(
                                  Icons.track_changes,
                                  color: Color.fromARGB(255, 39, 176, 100),
                                ),
                                Icon(
                                  Icons.graphic_eq,
                                  color: Color.fromARGB(255, 39, 176, 100),
                                )
                              ]),
                        ),
                        FlatButton(
                          onPressed: () {
                            _buildShowModalBottomSheet();
                          },
                          color: Color.fromARGB(255, 27, 114, 251),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child: Center(
                              child: Text(
                                'Book Now',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        )
                      ]),
                ),
              ),
            ),
          Positioned(
            top: MediaQuery.of(context).size.height / 20,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                    autofocus: false,
                    onTap: () {
                      setState(() {
                        _showSearch = true;
                      });
                    },
                    onEditingComplete: () {
                      setState(() {
                        _showSearch = false;
                      });
                    },
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Search Location",
                      hintStyle: TextStyle(fontSize: 18),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.0),
                          borderRadius: BorderRadius.circular(15)),
                      suffixIcon: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 27, 114, 251),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  child: FlatButton(
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                      child: Icon(Icons.menu)),
                )
              ],
            ),
          ),
          if (_showSearch)
            Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 2,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
              child: ListView.builder(
                  itemCount: locations.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical:4.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: Color.fromARGB(255, 27, 114, 251),
                            child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        )),
                        title: Text(locations[position]),
                      ),
                    );
                  }),
            ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Abhishek Mishra"),
              accountEmail: Text("abhishekm977@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _buildShowModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        builder: (builder) {
          return Container(
            height: MediaQuery.of(context).size.height / 1.2,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 11,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Column(
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
                                          color: Color.fromARGB(
                                              255, 177, 186, 201))),
                                ],
                              ),
                            ],
                          ),
                          Container(
                              height: 80,
                              width: 80,
                              child: Image.asset('assets/parked_car2.jpeg'))
                        ],
                      ),
                    ),
                    Row(children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 27, 114, 251),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.directions_walk,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '800m away',
                            style: TextStyle(
                                color: Color.fromARGB(255, 177, 186, 201),
                                fontSize: 20),
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 27, 114, 251),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(Icons.local_parking,
                                    color: Colors.white, size: 20),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '17 spots',
                            style: TextStyle(
                                color: Color.fromARGB(255, 39, 176, 100),
                                fontSize: 18),
                          )
                        ],
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.camera_enhance,
                                color: Color.fromARGB(255, 39, 176, 100),
                              ),
                              Icon(
                                Icons.directions_run,
                                color: Colors.redAccent,
                              ),
                              Icon(
                                Icons.directions_transit,
                                color: Colors.purpleAccent,
                              ),
                              Icon(
                                Icons.graphic_eq,
                                color: Colors.amberAccent,
                              )
                            ]),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {},
                              color: Color.fromARGB(255, 234, 242, 253),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Container(
                                height: 50,
                                child: Row(children: <Widget>[
                                  Icon(
                                    Icons.call,
                                    color: Color.fromARGB(255, 27, 114, 251),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Call',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 27, 114, 251),
                                      ))
                                ]),
                              )),
                          FlatButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              color: Color.fromARGB(255, 234, 242, 253),
                              child: Container(
                                height: 50,
                                child: Row(children: <Widget>[
                                  Icon(
                                    Icons.directions,
                                    color: Color.fromARGB(255, 27, 114, 251),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Direction',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 27, 114, 251),
                                      ))
                                ]),
                              )),
                          FlatButton(
                              onPressed: () {},
                              color: Color.fromARGB(255, 27, 114, 251),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Container(
                                height: 50,
                                child: Row(children: <Widget>[
                                  Icon(Icons.share, color: Colors.white),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Share',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))
                                ]),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: <Widget>[
                          TabBar(
                            controller: _tabcontroller,
                            labelColor: Color.fromARGB(255, 27, 114, 251),
                            unselectedLabelColor:
                                Color.fromARGB(255, 1, 20, 54),
                            // indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Color.fromARGB(255, 27, 114, 251),
                            indicatorWeight: 1.0,
                            indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(
                                    width: 2.0,
                                    color: Color.fromARGB(255, 27, 114, 251)),
                                insets: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 9)),
                            tabs: [
                              Tab(
                                child: Text(
                                  "Information",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text("Reviews",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                              ),
                              Tab(
                                child: Text("Entrance",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                              ),
                            ],
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              heightFactor: 13,
                              child: Divider(
                                height: 3,
                                color: Color.fromARGB(255, 1, 20, 54),
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabcontroller,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                        text:
                                            '24/7 parking facility with cctv camera, professional security guard,chair for disable. You will get hassle parking facilities with 35% cashback on first parking...',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 177, 186, 201),
                                            fontSize: 17),
                                        children: [
                                          TextSpan(
                                              text: " Read More",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 27, 114, 251),
                                                  fontSize: 16))
                                        ]),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset('assets/parked_car1.jpeg'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Parking Time',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 10,
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                SizedBox(
                                                  width: 10,
                                                ),
                                        itemBuilder:
                                            (BuildContext contex, int index) {
                                          return Container(
                                            height: 60,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Colors.black54)),
                                            child: Column(children: <Widget>[
                                              Text('1 hour'),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Text('\$5')
                                            ]),
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ),
                          ListView.separated(
                            itemCount: entries.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(width: 20),
                                            Row(
                                              children: <Widget>[
                                                CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      'assets/friend2.jpg'),
                                                  radius: 20.0,
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 20),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Text("Kamila ",
                                                          style: TextStyle(
                                                              fontSize: 18)),
                                                      SizedBox(width: 10),
                                                      Text('Nov 4th 2019',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w200)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                        size: 16,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                        size: 16,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                        size: 16,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.black12,
                                                        size: 16,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.black12,
                                                        size: 16,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Text(
                                              'The parking space is crouded and a little narrow...'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                          ),
                          Center(child: Text('information'))
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 10,
                      child: Column(
                        children: <Widget>[
                          Divider(
                            color: Colors.black,
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BookingDetail()));
                            },
                            color: Color.fromARGB(255, 27, 114, 251),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              child: Center(
                                child: Text(
                                  'Pick Parking Slot',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          );
        },
        elevation: 2);
  }
}
