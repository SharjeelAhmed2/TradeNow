import 'package:flutter/material.dart';

void main() {
  runApp(LogPage());
}

class LogPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LogPage> {

bool _rememberme = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[900],
        body:   SingleChildScrollView(
        child:Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/backgound.png'),
        //       fit: BoxFit.fitWidth
        //   )
        // ),
        child: 
        Stack( 
          children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                       Color.fromRGBO(10, 40,70, 50),
                    Color.fromRGBO(10, 40,70, 50),    
                    ],
                  ),
                ),
              ),
                   Padding(
                padding: EdgeInsets.fromLTRB(120, 90, 40, 50), 
                child: Container(child:CircleAvatar(
            child: Image.asset('assets/log.png'),
            radius: 62.0,
                )
                )
              ),
               Container(
            margin: EdgeInsets.only(top: 220),
          child: Column(children: [
            Center(
            child:
            Text("Sign In", 
            style: 
            TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w400),
            ),
            ),
            Padding( 
               padding: EdgeInsets.fromLTRB(0, 50, 300, 0),
               child: 
            Text(
              'Email',
              style: TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,fontSize: 20),)
            ),//Text Email Padding,
            SizedBox(height: 10.0), //Height from email logo to the Email Address Input 
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration
              (
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20.0,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              height: 60.0,
              child: TextFormField(
                keyboardType: TextInputType.name, 
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                hintText: "Enter your Username"
                
              ),
            )//This carries the email address textformfield 
            ),//End of Email work
            SizedBox(height: 10.0),
             Padding( 
               padding: EdgeInsets.fromLTRB(0, 3, 265, 0),
               child: 
            Text(
              'Password',
              style: TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,fontSize: 20),)
            ),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration
              (
             //   color: Color(0xFF6CA8F1),
             color: Colors.blue[700],
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20.0,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              height: 60.0,
              child: TextFormField(
                 obscureText: true,
                keyboardType: TextInputType.name, 
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                hintText: "Enter your Password"
                
              ),
             
            )//This carries password textformfield
            ), //End of Password work
            SizedBox(height: 4.0,),
            Container(
              alignment: Alignment.centerRight,
              child: (
                FlatButton(onPressed: (){}, 
                child: Text("Forgot Password",
                style: TextStyle(color: Colors.white, fontSize: 15),))
              ),
            ),//End of Forgot Password
            Container(
              child: Row(children: [
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.amberAccent),
                  child: Checkbox(
                    value: _rememberme,
                    checkColor: Colors.blue[900],
                    activeColor: Colors.amberAccent,
                    onChanged: (value) {
                      setState(()
                      {
                        _rememberme = value; 
                      });
                    },)
                ),
                Text(
                  "Remember Me?"
                , style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.w300),)
              ],),
            ),
            SizedBox(height: 9.0,),// End of Remember me
             Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(40, 40, 91, 20),
                    Color.fromRGBO(41, 50, 100, 20),    
                  ])),
                  child: Center(
                    child: FlatButton(
                      child: Text("SIGN IN", style: TextStyle(color: Colors.white, fontSize:20,fontWeight: FontWeight.w100),
                    ),
                    onPressed: (){},
                    ),
                  ),
              ),
              SizedBox(height: 10.0,),// End of the Login Button
              Container
              (
                padding: EdgeInsets.only(left: 57),
                child: Row(children: [
                  Text("Don't have an account?", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white)),
                  FlatButton(onPressed: (){}
                  , child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),))
                ],)
              )   
          ] //SignUP Column Children
        ) //Column of Sign Up
                ) ]
      )
      )
        
        )
      )
      
    );
  }
}
