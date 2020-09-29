import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
   title: 'Navigation Basics',
   debugShowCheckedModeBanner: false,
   home: UserProfilePage()
  ));
}

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
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
             padding: EdgeInsets.only(top: 50),
                child: Center(child:CircleAvatar(
            child: Image.asset('assets/bardock.png'),
            radius: 50.0,
            ),
          ),
           ),
           Padding(
             padding: EdgeInsets.only(top: 150),
             child:
           Center(child: 
           Text("Bardock Obama", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Mera', fontWeight: FontWeight.bold),),)
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
             Text('Bids', style: TextStyle(color: Colors.redAccent, fontSize: 22, fontFamily: 'Railway', fontWeight: FontWeight.bold))
           ),
            Padding (
               padding: EdgeInsets.fromLTRB(28, 0, 0, 70),
               child:
             Text('Rating', style: TextStyle(color: Colors.redAccent, fontSize: 22, fontFamily: 'Railway', fontWeight: FontWeight.bold))
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
               padding: EdgeInsets.fromLTRB(35, 80, 0, 0),
               child:  Row(children: [
               Text("4", style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'Mera', fontWeight: FontWeight.bold)),
               SizedBox(width: 60,),
               Text("4 stars", style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'Mera', fontWeight: FontWeight.bold)),
               SizedBox(width: 30,),
               Text("Click Here", style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'Mera', fontWeight: FontWeight.bold)),
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
                  Text("+941-231546524", style: TextStyle(color: Colors.black, fontFamily: 'Railway', fontSize: 15, fontWeight: FontWeight.bold),),
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
                  Text("BardockObama@gmail.com", style: TextStyle(color: Colors.black, fontFamily: 'Railway', fontSize: 15, fontWeight: FontWeight.bold),),
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
                  Text("Karachi", style: TextStyle(color: Colors.black, fontFamily: 'Railway', fontSize: 15, fontWeight: FontWeight.bold),),
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
                      child: Text("Contact", style: TextStyle(color: Colors.white, fontSize:20,fontWeight: FontWeight.bold, fontFamily: 'Mera'),
                    ),
                    onPressed: (){},
                    ),
                  ),
              ),
              ),
           ],),  
      ),
    ),
    );
  }
}