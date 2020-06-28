import 'package:flutter/material.dart';
import 'package:greenify/pages/home/leaderboard/detail.dart';

class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Leaderboard"),
          backgroundColor: Colors.black87,
        ),
        body: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Period",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      Text(
                        "15 June 2020 - 15 July 2020",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    itemBuilder: (ctx, i) => LeaderboardDetailCard(i),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
