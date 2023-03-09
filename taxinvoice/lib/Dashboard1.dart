import 'package:flutter/material.dart';

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
        body: Stack(children: <Widget>[
      Container(
        height: size.height * .3,
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
                            letterSpacing: 1.5),
                      ),
                      Text('9880438931',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.5)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox( 
                height: 50
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                children: <Widget> [ 
                  InkWell(
    child: Card(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
        Image.asset('assets/icon1.jpeg'),
        
        Text('Quotation')
  ])),
    onTap: () { 
        print("Click event on Container"); 
    },
),
// Card(  
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//         Image.asset('assets/icon1.jpeg'),
        
//         Text('Quotation')
//   ]),
// ),
Card(  
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
        Image.asset('assets/invoice.jpg'),
        Text('Invoice')
  ]),
)
                ],
                ) )
          ],
        ),
      )
    ]));
  }
}
