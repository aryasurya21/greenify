import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenify/pages/home/event/EventListView.dart';
import 'package:greenify/pages/home/leaderboard/leaderboardView.dart';
import 'package:greenify/pages/home/main.dart';
import 'package:greenify/pages/home/profile/edit.dart';
import 'package:greenify/pages/home/qrcode/QRScanner.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  int _currentIndex = 0;

  final tabs = [
    MainPage(),
    EventList(),
    QRScanner(),
    Leaderboard(),
    EditProfilePage()
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text("Events"),
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.qrcode),
              title: Text("Scan"),
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text("Leaderboard"),
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings"),
              backgroundColor: Colors.green),
        ],
        onTap: (index) => {
          setState(() {
            _currentIndex = index;
          })
        },
      ),
    );
  }

  void _renderBody() {}
}
