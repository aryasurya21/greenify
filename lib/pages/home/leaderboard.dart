import 'package:flutter/material.dart';
import 'package:greenify/pages/home/leaderboard/detail.dart';

class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 30, bottom: 5),
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
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 8,
              itemBuilder: (ctx, i) => LeaderboardDetailCard(i),
            ),
          ),
        ],
      ),
    );
  }
}
