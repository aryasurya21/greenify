import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: new Image.asset(
                'assets/graphics/spinning_globe.gif',
                width: 150.0,
                height: 150.0,
              )
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20.0),
              child: new Image.asset(
                'assets/graphics/greenify_logo.png',
                height: 50.0,
              )
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20.0),
              child: Text(
                'Touch To Start',
                textAlign: TextAlign.center,
                style: GoogleFonts.pressStart2p(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}