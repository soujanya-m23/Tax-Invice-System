import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}): super(key:key);
  
  @override
  Widget build(BuildContext context) => Scaffold(
     appBar: AppBar( 
      title: const Text("Home"),
      backgroundColor: Colors.blue,
     ),
  drawer: const NavigationDrawer(),
  );
  }
  class NavigationDrawer extends StatelessWidget {
    const NavigationDrawer({Key? key}):super(key:key);

  
@override
  Widget build(BuildContext context) {
    return Drawer(
  child: SingleChildScrollView(
  child:Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      buildHeader(context),
      buildMenuitems(context),
  
    ],) ),
  );
  }
  
  Widget buildMenuitems(BuildContext context) => Column(
    children: [
Padding(
  padding: const EdgeInsets.only(top: 50),
  child:   ListTile(
  
    leading: const Icon(Icons.home_max_outlined),
  
    title: const Text('Home'),
  
    onTap: (){},
  
  ),
),
    ],
  ); 
  }
    
Widget buildHeader(BuildContext context) => Container();  
