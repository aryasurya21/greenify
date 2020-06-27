import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> saveUserLogin(FirebaseUser user) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("user", user.uid);
}

Future<String> getUserLogin() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("user");
}

Future<bool> removeUserLogin() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("user", "");
}

Future<DocumentSnapshot> getUserByAuthUID(String auth_uid) async{
  Query user = Firestore.instance.collection('users').where("auth_uid", isEqualTo: auth_uid);
  QuerySnapshot data = await user.getDocuments();
  return data.documents[0];
}

Future<DocumentSnapshot> getUserByUsername(String username) async{
  Query user = Firestore.instance.collection('users').where("username", isEqualTo: username);
  QuerySnapshot data = await user.getDocuments();
  return data.documents[0];
}