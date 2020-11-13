import 'dart:io';

import 'package:Project/Ad/PostAd.dart';
import 'package:Project/user/user.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {

   final String email; 
   final String username;
   final String contact;
   final String city;
  final File imageFile;
  final File adImage;

  const Homepage({Key key, this.imageFile, this.email, this.username, this.contact, this.city, this.adImage}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  
     Future<void> _showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context, builder: (BuildContext context)
    {
      return AlertDialog(
        title: Text('View Ads of'),
        content: SingleChildScrollView(
          child: ListBody(children: [
             GestureDetector(
                    child: Text('Game'),
                    onTap: (){
                    FlatButton(onPressed: (){},
                    child: Text(''));
                    },
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    child: Text('Book'),
                    onTap: (){
                    FlatButton(onPressed: (){},
                    child: Text(''));
                    },
                  ),
          ],)
        )
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    
     Widget image_carousel = new Container(
       height: 200,
       child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('assets/games.jpg'),
            AssetImage('assets/gpu.jpg'),
            AssetImage('assets/mouse.png'),
            AssetImage('assets/no.png'),
          ],
          autoplay: false,
          animationCurve: Curves.fastLinearToSlowEaseIn,
          animationDuration: Duration(microseconds: 10000),
       ),
     );

     return Scaffold(
          drawer: Drawer(
        child: Container
        (
           color: Colors.green, 
       child:  ListView(
          children: <Widget>[
             Container(
              color: Colors.redAccent,
              child:  DrawerHeader(
                child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 65.0,
              child: CircleAvatar(
                radius: 61.0,
                child: ClipOval(

                  child: widget.imageFile == null ? Center(
                child: Image.asset('assets/default.png')) : Image.file(widget.imageFile),
                ),
                backgroundColor: Colors.white,
              ),
            ),
            ),
                ),
             Container (
             
              child:  Column(
               children: [
                 Padding( 
                   padding: EdgeInsets.fromLTRB(0, 30, 130, 0),
                   child:
                 FlatButton.icon(
                   onPressed: (){
                      var route = MaterialPageRoute(builder: (BuildContext context) => UserProfilePage1(username: widget.username, email: widget.email, contact: widget.contact, city: widget.contact));
                  Navigator.of(context).push(route);
                   },
                   icon: Icon(Icons.person_outline, color: Colors.white,),
                   label: Text('My Profile', style: TextStyle(color: Colors.white, fontFamily: 'Mera', fontSize: 26, fontWeight: FontWeight.bold)),
                 )
                 ),
                 SizedBox(height: 10),
                 Padding( 
                   padding: EdgeInsets.fromLTRB(0, 30, 120, 0),
                   child: Container
                   (
                     width: double.infinity,
                   child: 
                 FlatButton.icon(
                   onPressed: (){
                 _showChoiceDialog(context);
                   },
                   icon: Icon(Icons.add_shopping_cart, color: Colors.white,),
                   label: Text('Categories', style: TextStyle(color: Colors.white, fontFamily: 'Mera', fontSize: 26, fontWeight: FontWeight.bold)),
                 )
                 ),
                 ),
                 SizedBox(height: 10),
                 Padding( 
                   padding: EdgeInsets.fromLTRB(0, 30, 160, 0),
                   child:
                 FlatButton.icon(
                   onPressed: (){
                     Navigator.pushNamed(context, '/list');
                   },
                   icon: Icon(Icons.account_balance_wallet, color: Colors.white,),
                   label: Text('Ads      ', style: TextStyle(color: Colors.white, fontFamily: 'Mera', fontSize: 26, fontWeight: FontWeight.bold)),
                 )
                 ),
                  SizedBox(height: 10),
                 Padding( 
                   padding: EdgeInsets.fromLTRB(0, 30, 200, 0),
                   child:
                 FlatButton.icon(
                   onPressed: (){
                     Navigator.pushNamed(context, '/sell');
                   },
                   icon: Icon(Icons.create, color: Colors.white,),
                   label: Text('Sell', style: TextStyle(color: Colors.white, fontFamily: 'Mera', fontSize: 26, fontWeight: FontWeight.bold)),
                 )
                 ),
                    SizedBox(height: 10),
                 Padding( 
                   padding: EdgeInsets.fromLTRB(0, 30, 160, 0),
                   child:
                 FlatButton.icon(
                   onPressed: (){
                     Navigator.pushNamed(context, '/');
                   },
                   icon: Icon(Icons.person_add, color: Colors.white,),
                   label: Text('Logout', style: TextStyle(color: Colors.white, fontFamily: 'Mera', fontSize: 26, fontWeight: FontWeight.bold)),
                 )
                 ),
               ],
              ),
            )
          ],
        ),
      ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Center(child:Text('Trade-Now', style: TextStyle(color: Colors.black, fontSize: 24))),
        iconTheme: new IconThemeData(color: Colors.green),
        actions: [
          FlatButton.icon(onPressed: (){
            Navigator.pushNamed(context, '/');
          }, icon: Icon(Icons.person_add), label: Text(''))
        ],
      ),
      
   
      body:    SingleChildScrollView(
        child: Column(children: [
        SizedBox(height: 10),
         Container(
                width: double.infinity,
                height: 90,
                  decoration: BoxDecoration(
                 color: Color(0xFF4A3298), 
                 borderRadius: BorderRadius.circular(5),
                ),
        child: Center(
          child:Text('Come and Trade your Books / Games', style: TextStyle(color: Colors.white, fontSize: 20),
         ),
         ),
         ),
         Container(
           child: image_carousel,
         ),
        Row(
              
               children: [
                 Container(
                   padding: EdgeInsets.only(left: 20),
                   child:
                 Text('Gaming Collection', style: TextStyle(
                   color: Colors.black, fontFamily: 'Mera', fontSize: 20, fontWeight: FontWeight.bold)
                 ),
                 ),
                 
                 Container(
                   padding: EdgeInsets.only(left: 70),
                   child: FlatButton
                   (
                     onPressed: (){},
                     child:
                 Text('View more', style: TextStyle(
                   color: Colors.grey[600], fontFamily: 'Railway', fontSize: 15, fontWeight: FontWeight.bold),
                 ),
                 ),
                 ),
               ],
             ),
             SizedBox(height: 10,),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child:
             Row(children: [
                    Container(
          padding: EdgeInsets.all(10),
              child:   widget.adImage == null ? Center(
                child: Text('')) : Image.file(widget.adImage),
              width: 300,
              height: 300,
           ), 
             ],)
             )
             ],),
        
      ),
         floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.photo_camera),
        onPressed: (){ 
                 var route = MaterialPageRoute(builder: (BuildContext context) => ThirdScreen(name: widget.username,));
                 Navigator.of(context).push(route);
        },
        
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
     );
  }
}