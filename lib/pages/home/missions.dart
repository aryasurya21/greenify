import 'package:flutter/material.dart';
import 'package:greenify/pages/home/redeem_list.dart';

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
        color: Color.fromRGBO(63, 63, 63, 1),
      ),
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
          children: <Widget>[_missionHeader(), ..._missionItems()],
        ));
  }

  Widget _missionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Missions",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              textScaleFactor: 1.7,
            ),
            Text("Are you ready to make the world greener?",
                style: TextStyle(color: Colors.white)),
          ],
        ),
        FlatButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => RedeemList()));
          },
          child: Text(
            "MORE",
            style: TextStyle(color: Colors.white),
            textScaleFactor: 1.4,
          ),
        )
      ],
    );
  }

  List<Widget> _missionItems() {
    List<Widget> items = List<Widget>();
    var itemData = [
      {
        "title": "Anti Plastic Plastic Club",
        "prize": "10000 GP",
        "description": "Purchase any product from Alfamart without plastic bags"
      },
      {
        "title": "Pacifist",
        "prize": "10000 GP",
        "description": "Participate in eco-friendly event 3 times"
      },
      {
        "title": "No Country for Plastic Straws",
        "prize": "50000 GP",
        "description": "Buy coffee/tea in Starbucks using your own tumbler"
      },
    ];

    for (var i = 0; i < itemData.length; i++) {
      items.add(_missionItem(itemData[i]["title"], itemData[i]["prize"],
          itemData[i]["description"]));
    }

    return items;
  }

  Widget _missionItem(String title, String prize, String description) {
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
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    textScaleFactor: 1.3,
                  ),
                  Text(
                    prize,
                    textScaleFactor: 0.9,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    description,
                    textScaleFactor: 0.9,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
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
            data: IconThemeData(color: Colors.white),
            child: Icon(Icons.favorite)),
      );
    }

    return progressHearts;
  }
}
