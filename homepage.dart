import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
   title: 'Navigation Basics',
   debugShowCheckedModeBanner: false,
   home: HomePage()
  ));
}

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
      drawer: Drawer(),
      body: 
    SingleChildScrollView(
      child: Stack(children: [
       Container(child: 
      Column(children: [
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
        
////////The work of posting ads //////////
     
           Container
          (
            child: Stack(children: [
              Positioned
              (child: 
              Row
              (children: [
                Column
                (children: [
                  Container(
                    child:
            
            Padding
            (padding: EdgeInsets.only(top: 50),
              child: Image.asset('assets/re2.jpg',
              width: 180,
            height: 220,),
            ),
                  ),
                ],),
                Column
                (children: [
                  Container(
                    child:
            
            Padding
            (padding: EdgeInsets.only(top: 50),
              child: Image.asset('assets/boyzz.jpg',
              width: 180,
            height: 220,),
            ),
                  ),
                ],)
              ],),)
            ],),
          ),

        ///The Work for the end part
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 575),
            child:  Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Colors.grey[400],
                  ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                       Padding(
                        padding: EdgeInsets.fromLTRB(2, 10, 0,0),
                        child:
                      Column(children: [
                      Icon(Icons.phone,
                      size: 30,
                      color: Colors.redAccent,),
                      SizedBox(height: 0),
                      FlatButton(
                        child:
                      Text('Contact'),
                      onPressed: (){},
                      ),
                      ],),
                      ),
                     Padding(
                        padding: EdgeInsets.fromLTRB(2, 10, 0,0),
                        child:
                      Column(children: [
                      Icon(Icons.home,
                      size: 30,
                      color: Colors.redAccent,),
                      SizedBox(height: 0),
                      FlatButton(
                        child:
                      Text('Discover'),
                      onPressed: (){},
                      ),
                      ],),
                      ),
                     Padding(
                        padding: EdgeInsets.fromLTRB(2, 10, 0,0),
                        child:
                      Column(children: [
                      Icon(Icons.play_circle_filled,
                      size: 30,
                      color: Colors.redAccent,),
                      SizedBox(height: 0),
                      FlatButton(
                        child:
                      Text('My ads'),
                      onPressed: (){},
                      ),
                      ],),
                      ),
                     Padding(
                        padding: EdgeInsets.fromLTRB(2, 10, 0,0),
                        child:
                      Column(children: [
                      Icon(Icons.person_outline,
                      size: 30,
                      color: Colors.redAccent,),
                      SizedBox(height: 0),
                      FlatButton(
                        child:
                      Text('Profile'),
                      onPressed: (){},
                      ),
                      ],),
                      ),
                  ],)
            ),
            ),
        )
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