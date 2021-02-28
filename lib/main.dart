import 'package:flutter/material.dart';
import 'package:psu/screens/Account.dart';
import 'package:psu/screens/Confirmation.dart';
import 'package:psu/screens/History.dart';
import 'package:psu/screens/NewHome.dart';
import 'package:psu/screens/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  final List<Widget> children = [
    NewHome(),
    Confirmation(),
    History(),
    Account()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: children[_selectedIndex],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40)
            ),
          child:  Padding(
            padding: const EdgeInsets.only(left: 10.0, right:10.0, top:10.0),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.dashboard,
                      ),
                    ],
                  ),
                  title: (_selectedIndex == 0) ? Text("") : Text(""),
                ),
                BottomNavigationBarItem(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.notifications,
                        ),
                      ],
                    ),
                    title: (_selectedIndex == 1) ? Text("") : Text("")),
                BottomNavigationBarItem(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.history,
                        ),
                      ],
                    ),
                    title: (_selectedIndex == 2) ? Text(" ") : Text("")),
                BottomNavigationBarItem(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                        ),
                      ],
                    ),
                    title: (_selectedIndex == 3) ? Text("") : Text(""))
              ],
              selectedItemColor: Color.fromARGB(255, 27, 114, 251),
              unselectedItemColor: Colors.black54,
              onTap: _onItemTapped,
              currentIndex: _selectedIndex,
              elevation: 0,
            ),
          ),
        ),
      ),
    );
  }
}
