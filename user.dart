import 'dart:io';

import 'package:Project/Ad/adlist.dart';
import 'package:Project/home/homepage.dart';
import 'package:Project/signup/signup.dart';
import 'package:Project/user/updateProfile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfilePage1 extends StatefulWidget {
   final String email; 
   final String username;
   final String contact;
   final String city;

  const UserProfilePage1({Key key, this.email, this.username, this.contact, this.city}) : super(key: key);
  @override
  _UserProfilePage1State createState() => _UserProfilePage1State();
}

class _UserProfilePage1State extends State<UserProfilePage1> {

    Future<void> _showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context, builder: (BuildContext context)
    {
      return AlertDialog(
        title: Text('Select from'),
        content: SingleChildScrollView(
          child: ListBody(children: [
             GestureDetector(
                    child: Text('Gallery'),
                    onTap: (){
                     calleryConnect();
                    },
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: (){
                     cameraConnect();
                    },
                  ),
          ],)
        )
      );
    }
    );
  }
File imageFile;
  cameraConnect() async {
   // print('Picker is Called');
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      imageFile = img;
      setState(() {});
    }
      Navigator.of(context).pop();
  }
   calleryConnect() async {
    // print('Picker is Called');
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      imageFile = img;
      setState(() {});
    }
      Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[200], 
    body: 
    SingleChildScrollView(
      child: Container(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/gradient.png",
              height: 250,),
            ],
          ),
           Padding(
             padding: EdgeInsets.only(top: 50, ),
             child: Center(
                child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 50.0,
              child: CircleAvatar(
                radius: 46.0,
                child: ClipOval(
                  child: (imageFile != null)
                  ? Image.file(imageFile)
                  : Image.asset('assets/bardock.png'),
                ),
                backgroundColor: Colors.white,
              ),
            ),
           ),
           ),
           Container(
             padding: EdgeInsets.fromLTRB(200, 100, 0, 0),
           child: FlatButton(
             child: Icon(Icons.add, size: 25, color: Colors.white),
             onPressed: (){
               _showChoiceDialog(context);
             },
           ),
           ),
           Padding(
             padding: EdgeInsets.only(top: 150),
             child:
           Center(child: Text("${widget.username}" , style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Mera', fontWeight: FontWeight.bold),),)
         ),
        
              Stack(children: [
              Center(
           child: Padding(
             padding: EdgeInsets.only(top: 190),
             child: 
           Container(
           width: 300,
           height: 150,
           decoration: BoxDecoration(
             color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
             boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
           ),
           child: Stack(children: [
             Container(
               child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 19, 0, 0),
                  child:
             Row(children: [
             Padding (
               padding: EdgeInsets.fromLTRB(28, 0, 0, 70),
               child:
             Text('Post', style: TextStyle(color: Colors.redAccent, fontSize: 22, fontFamily: 'Railway', fontWeight: FontWeight.bold))
           ),
            Padding (
               padding: EdgeInsets.fromLTRB(43, 0, 0, 70),
               child:
             Text('Surf', style: TextStyle(color: Colors.redAccent, fontSize: 22, fontFamily: 'Railway', fontWeight: FontWeight.bold))
           ),
            Padding (
               padding: EdgeInsets.fromLTRB(28, 0, 0, 70),
               child:
             Text('Reviews', style: TextStyle(color: Colors.redAccent, fontSize: 22, fontFamily: 'Railway', fontWeight: FontWeight.bold))
           ),
           ],),
               ),
             ),
           SizedBox(height: 10,),
           Column(children: [
             Padding( 
               padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
               child:  Row(children: [
               FlatButton.icon(onPressed: (){
                 Navigator.pushNamed(context, '/sell');
               }, 
               icon: Icon(Icons.add_a_photo), label: Text('')),
             FlatButton.icon(onPressed: (){
                     var route = MaterialPageRoute(builder: (BuildContext context) => ListAd());
                 Navigator.of(context).push(route);
               }, 
               icon: Icon(Icons.shopping_cart), label: Text('')),
               FlatButton.icon(onPressed: (){
                     var route = MaterialPageRoute(builder: (BuildContext context) => UpdateProfile(name: widget.username, fullname: widget.username, contact: widget.contact, email: widget.email, city: widget.city));
                 Navigator.of(context).push(route);
               }, 
               icon: Icon(Icons.person_outline), label: Text('')),
             ],),
             )
            
           ],)
              ]),
           ), 
           ),
              ),
              ]),// End of the Bids thing here
              Column(children: [
                Padding(padding: EdgeInsets.fromLTRB(40, 400, 0, 0),
                child: Container(child: 
                Row(children: [
                  Icon(
                    Icons.mobile_screen_share,
                    color: Colors.redAccent,
                  ),
                  Text("   Contact :  ", style: TextStyle(color: Colors.redAccent, fontFamily: 'Railway', fontSize: 15, fontWeight: FontWeight.bold),),
                   Text("${widget.contact}", style: TextStyle(color: Colors.black, fontFamily: 'Railway', fontSize: 15, fontWeight: FontWeight.bold),),
                ],),
                ),
                ),
              Padding(padding: EdgeInsets.fromLTRB(40, 30, 0, 0),
                child: Container(child: 
                Row(children: [
                  Icon(
                    Icons.email,
                    color: Colors.redAccent,
                  ),
                  Text("   Email :  ", style: TextStyle(color: Colors.redAccent, fontFamily: 'Railway', fontSize: 15, fontWeight: FontWeight.bold),),
                   Text("${widget.email}", style: TextStyle(color: Colors.black, fontFamily: 'Railway', fontSize: 15, fontWeight: FontWeight.bold),),
                ],),
                ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(40, 30, 0, 0),
                child: Container(child: 
                Row(children: [
                  Icon(
                    Icons.home,
                    color: Colors.redAccent,
                  ),
                  Text("   Location :  ", style: TextStyle(color: Colors.redAccent, fontFamily: 'Railway', fontSize:15, fontWeight: FontWeight.bold),),
                   Text("${widget.city}",style: TextStyle(color: Colors.black, fontFamily: 'Railway', fontSize: 15, fontWeight: FontWeight.bold),),
                ],),
                ),
                ),
              ],), //End of the Details
               SizedBox(height: 20,
            ),
              Padding(padding: EdgeInsets.fromLTRB(100, 600, 0, 0),
              child:
            Container(
              height: 50,
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.redAccent,
                  ),
                  child: Center(
                    child: FlatButton(
                      child: Text("Homepage", style: TextStyle(color: Colors.white, fontSize:20,fontWeight: FontWeight.bold, fontFamily: 'Mera'),
                    ),
                    onPressed: (){
                       var route = MaterialPageRoute(builder: (BuildContext context) => Homepage(imageFile: imageFile,));
                 Navigator.of(context).push(route);
                    },
                    ),
                  ),
              ),
              ),
           ],),  
      ),
    ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.person_outline),
        onPressed: (){
           var route = MaterialPageRoute(builder: (BuildContext context) => SignUpppPage());
                 Navigator.of(context).push(route);}
    ),
    
       floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}