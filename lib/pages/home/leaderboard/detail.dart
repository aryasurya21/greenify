import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeaderboardDetailCard extends StatelessWidget {
  final int idx;
  LeaderboardDetailCard(this.idx);

  @override
  Widget build(BuildContext context) {
    int pos = this.idx + 1;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5, bottom: 5),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Color.fromRGBO(63, 63, 63, 1),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5.0)]),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 25),
                          child: crown(pos),
                        ),
                      ),
                      Align(
                        child: CircleAvatar(
                          backgroundColor: Colors.red.shade800,
                          child: Text('AS'),
                          radius: 30,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Arya",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "arya@gmail.com",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 5, right: 10),
                  child: Text(
                    (50450 - idx * 2450).toString() + " GP",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
  
  Widget crown(int pos){
  if (pos == 1) {
      return Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                  child: Icon(
                FontAwesomeIcons.crown,
                size: 36,
                color: Colors.yellow,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 6),
                child: Center(
                    child: Text(
                  '1',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )),
              )
            ],
          ));
    } 
    else if (pos == 2) {
      return Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                  child: Icon(
                FontAwesomeIcons.crown,
                size: 36,
                color: Colors.grey[300],
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 6),
                child: Center(
                    child: Text(
                  '2',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )),
              )
            ],
          ));
    } 
    else if (pos == 3) {
      return Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                  child: Icon(
                FontAwesomeIcons.crown,
                size: 36,
                color: Colors.orange[300],
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 6),
                child: Center(
                    child: Text(
                  '3',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )),
              )
            ],
          ));
    } 
    else {
      return Container(
        margin: const EdgeInsets.only(left: 2),
        child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 17,
            child: Text(
              pos.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )),
      );
    }
  }
    
}
