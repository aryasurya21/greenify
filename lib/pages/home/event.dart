import 'package:flutter/material.dart';
import 'package:greenify/model/event.dart';
import 'event/card.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 35, bottom: 5),
                child: Container(
                  height: 65,
                  child: new Image.asset(
                      'assets/graphics/events.png'),
                ),
              ),
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
