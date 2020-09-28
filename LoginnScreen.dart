import 'package:flutter/material.dart';

void main() {
  runApp(TheLoginPage());
}

class TheLoginPage extends StatefulWidget {
  @override
  _TheLoginPageState createState() => _TheLoginPageState();
}

class _TheLoginPageState extends State<TheLoginPage> {

bool _rememberme = false;
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(child: 
          Stack(children: [
            Column 
            (children: [
              Padding(
              padding: EdgeInsets.only(top: 100),
              child:
              Center(child: 
              Text('Trade-Now',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 50,
                fontFamily: 'IndieFlower',
              ),),
              ), //The Work on Text on Top
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child:
              Center(child: 
              Image.asset('assets/trade.png'),
              ), //The Work on Text on Top
            ),
            SizedBox(height: 20,),
            Form(child: 
            Column(children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  labelStyle: TextStyle(fontFamily: 'IndieFlower'),
                    prefixIcon: Icon(
                  Icons.person,
                  color: Colors.grey[600]
                ),
                ),
                
              ),
              SizedBox(height: 10),
               TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  labelStyle: TextStyle(fontFamily: 'IndieFlower'),
                    prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.grey[600]
                ),
                ),
                
              ),
              SizedBox(height: 10),
               Container(
              child: Row(children: [
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.blue),
                  child: Checkbox(
                    value: _rememberme,
                    checkColor: Colors.white,
                    activeColor: Colors.grey[800],
                    onChanged: (value) {
                      setState(()
                      {
                        _rememberme = value; 
                      });
                    },)
                ),
                Text(
                  "Remember Me?"
                , style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),)
              ],),
            ),
            SizedBox(
              height: 10
            ),
             Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                // gradient: LinearGradient(
                //   colors: [
                //     Color.fromRGBO(40, 40, 91, 20),
                //     Color.fromRGBO(41, 50, 100, 20),    
                //   ])
                 color: Colors.blue,
              ),
                  child: Center(
                    child: FlatButton(
                      child: Text("SIGN IN", style: TextStyle(color: Colors.white, fontSize:20, fontFamily: 'CourierPrimeItalic', fontWeight: FontWeight.w700),
                    ),
                    onPressed: (){},
                    ),
                  ),
              ),
            ],)),
            SizedBox(
              height: 10
            ),
              Divider(
              color: Colors.black
            ),
             Container
              (
                padding: EdgeInsets.only(left: 37),
                child: Row(children: [
                  Text("Forgot Password?", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17, color: Colors.grey[500], fontFamily: 'IndieFlower')),
                  SizedBox(width: 70),
                  FlatButton(onPressed: (){}
                  , child: Text("Sign Up", style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 15),))
                ],)
              )
            ],)
            
          ],)
          ),)
        )
      );
  }
}