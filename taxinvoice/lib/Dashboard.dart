import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';



class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.deepPurple
        
        
      ),
      backgroundColor: Color.fromARGB(255, 180, 151, 219),
      body: 
      Column(children: <Widget>[
        SizedBox(
          height: 110,
        ),
        Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        
                        SizedBox(height: 4),
                        
                      ]),
                      
                ]))
      ]),
    );
  }
}
