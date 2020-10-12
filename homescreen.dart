import 'package:Project/apilearnwork/userprofileapi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
   title: 'Navigation Basics',
   debugShowCheckedModeBanner: false,
   home: HomeScreen()
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView
        (
          child: Container(
           child: Column
          (
            children: [
              Padding
              (

                padding: EdgeInsets.fromLTRB(20,30, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                    width: 240,
                    decoration: BoxDecoration
                    (
                      
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextFormField(
                    decoration: InputDecoration
                    (
                     enabledBorder: InputBorder.none,
                     focusedBorder: InputBorder.none,
                     hintText: 'Search Product', 
                     prefixIcon: Icon(Icons.search, color: Colors.black,),
                    ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserProfilePageAPI()));
                    },
                    borderRadius: BorderRadius.circular(50),
                   child:
                  Container
                  (
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration
                    (
                     color: Colors.grey[200],
                     shape: BoxShape.circle, 
                    ),
                    child:Icon(Icons.person_outline),
                  )
                  ),
                  InkWell(
                    onTap: (){
                           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserProfilePageAPI()));
                    },
                    borderRadius: BorderRadius.circular(50),
                   child:
                  Container
                  (
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration
                    (
                     color: Colors.grey[200],
                     shape: BoxShape.circle, 
                    ),
                    child:Icon(Icons.person_add),
                  )
                  ),
                ],)
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 90,
                  decoration: BoxDecoration(
                 color: Color(0xFF4A3298), 
                 borderRadius: BorderRadius.circular(18),
                ),
                 child: 
                 Container(
                   padding: EdgeInsets.all(10),
                   child: Text.rich(
                   TextSpan(
                     text: "Trade-Now\n",
                     style: TextStyle( fontSize: 16, color: Colors.white),
                     children:
                     [   
                       TextSpan(
                         text: 'Trade your games and books',
                         style: TextStyle(fontFamily: "robot", fontSize: 18, fontWeight: FontWeight.bold)
                       )
                     ]
                   )
                 ),
                ),
              ),
              Categories(),
              SizedBox(height: 30,),
             Row(
              
               children: [
                 Text('Gaming Collection', style: TextStyle(
                   color: Colors.black, fontFamily: 'Mera', fontSize: 20, fontWeight: FontWeight.bold)
                 ),
                 
                 Container(
                   padding: EdgeInsets.only(left: 90),
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
             SizedBox(height: 10),
              SingleChildScrollView
               (
                 scrollDirection: Axis.horizontal,
                 child:
            GamingCollection(),
          ),
            ],), 
          ),
        ),
      )
    );
  }
}

class Categories extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = 
    [
        {"icon": "assets/witcher.png", "text": "DVD"},
        {"icon": "assets/controller.png", "text": "Controller"},
        {"icon": "assets/xbox.png", "text": "Xbox"},
        {"icon": "assets/mouse.png", "text": "Mouse"},
        {"icon": "assets/game.png", "text": "Game"},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
            ...List.generate(categories.length, (index) =>CategoryCard(icon: categories[index]["icon"], text: categories[index]["text"], press: (){},))
    ],);
  }
}
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
    
  })  : super(key : key);

   final String icon, text;
   final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: press,
      child: SizedBox(
      width: 65,
      child: Column(children: [
       AspectRatio(aspectRatio: 1,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration
      (color: Colors.teal,
      borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(icon),
      ),
      ),
      SizedBox(height: 5,),
      Text(text,
        textAlign: TextAlign.center,
      )
      
      ]),
      ),
    );
      
  }
}
Color withOpacity(double opacity) {
  assert(opacity >= 0.0 && opacity <= 1.0);
  return withAlpha((255.0 * opacity).round());
  }
  
  // ignore: missing_return
  Color withAlpha(int round) {
}

class GamingCollection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(children: [
              
               Container
                 (
                   padding: EdgeInsets.only(left: 10),
                   child:
             ClipRRect
             (
               borderRadius: BorderRadius.circular(20),
               child: 
             Stack(
               children: [
              
                 Image.asset(
                   'assets/playstation4.jpg',
                   fit: BoxFit.cover,
                   color: Color.fromRGBO(255, 255, 255, 0.6),
                   colorBlendMode: BlendMode.modulate,
                   height: 150,
                   width: 220,
                 ),
                 FlatButton
                 (
                   onPressed: (){},
                   child:
                 Text.rich(
                   TextSpan(
                     style: TextStyle(color: Colors.white, ),
                     children: 
                     [
                       TextSpan
                       (
                         text: "PlayStation4\n",  //The Name of the Product here
                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, ),
                       ),
                  
                      
                        TextSpan
                       (
                         text: "RS 33,000\n",  //The Name of the Product here
                         style: TextStyle( fontSize: 15, fontFamily: 'robot'),
                       )
                     ]
                   )
                 )
                 ),
               ],
             ),
             )
             ),
              Container
                 (
                   padding: EdgeInsets.only(left: 10),
                   child:
             ClipRRect
             (
               borderRadius: BorderRadius.circular(20),
               child: 
             Stack(
               children: [
              
                 Image.asset(
                   'assets/xboxone.jpg',
                   fit: BoxFit.cover,
                   color: Color.fromRGBO(255, 255, 255, 0.6),
                   colorBlendMode: BlendMode.modulate,
                   height: 150,
                   width: 220,
                 ),
                 FlatButton
                 (
                   onPressed: (){},
                   child:
                 Text.rich(
                   TextSpan(
                     style: TextStyle(color: Colors.white, ),
                     children: 
                     [
                       TextSpan
                       (
                         text: "Xbox One\n",  //The Name of the Product here
                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, ),
                       ),
                  
                      
                        TextSpan
                       (
                         text: "RS 29,000\n",  //The Name of the Product here
                         style: TextStyle( fontSize: 15, fontFamily: 'robot'),
                       )
                     ]
                   )
                 )
                 ),
               ],
             ),
             )
             ),
              Container
                 (
                   padding: EdgeInsets.only(left: 10),
                   child:
             ClipRRect
             (
               borderRadius: BorderRadius.circular(20),
               child: 
             Stack(
               children: [
              
                 Image.asset(
                   'assets/gpu.jpg',
                   fit: BoxFit.cover,
                   color: Color.fromRGBO(255, 255, 255, 0.6),
                   colorBlendMode: BlendMode.modulate,
                   height: 150,
                   width: 220,
                 ),
                 FlatButton
                 (
                   onPressed: (){},
                   child:
                 Text.rich(
                   TextSpan(
                     style: TextStyle(color: Colors.white, ),
                     children: 
                     [
                       TextSpan
                       (
                         text: "Intel UHD 6200\n",  //The Name of the Product here
                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, ),
                       ),
                  
                      
                        TextSpan
                       (
                         text: "RS 17,000\n",  //The Name of the Product here
                         style: TextStyle( fontSize: 15, fontFamily: 'robot'),
                       )
                     ]
                   )
                 )
                 ),
               ],
             ),
             )
             ),
             ],);
  }
}