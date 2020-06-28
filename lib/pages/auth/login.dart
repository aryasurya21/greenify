import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:greenify/pages/auth/register.dart';
import 'package:greenify/pages/home/main_page.dart';
import 'package:greenify/util/session_util.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  height: 50,
                  margin: const EdgeInsets.only(
                    bottom: 25.0,
                  ),
                  child: new Image.asset('assets/graphics/greenify_logo.png'),
                ),
                Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                new Container(
                  margin: const EdgeInsets.all(
                    10.0,
                  ),
                  child: new SizedBox(
                    width: 275.0,
                    child: TextFormField(
                      cursorColor: Colors.white,
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Please type an email';
                        }
                      },
                      onSaved: (input) => _email = input,
                      decoration: InputDecoration(
                        labelText: 'Email',
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
                      cursorColor: Colors.white,
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Please provide a password';
                        } else if (input.length < 6) {
                          return 'Your password needs to be atleast 6 characters';
                        }
                      },
                      onSaved: (input) => _password = input,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                              style: BorderStyle.none),
                        ),
                      ),
                      obscureText: true,
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
                      onPressed: signIn,
                      padding: EdgeInsets.all(10.0),
                      color: Colors.white,
                      child: Text(
                        'Play',
                        style: new TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                new InkWell(
                  child: Text(
                    'Don\'t have an account? Register here',
                    style: new TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => RegisterPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;

    if (formState.validate()) {
      formState.save();
      try {
        AuthResult authResult = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user = authResult.user;
        if (user.isEmailVerified) {
          saveUserLogin(user);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MainPage(
                        title: "Home",
                      )));
        } else {
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
                      Text(
                          'Email is not verified.\nPlease verify your email before login!'),
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
      } catch (signInError) {
        if (signInError is PlatformException) {
          if (signInError.code == 'ERROR_WRONG_PASSWORD') {
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
                        Text('Wrong password!'),
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
      }
    }
  }
}
