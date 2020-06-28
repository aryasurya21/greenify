import 'package:flutter/material.dart';
import 'package:greenify/pages/home/main/missions.dart';
import 'package:greenify/pages/home/main/nearby.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[Expanded(child: _renderBody())],
      ),
    );
  }

  Widget _renderBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height + 180,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height + 180,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 35, bottom: 10),
                      child: Container(
                        height: 50,
                        child: new Image.asset('assets/graphics/greenify_logo.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: _profileInformation(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Missions(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Nearby(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _balanceInformation() {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: <Widget>[
                  Text("122000 GP",
                      textScaleFactor: 1.3,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              )),
          Row(
            children: <Widget>[_redeemButton(), _historyButton()],
          )
        ],
      ),
    ));
  }

  Widget _profileInformation() {
    return Container(
      // color: Colors.black26,
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
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 15),
                  child: _circularImage())),
          _balanceInformation(),
        ],
      ),
    );
  }

  Widget _middleMenuBar() {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_redeemButton(), _historyButton()],
      ),
    );
  }

  Widget _redeemButton() {
    return FlatButton(
      child: Column(
        children: <Widget>[
          IconTheme(
              data: IconThemeData(color: Colors.white, size: 25),
              child: Icon(Icons.redeem)),
          Text(
            "Redeem",
            style: TextStyle(color: Colors.white),
            textScaleFactor: 1,
          )
        ],
      ),
    );
  }

  Widget _historyButton() {
    return FlatButton(
      child: Column(
        children: <Widget>[
          IconTheme(
              data: IconThemeData(color: Colors.white, size: 25),
              child: Icon(Icons.history)),
          Text(
            "History",
            style: TextStyle(color: Colors.white),
            textScaleFactor: 1,
          )
        ],
      ),
    );
  }

  Widget _circularImage() {
    return new Center(
        child: new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 10),
                child: new Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://i.imgur.com/BoN9kdC.png"))))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Anton Chigurh",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                new Text(
                  "@anton_chigurh",
                  textScaleFactor: 1,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        IconTheme(
            data: IconThemeData(color: Colors.white, size: 30),
            child: Icon(Icons.settings_overscan)),
      ],
    ));
  }
}
