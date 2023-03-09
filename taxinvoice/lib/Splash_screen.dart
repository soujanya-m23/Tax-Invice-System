import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxinvoice/login.dart';
import 'package:taxinvoice/navigation.dart';
import 'Dashboard1.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final background = Container(
    
      decoration: BoxDecoration(
        
      image: DecorationImage(
      image: AssetImage(
      'assets/e-invoice.png',
    ),
    fit: BoxFit.fitWidth,
    
  ),),
  // child: BackdropFilter(
  //   filter: ImageFilter.blur(sigmaX: 1.0,sigmaY: 1.0),
    child: SizedBox(
      width: 300,
      height: 300,
      child: Center(
        
        child:  Container(
          padding: EdgeInsets.only(top: 400,bottom: 20),
          child: Text(
          'TAX INVOICE',
          style: TextStyle(fontFamily: 'Schyler',fontSize: 40,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.black45 ,backgroundColor: Colors.white70),
        
        ),
        ),
 //Open Sans font

    )
    ));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyDashboard()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      background,
    ]));

    // )),
  }
}
