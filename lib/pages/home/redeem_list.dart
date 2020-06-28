import 'package:flutter/material.dart';

class RedeemList extends StatefulWidget {
  RedeemList({Key key}) : super(key: key);

  @override
  _RedeemListState createState() => _RedeemListState();
}

class _RedeemListState extends State<RedeemList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Redeem"),
        ),
        body: Container(color: Colors.black, child: _listView()));
  }

  Container _listView() {
    return Container(
        child: ListView(
      padding: EdgeInsets.all(10),
      children: _missionItems(),
    ));
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
      items.add(SizedBox(
        height: 20,
      ));
    }

    return items;
  }

  Widget _missionItem(String title, String prize, String description) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          color: Color.fromRGBO(63, 63, 63, 1)),
      width: MediaQuery.of(context).size.width - 10,
      // color: Color.fromRGBO(63, 63, 63, 1),
      child: Padding(
          padding: EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 10),
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
                    textScaleFactor: 1.7,
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
