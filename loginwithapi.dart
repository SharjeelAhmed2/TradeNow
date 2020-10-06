import 'package:Project/Loginwork/finalsigh.dart';
import 'package:Project/faltuscreens/moaruser.dart';
import 'package:Project/forgotpassword/email-forgotpassword.dart';
import 'package:flutter/material.dart';
import 'package:Project/apilearnwork/apiwriting.dart';
//mport 'package:get_it/get_it.dart';

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

 TextEditingController _usernamecontroller = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();
bool _rememberme = false;
String message;

final scaffoldkey = new GlobalKey<ScaffoldState>();
final _formKey = new GlobalKey<FormState>();

void _submit()
{
  final form = _formKey.currentState;
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
              child: Image.asset('assets/trde.jpg',
            height: 200,),),
            ),
            SizedBox(height: 10,),
            Center(child: 
            Text('Trade-Now', style: TextStyle(fontFamily: 'Railway', fontSize: 40, color: Colors.redAccent, fontWeight: FontWeight.bold),),),
            Container(
                   child: Form(key: _formKey,
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
                  Icons.person,
                  color: Colors.redAccent,
                ),
                hintText: "Enter your Username",
                  hintStyle: TextStyle(fontFamily: 'Mera', fontWeight: FontWeight.w900)
              ),
            validator: (value){
              if (value.isEmpty)
              {
                return "Wrong Username";
              }
              return null;
            }
          ),),
                 Container
                  (
                    padding: EdgeInsets.only(top: 10),
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
                  color: Colors.redAccent,
                ),
                hintText: "Enter your Password",
                  hintStyle: TextStyle(fontFamily: 'Mera', fontWeight: FontWeight.w900)
              ),
              obscureText: true,
            validator: (val) {
              if (val.isEmpty)
              {
                return "Wrong password";
              }
              return null;
            }
          ),),   SizedBox(
            height: 5
          ),
           Container(
              child: Row(children: [
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.blueAccent),
                  child: Checkbox(
                    value: _rememberme,
                    checkColor: Colors.black,
                    activeColor: Colors.blueAccent,
                    onChanged: (value) {
                      setState(()
                      {
                        _rememberme = value; 
                      });
                    },)
                ),
                Text(
                  "Remember Me?"
                , style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontFamily: 'Railway'),)
              ],),
            ),
             SizedBox(height: 20,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.redAccent,
                  ),
                  child: Center(
                    child: FlatButton(
                      child: Text("Login", style: TextStyle(color: Colors.white, fontSize:20,fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate())
                      {
                        var username = _usernamecontroller.text;
                        var password = _passwordcontroller.text;
                        var rsp = await ApiDatas().loginUser(username,password);
                        if(rsp.conainsKey('status'))
                        {
                          if(rsp['status']==1)
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return UserProfilePage();
                            }));
                          }
                        }
                      }
                    },
                    ),
                  ),
              ),
              SizedBox(height: 2.0,),  
              Container(
                child: 
                Center
              (child: FlatButton(
                onPressed: (){  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmailForgotPassword()));},
                child: Text('Forgot Password?', style: TextStyle(color: Colors.green, fontFamily: 'Railway', fontSize: 15.0, fontWeight: FontWeight.bold))
              )
              ,)
              ),
              Container(child: 
              Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 60),
                 child: 
                 Container(
                  child: Text("Don't have an account? ", style: TextStyle(color: Colors.grey[800], fontFamily: 'Railway'),),
                ),   ),
                   
                FlatButton(onPressed: (){
                      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpppPage()));},                      
                child: Text('Sign Up!', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontFamily: 'IndieFlower'),),)
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

