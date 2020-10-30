import 'dart:io';
import 'package:flutter/material.dart';
import 'package:randi/RouteFolder/Fourth.dart';
import 'package:image_picker/image_picker.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {

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
  
  
 TextEditingController name = TextEditingController();
 TextEditingController description = TextEditingController();
 TextEditingController price = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Post your Ad here sire'),
      ),
       body: SingleChildScrollView(
         child: SafeArea(

         child: 
         Column(children: [   
             Container(
          padding: EdgeInsets.all(10),
              child:    imageFile == null ? Center(
                child: Text('Post product image')) : Image.file(imageFile),
              width: 300,
              height: 300,
           ), 
           Container(
            padding: EdgeInsets.all(10),
             child: 
           Column(children: [
             
             TextFormField(
             controller: name,
              decoration: InputDecoration(
              hintText: "Enter Your Username",
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
           ),
                     SizedBox(height: 20,),
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
        floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add_shopping_cart),
        onPressed: (){
           var route = MaterialPageRoute(builder: (BuildContext context) => FourthScreen(texi: name.text, description: description.text, pricez: price.text, images: imageFile));
                 Navigator.of(context).push(route);
                 
        },
        
      ),
    );
  }
}