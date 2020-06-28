import 'package:flutter/material.dart';
import 'package:greenify/pages/home/event/card/detail.dart';
import 'package:greenify/model/event.dart';

class EventDetailCard extends StatelessWidget {
  final int idx;
  EventDetailCard(this.idx);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventDetailView(this.idx)));
      },
      child: Column(
        children: <Widget>[
          Card(
            color: Color.fromRGBO(63, 63, 63, 1),
            elevation: 5,
            child: Row(
              children: <Widget>[
                Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(63, 63, 63, 1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      image: DecorationImage(
                          image: NetworkImage(eventList[idx].eventPhotoURL),
                          fit: BoxFit.fill)),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        truncateTitle(eventList[idx].eventName),
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w100,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 170,
                        margin: const EdgeInsets.only(right: 20),
                        child: Text(
                          truncateDesc(eventList[idx].eventDesc),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w100,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

String truncateDesc(String myString) {
  return (myString.length <= 50) ? myString : '${myString.substring(0, 49)}...';
}

String truncateTitle(String myString) {
  return (myString.length <= 13) ? myString : '${myString.substring(0, 12)}...';
}
