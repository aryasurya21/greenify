import 'package:flutter/material.dart';
import 'package:greenify/model/event.dart';
import 'event/card.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event List"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height - 90,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                    itemCount: eventList.length,
                    itemBuilder: (ctx, i) => EventDetailCard(i)),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
