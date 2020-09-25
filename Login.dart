import 'package:Project/backup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {

final scaffoldkey = new GlobalKey<ScaffoldState>();
final formKey = new GlobalKey<FormState>();

void _submit()
{
  final form = formKey.currentState;

  if(form.validate())
  {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FemaleFacultyTras()));
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(  
        backgroundColor: Colors.black,
      body: 
      SingleChildScrollView(
        child:Container(
         // padding: EdgeInsets.all(),
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/belod.png'),
        //       fit: BoxFit.fitHeight
        //   )
        // ),
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(120, 90, 40, 50), 
          child:Container(child:CircleAvatar(
            child: Image.asset('assets/gameboy.png'),
            radius: 62.0,
          ),),
          ), //The stack means you can have content over content and in its children you can have all the columns and rows 
          Positioned(child: 
          Container(
            margin: EdgeInsets.only(top: 220),
          child: Column(children: [
            Center(
            child:
            Text("Login", 
            style: 
            TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
            ),
            ),
          Padding(
            padding: EdgeInsets.all(50),
            child: Column(children: [
              Container(
                // decoration: BoxDecoration(
                //   color: Colors.transparent,
                //   boxShadow: [
                //     BoxShadow(color: Colors.transparent,
                //     blurRadius: 20.0,
                //     offset: Offset(0,10))
                //   ]
                // ),
                child: Form(key: formKey,
                child: Column(children: [
          //           Container(
          //       padding: EdgeInsets.all(5),
          //       decoration: BoxDecoration(border: 
          //       Border(bottom: BorderSide(color: Colors.grey[500]),),),
          //       child: 
          //     TextFormField(
          //        style: TextStyle(
          //         color: Colors.white
          //       ),
          //   decoration: InputDecoration(
          //     border: InputBorder.none,
          //     hintText: "Enter Your Email",
          //     hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.normal)
          //   ),
          //      validator: (val) =>
          //   !val.contains('@') ? 'Invalid Email' : null,
          // ),),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(border: 
                Border(bottom: BorderSide(color: Colors.grey[500]),),),
                child: 
              TextFormField(
                 style: TextStyle(
                  color: Colors.white
                ),
            decoration: InputDecoration(
             border: InputBorder.none,
              hintText: "Enter Your Username",
              hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.normal)
            ),
          ),),
          Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(border: 
                Border(bottom: BorderSide(color: Colors.grey[500]),),),
                child: 
              TextFormField(
                style: TextStyle(
                  color: Colors.white
                ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter Your Password",
              hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.normal)
            ),
          validator: (val) =>
            val.length < 8 ? 'Password is weak' : null,
            obscureText: true,
          ),),
            SizedBox(height: 60,
            ),
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(160, 40,70, 50),
                    Color.fromRGBO(10, 40,70, 50),    
                  ])),
                  child: Center(
                    child: FlatButton(
                      child: Text("Login", style: TextStyle(color: Colors.white, fontSize:20,fontWeight: FontWeight.bold),
                    ),
                    onPressed: _submit,
                    ),
                  ),
              ),  
              SizedBox(height: 30,),
             Container(
                 child: FlatButton(
                   child:  Text("Don't have an account  ?", 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.blue[900]),),
              onPressed: ()
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
            color: Colors.black26,
                 ),
               )
               ]
                ) 
          ))
          ],
          ),
          ),
          ],
          )
                ) 
          ), //children stack widget
        ])
        
      )
      ) 
      )
    );
  }
}