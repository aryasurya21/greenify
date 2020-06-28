import 'package:cloud_firestore/cloud_firestore.dart';
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
            child: new StreamBuilder(
              stream: Firestore.instance.collection('users').snapshots(),
              builder: (context, snapshot){
                if(!snapshot.hasData) return new Center(child: new CircularProgressIndicator());
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) => LeaderboardDetailCard(snapshot.data.documents[index], index),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
