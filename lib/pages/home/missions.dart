import 'package:flutter/material.dart';

class Missions extends StatefulWidget {
  Missions({Key key}) : super(key: key);

  @override
  _MissionsState createState() => _MissionsState();
}

class _MissionsState extends State<Missions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // ch
            ),
          ]),
      width: MediaQuery.of(context).size.width - 20,
      child: Column(
        children: <Widget>[_missionTitle()],
      ),
    );
  }

  Widget _missionTitle() {
    return Padding(
        padding: EdgeInsets.only(left: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Missions",
              style: TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 1.3,
            ),
            Text("Are you ready to make the world greener?"),
            _missionItemWithClaim(),
            _missionItem2(),
            _missionItem3(),
          ],
        ));
  }

  Widget _missionList() {
    return Container(
        height: 190,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _missionItem(),
            _missionItem2(),
            _missionItem3(),
          ],
        ));
  }

  Widget _missionItemWithClaim() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: _missionItem(),
        ),
      ],
    );
  }

  Widget _missionItem3() {
    return Container(
      child: Padding(
          padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Pacifist",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.15,
                  ),
                  Text(
                    "2000 GP",
                    textScaleFactor: 0.9,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Participate in Eco-friendly event around you 3 times",
                    textScaleFactor: 0.9,
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _progress(2, 3)))
                ],
              )
            ],
          )),
    );
  }

  Widget _missionItem2() {
    return Container(
      child: Padding(
          padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "One Person, One Cup",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.15,
                  ),
                  Text(
                    "7000 GP",
                    textScaleFactor: 0.9,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Take away at Starbucks using your own tumbler",
                    textScaleFactor: 0.9,
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _progress(2, 5)))
                ],
              )
            ],
          )),
    );
  }

  Widget _missionItem() {
    return Container(
      child: Padding(
          padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Anti Plastic Plastic Club",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.15,
                  ),
                  Text(
                    "5000 GP",
                    textScaleFactor: 0.9,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Purchase any product from Alfamart without plastic bags (min. Rp.20000)",
                    textScaleFactor: 0.9,
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _progress(2, 5)))
                ],
              )),
            ],
          )),
    );
  }

  List<Widget> _progress(int completed, int limit) {
    List<Widget> progressHearts = List<Widget>();
    for (var i = 0; i < completed; i++) {
      progressHearts.add(
        IconTheme(
            data: IconThemeData(color: Colors.red),
            child: Icon(Icons.favorite)),
      );
    }

    var remaining = limit - completed;
    for (var i = 0; i < remaining; i++) {
      progressHearts.add(
        IconTheme(
            data: IconThemeData(color: Colors.black),
            child: Icon(Icons.favorite)),
      );
    }

    return progressHearts;
  }
}
