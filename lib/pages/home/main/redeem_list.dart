import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
        "title": "COVID-19 WHO Fund",
        "prize": "10000 GP",
        "description":
            "Give to support the World Health Organization's efforts to prevent, detect, and respond to the coronavirus pandemic, in countries that need it most."
      },
      {
        "title": "A Hope For A Child Fund",
        "prize": "10000 GP",
        "description":
            "HELP children living in poverty to have the capacity to improve their lives and the opportunity to bring lasting change to their communities. PROMOTE societies that value, protect and advance the well-being and rights of children. ENRICH supporters’ lives through their support of our cause."
      },
      {
        "title": "Starbucks Metal Straw",
        "prize": "5000 GP",
        "description":
            "Made of food grade material, a 304 stainless steel straw is a safe and affordable option to drink out of. "
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
                        fontWeight: FontWeight.bold, color: Colors.green),
                    textScaleFactor: 1.7,
                  ),
                  SizedBox(height: 3),
                  Text(
                    prize,
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.maxFinite, // set width to maxFinite
                    child: OutlineButton(
                      onPressed: () {
                        _onRedeem();
                      },
                      borderSide: BorderSide(color: Colors.white),
                      child: Text(
                        "CLAIM",
                        style: TextStyle(color: Colors.white),
                        textScaleFactor: 1.3,
                      ),
                    ),
                  )
                  // Padding(
                  //     padding: EdgeInsets.only(left: 20, right: 20),
                  //     child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: _progress(2, 5)))
                ],
              )),
            ],
          )),
    );
  }

  void _onRedeem() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Claimed!",
      desc:
          "Check your email for further instructions! Thank you for making our world better.",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
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
