import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GridDashboard extends StatefulWidget {


  @override
GridState  createStateHomeState() => new GridState();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class GridState extends State<GridDashboard> {
  @override
  Widget build(BuildContext context) {
   return Scaffold( 
body: GridView( 
  children: [ 

  ],
  gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent( 
    maxCrossAxisExtent: 200,
     childAspectRatio: 3/2,
     crossAxisSpacing: 20,
     mainAxisSpacing: 20
     ) ),
   );
  }
}

