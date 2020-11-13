import 'dart:io';
import 'package:Project/Ad/DisplayAd.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class AdPosting extends StatefulWidget {
  final String name;

  const AdPosting({Key key, this.name}) : super(key: key);
  
  @override
  _AdPostingState createState() => _AdPostingState();
}

class _AdPostingState extends State<AdPosting> {

  //This future is going to be used to create that dialog to choose fromt the camera or the gallery
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

//File ImageFile gets the Image from gallery or from camera
    File imageFile;
  cameraConnect() async {
   // print('Picker is Called');
    File img = await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 300, maxWidth: 300);
    if (img != null) {
      imageFile = img;
      setState(() {});
    }
      Navigator.of(context).pop();
  }
   calleryConnect() async {
    // print('Picker is Called');
    File img = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 300, maxHeight: 300);
    if (img != null) {
      imageFile = img;
      setState(() {});
    }
      Navigator.of(context).pop();
  }
  
  
 TextEditingController name = TextEditingController();
 TextEditingController description = TextEditingController();
 TextEditingController price = TextEditingController();
 
  //The list of options
   List bidOptions =
  ["Rent", "Sale", "Trade"];

   List category =
   [
     "Books", "Game", 
   ];

  List types =
  [
    "New", "Used",
  ];

          //Objects that will be initialized in the InitState
  List<DropdownMenuItem<String>> dropDownMenuItems;
  String currentbid;

 
  List<DropdownMenuItem<String>> dropDownMenuItems1;
  String choseType;  

  List<DropdownMenuItem<String>> dropDownMenuItems2;
  
  String selectCategory; 
  

  
     @override
  void initState() {
    dropDownMenuItems = getDropDownMenuItems();
    currentbid = dropDownMenuItems[0].value;
      dropDownMenuItems2 = getDropDownMenuItems2();
    selectCategory = dropDownMenuItems2[0].value;
      dropDownMenuItems1 = getDropDownMenuItems1();
    choseType = dropDownMenuItems1[0].value;
    super.initState();
  }
    
  
  // For the New and Old Type
  
   List<DropdownMenuItem<String>> getDropDownMenuItems2() {
    List<DropdownMenuItem<String>> items = new List();
    for (String typess in types) {
      items.add(new DropdownMenuItem(
          value: typess,
          child: new Text(typess)
      ));
    }
    return items;
  }

    //For the Book or Game

   List<DropdownMenuItem<String>> getDropDownMenuItems1() {
    List<DropdownMenuItem<String>> items = new List();
    for (String cat in category) {
      items.add(new DropdownMenuItem(
          value: cat,
          child: new Text(cat)
      ));
    }
    return items;
  }

   //For the Biding Options

   List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String bid in bidOptions) {
      items.add(new DropdownMenuItem(
          value: bid,
          child: new Text(bid)
      ));
    }
    return items;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Post your Ad here sire'),
      ),
       body: SingleChildScrollView(
         child: SafeArea(


     //The place where youre Image will be posted
         child: 
         Column(children: [   
             Container(
          padding: EdgeInsets.all(10),
              child:    imageFile == null ? Center(
                child: Text('Post product image')) : Image.file(imageFile),
           ), 
           Inputs(name: name, description: description, price: price),
           SizedBox(height: 4,),


           //For the Bidiing Options
            Padding(
            padding: EdgeInsets.only(left: 10),
            child:
          Row(children: [
          Container(child: 
             Text('Choose Bid', style: TextStyle( fontFamily: 'Railway', fontWeight: FontWeight.w900, fontSize: 19, color: Colors.grey[500])),),
             SizedBox(width: 30,),
             Container(
               child: DropdownButton(
                  value: currentbid,
                  items: dropDownMenuItems,
                onChanged: changedDropDownItem,
              ),
             )
          ],),
          ),



          //For the Old New Dropdown
          Padding(
            padding: EdgeInsets.only(left: 10),
            child:
          Row(children: [
          Container(child: 
             Text('Choose type', style: TextStyle( fontFamily: 'Railway', fontWeight: FontWeight.w900, fontSize: 19, color: Colors.grey[500])),),
             SizedBox(width: 30,),
             Container(
               child: DropdownButton(
                  value: choseType,
                  items: dropDownMenuItems1,
                onChanged: changedDropDownItem1,
              ),
             )
          ],),
          ),


          //For the Book vs Game
          Padding(
            padding: EdgeInsets.only(left: 10),
            child:
          Row(children: [
          Container(child: 
             Text('Choose Category', style: TextStyle( fontFamily: 'Railway', fontWeight: FontWeight.w900, fontSize: 19, color: Colors.grey[500])),),
             SizedBox(width: 30,),
             Container(
               child: DropdownButton(
                  value: selectCategory,
                  items: dropDownMenuItems2,
                onChanged: changedDropDownItem2,
              ),
             )
          ],),
          ),

          
                     SizedBox(height: 20,),
          ///The Button which you press to get the Image
           Center(
            child: Container(

             decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
             ),
             child: FlatButton(
               child: Text('Select Product Image', style: TextStyle(color: Colors.white)),
               onPressed: () {
                 _showChoiceDialog(context);
               },
             )
            ),
           ),
           
         ],),
       )
       ),

       //The button that throws you to the next display ad page 
        floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add_shopping_cart),
        onPressed: (){ 
                 var route = MaterialPageRoute(builder: (BuildContext context) => DisplayAd(description: description.text, price: price.text, imageFile: imageFile, name: name.text, username: widget.name,));
                 Navigator.of(context).push(route);
        },
        
      ),
    );
  }
  void changedDropDownItem(String selectedbid) {
    setState(() {
      currentbid = selectedbid;
    });
  }
   void changedDropDownItem1(String selectType) {
    setState(() {
      choseType = selectType;
    });
  }
   void changedDropDownItem2(String selectCategory) {
    setState(() {
      selectCategory = selectCategory;
    });
  }
}



class Inputs extends StatelessWidget {
  const Inputs({
    Key key,
    @required this.name,
    @required this.description,
    @required this.price,
  }) : super(key: key);

  final TextEditingController name;
  final TextEditingController description;
  final TextEditingController price;

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.all(10),
      child: 
    Column(children: [
      
      TextFormField(
      controller: name,
       decoration: InputDecoration(
       hintText: "Enter Product Name",
       ),
    ),
    SizedBox(height: 19,),
    TextFormField(
       controller: description,
       decoration: InputDecoration(
       hintText: "Enter Your Description",
       ),
    ),
      SizedBox(height: 19,),
    TextFormField(
       controller: price,
       decoration: InputDecoration(
       hintText: "Enter the Price",
       ),
    ),

    ],),
    );
  }
}