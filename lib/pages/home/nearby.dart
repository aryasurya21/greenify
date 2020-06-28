import 'package:flutter/material.dart';

class Nearby extends StatefulWidget {
  Nearby({Key key}) : super(key: key);

  @override
  _NearbyState createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[_missionTitle(), _missionList()],
      ),
    );
  }

  Widget _missionList() {
    return Container(
        height: 190,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _missionItem(),
            _missionItem(),
            _missionItem(),
            _missionItem(),
          ],
        ));
  }

  Widget _missionItem() {
    return Container(
      width: 190,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://i.imgur.com/BoN9kdC.png"))),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          "Indomaret",
                        ),
                      ))
                ],
              ),
            )),
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
              "Nearby",
              style: TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 1.3,
            ),
            Text("Merchant near you")
          ],
        ));
  }
}
