import 'package:Project/Loginwork/finalog.dart';
import 'package:Project/apilearnwork/apiwriting.dart';
import 'package:Project/apilearnwork/userinsertdata.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(
    MaterialApp(
   title: 'Navigation Basics',
   debugShowCheckedModeBanner: false,
   home: SignUpppAPIPage()
  ));
}

class SignUpppAPIPage extends StatefulWidget {
  @override
  _SignUpppAPIPageState createState() => _SignUpppAPIPageState();
}

class _SignUpppAPIPageState extends State<SignUpppAPIPage> {

UserData get userData => GetIt.I<UserData>(); 

TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _contactController = TextEditingController();
TextEditingController _locationController = TextEditingController();

void initState()
{

  super.initState();
}
 
bool _rememberme = false;

final scaffoldkey = new GlobalKey<ScaffoldState>();
final formKey = new GlobalKey<FormState>();

void _submit()
{
  final form = formKey.currentState;
}
  int _value = 1;
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
            Text('Join Us', style: TextStyle(fontFamily: 'Railway', fontSize: 40, color: Colors.green, fontWeight: FontWeight.bold),),),
            Container(
                   child: Form(key: formKey,
                child: Column(children: [
                   Container
                  (
                    padding: EdgeInsets.only(top: 30),
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
                  Icons.phone_android,
                  color: Colors.black,
                ),
                hintText: "Enter your Contact Info",
                  hintStyle: TextStyle(fontFamily: 'Mera', fontWeight: FontWeight.w900)
              ),
            validator: (val) {
              if (val.isEmpty)
              {
                return "Invalid Number";
              }
            }
          ),), 
          SizedBox(height:14),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child:
          Row(children: [
          Container(child: 
             Text('Location', style: TextStyle( fontFamily: 'Railway', fontWeight: FontWeight.w900, fontSize: 22, color: Colors.grey[500])),),
             SizedBox(width: 30,),
             Container(
               child: DropdownButton(
                  value: _value,
                  items: [DropdownMenuItem(
                  child: Text("Karachi"),
                  value: 1,),
                  DropdownMenuItem(
                  child: Text("Lahore"),
                  value: 2,),DropdownMenuItem(
                  child: Text("Peshawar"),
                  value: 3,),DropdownMenuItem(
                  child: Text("Multan"),
                  value: 4,),DropdownMenuItem(
                  child: Text("Quetta"),
                  value: 5,),
               ],
                onChanged: (value) {
                setState(() {
                  _value = value;
                });
              }),
             )
          ],),
          ),
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
                    onPressed: () async {
                      final user = UserData(
                        username: _usernameController.text,
                        password: _passwordController.text,
                        email: _emailController.text,
                        contact: int.parse(_contactController.text),
                        location: _locationController.text, 
                      );
                      final result = await ApiDatas().createUser(user);
                    },
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
                   
                FlatButton(onPressed: (){     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogginnPage()));},
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

