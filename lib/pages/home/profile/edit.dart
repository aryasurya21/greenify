import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:greenify/pages/home/main.dart';
import 'package:greenify/util/session_util.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfilePage>{
  String _userID = "";
  String _username, _fullname, _phone;

  var _usernameController = TextEditingController();
  var _fullnameController = TextEditingController();
  var _phoneController = TextEditingController();
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _EditProfileState() {
    getUserLogin().then((authId) => 
      getUserByAuthUID(authId).then((val) => setState((){
        _userID = authId;
        if(val.data.containsKey('username')){
          _usernameController.text = val['username'];
          _fullnameController.text = val['fullname'];
          _phoneController.text = val['phone'];
        }
      }))
    );
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Align(
          alignment: Alignment.center,
          child: new ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.only(
                      top: 30.0,
                      bottom: 10.0,
                    ),
                    child: new Text(
                      'Profile',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.all(
                      5.0,
                    ),
                    child: new SizedBox(
                      width: 275.0,
                      child: TextFormField(
                        controller: _usernameController,
                        cursorColor: Colors.white,
                        validator: (input){
                          if(input.isEmpty){
                            return 'Please type a username';
                          }
                        },
                        onSaved: (input) => _username = input,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.all(
                      10.0,
                    ),
                    child: new SizedBox(
                      width: 275.0,
                      child: TextFormField(
                        controller: _fullnameController,
                        cursorColor: Colors.white,
                        validator: (input){
                          if(input.isEmpty){
                            return 'Please type your fullname';
                          }
                        },
                        onSaved: (input) => _fullname = input,
                        decoration: InputDecoration(
                          labelText: 'Fullname',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.all(
                      10.0,
                    ),
                    child: new SizedBox(
                      width: 275.0,
                      child: TextFormField(
                        controller: _phoneController,
                        cursorColor: Colors.white,
                        validator: (input){
                          RegExp regExp = new RegExp(
                            r"^\+?([ -]?\d+)+|\(\d+\)([ -]\d+)",
                            caseSensitive: false,
                            multiLine: false,
                          );
                          if(input.isEmpty){
                            return 'Please provide your phone number';
                          }
                          else if(input.length < 8){
                            return 'A phone number must be more than 7 characters';
                          }
                          else if(!regExp.hasMatch(input)){
                            return 'Phone number is not valid';
                          }
                        },
                        onSaved: (input) => _phone = input,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.all(
                      10.0,
                    ),
                    child: new SizedBox(
                      width: 255.0,
                      child: RaisedButton(
                        onPressed: saveUserRecord,
                        padding: EdgeInsets.all(13.0),
                        color: Colors.white,
                        child: Text(
                          'Save',
                          style: new TextStyle(
                            fontSize: 16.0, 
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveUserRecord() async{
    final formState = _formKey.currentState;
    final databaseReference = Firestore.instance;

    if(formState.validate()){
      formState.save();

      try{
        Query userData = Firestore.instance.collection('users').where("username", isEqualTo: _username);
        QuerySnapshot userDataSnapshot = await userData.getDocuments();

        // Check if no document uses the same username
        // Or if the document that uses that document is the user itself
        if(
          userDataSnapshot.documents.isEmpty ||
          (userDataSnapshot.documents.length == 1 && userDataSnapshot.documents[0].documentID == _userID)
        ){
          databaseReference.collection("users").document(_userID)
            .updateData({
              'username': _username,
              'fullname': _fullname,
              'phone': _phone,
            }
          );
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
        }
        else{
          return showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Error',
                  style: new TextStyle(
                    color: Colors.red[600],
                  ),
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Username has been used!\nPlease enter another one.'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      'Close',
                      style: new TextStyle(
                        color: Colors.red[600],
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      }
      catch(e){
        print(e);
      }
    }
  }
}