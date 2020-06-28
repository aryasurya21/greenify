import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenify/pages/home.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QRScanner extends StatefulWidget {
  @override
  _QRScannerState createState() => new _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  String barcode = "";

  void _goHome() {
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
        context, _homeRoute, (Route<dynamic> r) => false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scan'),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 200,
                  child: RaisedButton(
                    color: Colors.black,
                    child: Text(
                      'Tap Me to Scan',
                      style: GoogleFonts.pressStart2p(color: Colors.white),
                    ),
                    onPressed: () async {
                      try {
                        dynamic barcode = await BarcodeScanner.scan();
                        if (barcode != null) {
                          setState(() {
                            this.barcode = barcode;
                          });
                          Alert(
                            context: context,
                            type: AlertType.success,
                            title: "Succesful",
                            desc: "Succesful redeemed 35 GPs",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => _goHome(),
                                width: 120,
                              )
                            ],
                          ).show();
                        }
                      } on PlatformException catch (error) {
                        if (error.code == BarcodeScanner.CameraAccessDenied) {
                          setState(() {
                            this.barcode = 'Camera access not allowed';
                          });
                        } else {
                          setState(() {
                            this.barcode = 'Error: $error';
                          });
                        }
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Error",
                          desc: "$barcode",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "OK",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final PageRouteBuilder _homeRoute = new PageRouteBuilder(
  pageBuilder: (BuildContext context, _, __) {
    return HomePage();
  },
);
