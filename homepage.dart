import 'dart:io';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:lauda/grid/gridview.dart';
import 'package:lauda/navigation/navbaar.dart';
import 'package:lauda/user/users.dart';

class Homepage extends StatefulWidget {
final File imageFile;
final String name;
final String contact;
final String email;
final String address;

  const Homepage({Key key, this.imageFile, this.name, this.contact, this.email, this.address}) : super(key: key);
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
   List<Product21> productList =[
    Product21(name: "Xbox360 Games", price: "13,000", image: "assets/games.jpg"),
    Product21(name: "PlayStation4", price: "33,000", image: "assets/playstation4.jpg"),
     Product21(name: "Xbox360", price: "21,000", image: "assets/xbox.png"),
      Product21(name: "Intel HD Graphics Card", price: "25,000", image: "assets/gpu.jpg"),
  ];
   Widget showData(data)
   {
     return Card(
       margin: EdgeInsets.all(10),
       child: Center(
       child: Column(
        children:[
          Image.asset(data.image),
          SizedBox(height: 4,),
          Text(data.name),
          SizedBox(height: 4,),
          Text(data.price)
        ]
       )
       )
     );
   }

  @override
  Widget build(BuildContext context) {
    
     Widget imageCarousel = new Container(
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
                          var route = MaterialPageRoute(builder: (BuildContext context) =>  OwnProfile(email: widget.email, contact: widget.contact, username: widget.name));
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
                     Navigator.pushNamed(context, '/post');
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
                     Navigator.pushNamed(context, '/grid');
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
      body: SafeArea(
        child: SingleChildScrollView(
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
           child: imageCarousel,
         ),
        Row(
              
               children: [
                 Container(
                   padding: EdgeInsets.only(left: 20),
                   child:
                 Text('Newly Posted', style: TextStyle(
                   color: Colors.black, fontFamily: 'Mera', fontSize: 20, fontWeight: FontWeight.bold)
                 ),
                 ),
                 
                 Container(
                   padding: EdgeInsets.only(left: 70),
                   child: FlatButton
                   (
                     onPressed: (){
                       var route = MaterialPageRoute(builder: (BuildContext context) => Grud(email: widget.email, contact: widget.contact, name: widget.name, address: widget.address,));
                              Navigator.of(context).push(route);
                     },
                     child:
                 Text('View more', style: TextStyle(
                   color: Colors.grey[600], fontFamily: 'Railway', fontSize: 15, fontWeight: FontWeight.bold),
                 ),
                 ),
                 ),
               ],
             ),
             SizedBox(height: 10,), 
              Container(
          child: 
         GridView.count(
           physics: ScrollPhysics(),
           shrinkWrap: true,
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(productList.length, (index)
          {
            return Center(
              child: showData(productList[index]),
            );
          }),
        ),
      ),
             ],),     
      ),
      ),
      bottomNavigationBar: NavigationBar(),
      //   floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.redAccent,
      //   child: Icon(Icons.image),
      //   onPressed: (){    
      //   },
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
