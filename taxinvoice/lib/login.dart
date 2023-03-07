import 'package:flutter/material.dart';
import 'package:taxinvoice/Dashboard.dart';
import 'package:taxinvoice/signup.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(
                color: Colors.white,
                fontFamily: '.SF UI Text', 
                fontSize: 40, 
                fontWeight: FontWeight.bold),
              
              ),
            ),
            SingleChildScrollView(
              child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.42,
                  right: 35,
                  left: 35),
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                height: 40,
                ),
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ 
                      Text('Sign In',style: TextStyle( 
                        color:Color(0xff4c505b), 
                        fontSize: 27,
                        fontWeight:FontWeight.w700
                
                      ),),
                      CircleAvatar( 
                        radius: 30,
                        backgroundColor: Color(0xff4c505b),
                        child: IconButton( 
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                          },
                          icon: Icon(Icons.arrow_forward_sharp),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    TextButton(onPressed: (){
                      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MySignup()));
                    }, child: 
                    Text('Sign Up',style:TextStyle( 
                      decoration: TextDecoration.underline,
                      fontSize:18,
                      color: Color(0xff4c505b),
                    ))),
                    
                
                  ],
                )
              ]),
            )
            )
          ],
        ),
      ),
    );
  }
}
