import 'package:flutter/material.dart';
import 'package:taxinvoice/login.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  // final greenOpacity = Container(
  //   color: Color.fromARGB(197, 233, 140, 249),
  // );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
    
    

        
      backgroundColor: Colors.lightBlueAccent,
        body: Stack(children: <Widget>[
          
      Container(
        height: size.height * 2,
        decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.topCenter,
                image: Image.network(
                        'https://mars-metcdn-com.global.ssl.fastly.net/content/uploads/sites/101/2019/04/30162428/Top-Header-Background.png')
                    .image)),
      ),
      SafeArea(
        //background,
        //greenOpacity,

        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 45,
                    child: Icon(
                      Icons.person_2_sharp,
                      color: Color(0xffCCCCCC),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 0.1,
                      ),
                      Text(
                        "Soujanya",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontStyle: FontStyle.normal,
                            letterSpacing: 1.5),
                      ),
                      Text('9880438931',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            fontStyle: FontStyle.normal,
                              color: Colors.white,
                              letterSpacing: 1.5)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              
                child: GridView.count(
                  
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              children: <Widget>[
                InkWell(
                  child: Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Image.asset('assets/icon1.jpeg'),
                        Text('Quotation',style: TextStyle(fontWeight: FontWeight.bold),)
                      ])),
                  onTap: () {
                    
                  },
                ),
                InkWell(
                  child: Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Image.asset('assets/invoice.jpg'),
                        Text('Invoice',style: TextStyle(fontWeight: FontWeight.bold)),
                      ])),
                  onTap: () {
                    
                  },
                ),
                InkWell(
                  child: Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Image.asset('assets/debit.png',scale: 3.2),
                        SizedBox( 
                          height: 15,
                        ),
                        Text('Debit',style: TextStyle(fontWeight: FontWeight.bold))
                      ])),
                  onTap: () {
                    
                  },
                ),
                InkWell(
                  child: Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Image.asset('assets/report.png',scale: 5.5,),
                        SizedBox( 
                          height: 22,
                        ),
                        Text('Report',style: TextStyle(fontWeight: FontWeight.bold))
                      ])),
                  onTap: () {
                   Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyLogin()));
                  },
                ),


])),
GestureDetector(
  onTap: () {},
  child: Container(
    width: 200,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.blueAccent,
    ),
    child: Center(child: Text('Home')),
  ),
),

  

              ],
            ))
          ],
        ),
      );
    
  }
}
