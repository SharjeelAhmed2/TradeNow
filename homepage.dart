import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

Icon customIcon = Icon(Icons.search);
Widget customTitle = Text('Trade Now');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
       actions: [
         IconButton(
           icon: customIcon,
           onPressed: (){
             showSearch(context: context, delegate: DataSearch());            //  setState((){
         
             },
         )
       ],
       title: Text("Trade Now", style: TextStyle(fontFamily: 'Mera', fontWeight: FontWeight.bold)), 
      ),
      drawer: Drawer(
        child: Container
        (
           color: Colors.redAccent, 
       child:  ListView(
          children: <Widget>[
             Container(
              
              child:  DrawerHeader(
                child:  CircleAvatar(
                   child: Image.asset('assets/log.png'),
                )),
                ),
             Container (
             
              child:  Column(
                // children:  List.generate(4, (int index)
                // {
                //   return  ListTile(
                //     leading:  Icon(Icons.info),
                //   );
                // }),
               children: [
                 Padding( 
                   padding: EdgeInsets.fromLTRB(0, 30, 130, 0),
                   child:
                 FlatButton.icon(
                   onPressed: (){},
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
                   onPressed: (){},
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
                   onPressed: (){},
                   icon: Icon(Icons.account_balance_wallet, color: Colors.white,),
                   label: Text('My Ads', style: TextStyle(color: Colors.white, fontFamily: 'Mera', fontSize: 26, fontWeight: FontWeight.bold)),
                 )
                 ),
                  SizedBox(height: 10),
                 Padding( 
                   padding: EdgeInsets.fromLTRB(0, 30, 200, 0),
                   child:
                 FlatButton.icon(
                   onPressed: (){},
                   icon: Icon(Icons.create, color: Colors.white,),
                   label: Text('Sell', style: TextStyle(color: Colors.white, fontFamily: 'Mera', fontSize: 26, fontWeight: FontWeight.bold)),
                 )
                 ),
                    SizedBox(height: 10),
                 Padding( 
                   padding: EdgeInsets.fromLTRB(0, 30, 160, 0),
                   child:
                 FlatButton.icon(
                   onPressed: (){},
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
     //End of the Drawer work here


      body: 
    SingleChildScrollView(
      child: Stack(children: [
       Container(child: 
      Column(children: [
    
        
////////The work of posting ads //////////
     SizedBox(height: 10),
     
        Container(
           width: double.infinity,
           height: 70,
           decoration: BoxDecoration(
             color: Colors.transparent,
             boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
           ),
          child:
          Padding
          (padding: EdgeInsets.fromLTRB(60, 20, 0, 0),
            child:  
            Row
          (children: [
            FlatButton(
              onPressed:(){},
              child:
            Container(child:CircleAvatar(
            radius: 30,
            backgroundImage: 
            AssetImage("assets/download.png"),
            )
            ),
            ),
            SizedBox(width: 40),
           FlatButton.icon(onPressed: (){},
            icon: 
            Icon(Icons.book, size: 50,color: Colors.yellowAccent,), label: Text(''))
          ]
          ),
          ),
          ),
          SizedBox(height: 15),
              Container(
           width: double.infinity,
           height: 60,
           decoration: BoxDecoration(
             color: Colors.white,
             boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
           ),
          child:
          Padding
          (padding: EdgeInsets.all(20),
            child:  
          Text('Displaying the current Ads', 
          style: 
          TextStyle( color: Colors.black, fontSize: 17, fontFamily: 'Secular', fontWeight: FontWeight.w500),
          )
          ),
          ),
          SizedBox(height: 15),
           Container
          (
              
           width: double.infinity,
           height: 290,
           decoration: BoxDecoration(
             color: Colors.white,
             boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
           ), 
           child: Column
           (children: [
              Row(children: [
              Column
              (children: [
                 Container
              (
            padding: EdgeInsets.only(bottom: 0),
              child: Image.asset('assets/re2.jpg',
              width: 180,
              height: 200,
           ),
            ),
            SizedBox(height: 10),
            Container
              (
                padding: EdgeInsets.only(right: 70),
                child: Text('Rs 3700', 
                style: TextStyle(fontFamily: 'CourierPrimeItalic', fontWeight: FontWeight.bold, fontSize: 20,)),
              ),
              SizedBox(height: 5),
                Container
              (
                padding: EdgeInsets.only(right: 40),
                child: Text('Resident Evil 2 Disc', 
                style: TextStyle(fontFamily: 'Mera', fontWeight: FontWeight.bold )),
              ),
              SizedBox(height: 5),
                Container
              (
                padding: EdgeInsets.only(right: 40),
                child: Text('Karachi', 
                style: TextStyle(fontFamily: 'Mera', fontWeight: FontWeight.bold )),
              ),
              ],),
           
                Column
              (children: [
                 Container
              (
            padding: EdgeInsets.only(bottom: 0),
              child: Image.asset('assets/richppor.jpg',
              width: 180,
              height: 200,
           ),
            ),
            SizedBox(height: 10),
            Container
              (
                padding: EdgeInsets.only(right: 70),
                child: Text('Rs 1500', 
                style: TextStyle(fontFamily: 'CourierPrimeItalic', fontWeight: FontWeight.bold, fontSize: 20,)),
              ),
              SizedBox(height: 5),
                Container
              (
                padding: EdgeInsets.only(right: 40),
                child: Text('Rich Dad Poor Dad', 
                style: TextStyle(fontFamily: 'Mera', fontWeight: FontWeight.bold )),
              ),
              SizedBox(height: 5),
                Container
              (
                padding: EdgeInsets.only(right: 40),
                child: Text('Lahore', 
                style: TextStyle(fontFamily: 'Mera', fontWeight: FontWeight.bold )),
              ),
              ],),
           
            ],), 
           ],)
          ),
          SizedBox(
            height: 10,
            child: Center
            (child: Container( 
            height: 5.0,
            color: Colors.red),)
          ),
        ///The Work for the end part
        
      ],),),
      ],)
    )
    );
  }
}

class DataSearch extends SearchDelegate<String>
{

final games = [
  "Uncharted 4",
  "PlayStation4 Controller",
  "The Alchemist",
  "The Brief History of Time",
  "Nvidia 1660 6GB",
  "Mouse",
  "GTA V",
  "Game of Thrones",
  "20th Century Boys",
];

final recentgames = [
  "PlayStation4 Controller",
  "The Alchemist",
  "The Brief History of Time",
  "Nvidia 1660 6GB",
  "Mouse",
];


  
  @override
  List<Widget> buildActions(BuildContext context) {
      return
      [
        IconButton(icon: Icon(Icons.clear),onPressed: (){
          query = "";
        },)
      ];
      throw UnimplementedError();
    } 
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: AnimatedIcon(icon: 
        AnimatedIcons.menu_arrow,
        progress: transitionAnimation),
        onPressed: (){
          close(context, null);
        },
      );
    
      throw UnimplementedError();
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Center(
        child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
      )
        ),
        ),
      );
      throw UnimplementedError();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recentgames:games.where((p) => p.startsWith(query)).toList(); //if search bar is empty then just show recent ones else show all
    return ListView.builder(itemBuilder: 
    (context, index) => ListTile(
      onTap: (){
        showResults(context);
      },
      leading: Icon(Icons.book, color: Colors.redAccent,),
    title: RichText(
      text: TextSpan(
        text: suggestionList[index].substring(0, query.length),
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: suggestionList[index].substring(query.length),
            style: TextStyle(color: Colors.grey[500]), 
          )
        ]
      )
    )),
    itemCount: suggestionList.length,
    );
    throw UnimplementedError();
  }
} 