import 'dart:io';

import 'package:Project/ModelClass/Ad.dart';
import 'package:Project/home/homepage.dart';
import 'package:flutter/material.dart';


class ListAd extends StatefulWidget {

   
  final File imageFile;
  const ListAd({Key key, this.imageFile,}) : super(key: key);


  @override
  
  _ListAdState createState() => _ListAdState();
}

 

class _ListAdState extends State<ListAd> {

  List<Product> productList =[
    Product(name: "Xbox360 Games", price: "13,000", image: "assets/games.jpg"),
    Product(name: "PlayStation4", price: "33,000", image: "assets/playstation4.jpg"),
     Product(name: "Xbox360", price: "21,000", image: "assets/xbox.png"),
      Product(name: "Intel HD Graphics Card", price: "25,000", image: "assets/gpu.jpg"),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
       title: Text('Displaying Ads') 
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10,),
              TextField(
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               hintText: 'Enter Bitchs name or price', 
             ),
             onChanged: (string)
             {
               setState(() {
                 productList = productList.where((element) => (element.name.toLowerCase().contains(string.toLowerCase()) || element.price.toLowerCase().contains(string.toLowerCase()))).toList();
               });
             },
           ),
           Container(
             padding: EdgeInsets.only(left: 160),
             child: FlatButton(
               child: Text('Advanced Search', style: TextStyle(fontSize: 18, color: Colors.blueAccent)),
               onPressed: (){
                 Navigator.pushNamed(context, '/filters');
               },
             ),
           ),
             Container(
          padding: EdgeInsets.all(10),
              child:    widget.imageFile == null ? Center(
                child: Text('Post product image')) : Image.file(widget.imageFile),
              width: 300,
              height: 300,
           ), 
            Expanded(
             child: ListView.builder(
               itemCount: productList.length,
               itemBuilder: (BuildContext context, int index)
               {
                 return showData(productList[index]);
               }
             ),
           ),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.arrow_back),
        onPressed: (){
           var route = MaterialPageRoute(builder: (BuildContext context) => Homepage(adImage: widget.imageFile,));
                 Navigator.of(context).push(route);}
    ),
    
       floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

 class Cateogries extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Container(
       
     );
   }
 }