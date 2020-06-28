import 'package:flutter/material.dart';
import 'package:greenify/model/event.dart';

class EventDetailView extends StatelessWidget {
  final int idx;
  EventDetailView(this.idx);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(eventList[idx].eventName),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 225,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      image: DecorationImage(
                          image: NetworkImage(eventList[idx].eventPhotoURL),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, left: 15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          eventList[idx].eventName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, bottom: 15),
                  child: Row(
                    children: <Widget>[
                      Text(
                        eventList[idx].eventDuration,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      Text(
                        " - ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        eventList[idx].eventLocation,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8, left: 15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          eventList[idx].eventDesc,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8, left: 15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: <Widget>[
                            Text(
                              eventList[idx].eventPoint.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                            Text(
                              " Points Available!",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
