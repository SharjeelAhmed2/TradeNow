import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
   title: 'Navigation Basics',
   debugShowCheckedModeBanner: false,
   home: LogginnPage()
  ));
}

class LogginnPage extends StatefulWidget {
  @override
  _LogginnPageState createState() => _LogginnPageState();
}

class _LogginnPageState extends State<LogginnPage> {

bool _rememberme = false;

final scaffoldkey = new GlobalKey<ScaffoldState>();
final formKey = new GlobalKey<FormState>();

void _submit()
{
  final form = formKey.currentState;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Center(child:
            Padding
            (padding: EdgeInsets.only(top: 50),
              child: Image.asset('assets/deal.png',
            height: 200,),),
            ),
            SizedBox(height: 10,),
            Center(child: 
            Text('Join Us', style: TextStyle(fontFamily: 'IndieFlower', fontSize: 40, color: Colors.green),),),
            Container(
                   child: Form(key: formKey,
                child: Column(children: [
                   Container
                  (
                    padding: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                      border: 
                      Border(bottom: BorderSide(color: Colors.grey[400]))
                    ),
                     child: TextFormField(
                keyboardType: TextInputType.name, 
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
            //    contentPadding: EdgeInsets.only(top: 4),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                hintText: "Enter your Email",
                  hintStyle: TextStyle(fontFamily: 'Mera', fontWeight: FontWeight.w900)
              ),
            validator: (val) {
              if (val.isEmpty)
              {
                return "Wrong Username";
              }
            }
          ),),
                  Container
                  (
                    padding: EdgeInsets.only(top: 14),
                      decoration: BoxDecoration(
                      border: 
                      Border(bottom: BorderSide(color: Colors.grey[400]))
                    ),
                     child: TextFormField(
                keyboardType: TextInputType.name, 
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
            //    contentPadding: EdgeInsets.only(top: 4),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                hintText: "Enter your Username",
                  hintStyle: TextStyle(fontFamily: 'Mera', fontWeight: FontWeight.w900)
              ),
            validator: (val) {
              if (val.isEmpty)
              {
                return "Wrong Username";
              }
            }
          ),),
                 Container
                  (
                    padding: EdgeInsets.only(top: 14),
                      decoration: BoxDecoration(
                      border: 
                      Border(bottom: BorderSide(color: Colors.grey[400]))
                    ),
                     child: TextFormField(
                keyboardType: TextInputType.name, 
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
            //    contentPadding: EdgeInsets.only(top: 4),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                hintText: "Enter your Password",
                  hintStyle: TextStyle(fontFamily: 'Mera', fontWeight: FontWeight.w900)
              ),
            validator: (val) {
              if (val.isEmpty)
              {
                return "Wrong Username";
              }
            }
          ),), 
             SizedBox(height: 30,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.green,
                  ),
                  child: Center(
                    child: FlatButton(
                      child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize:20,fontWeight: FontWeight.bold, fontFamily: 'Railway'),
                    ),
                    onPressed: _submit,
                    ),
                  ),
              ),
              SizedBox(height: 2.0,),  
          Container(child: 
              Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 60),
                 child: 
                 Container(
                  child: Text("Already have an account?? ", style: TextStyle(color: Colors.grey[800], fontFamily: 'Railway'),),
                ),   ),
                   
                FlatButton(onPressed: (){},
                child: Text('Sign In!', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontFamily: 'IndieFlower'),),)
              ],),)
                ],
                ),
                   ),
            )
            ],)
        )
      ),
    );
  }
}

