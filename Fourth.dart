import 'dart:io';
import 'package:flutter/material.dart';
import 'package:randi/RouteFolder/Third.dart';

class FourthScreen extends StatefulWidget {
 
   final String texi; 
   final String description;
   final File images;
   final String pricez;

  const FourthScreen({Key key, this.texi, this.description, this.images, this.pricez}) : super(key: key);

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
               Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Image.file(widget.images),
                height: 329,
                width: 329,)
                ,
              ),

                Container(
        
                     width: double.infinity,
           height: 370.5,
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
           child:    
           Column(
             children: [
              Text("${widget.texi}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),
              SizedBox(height: 40,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                
              Text("${widget.description}", style: TextStyle(fontSize: 24)),
              
              SizedBox(height: 20,),
                Text("${widget.pricez}", style: TextStyle(fontSize: 18)),
              SizedBox(height: 40,),
           ]),
              
            ]),
          )
            ]),
      ),
    ),
    floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.arrow_back),
        onPressed: (){
           var route = MaterialPageRoute(builder: (BuildContext context) => ThirdScreen());
                 Navigator.of(context).push(route);}
    ),
    
       floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

