import 'package:flutter/material.dart';
import 'package:lauda/ad/listClick.dart';

import 'package:lauda/navigation/navbaar.dart';

class ListPagination extends StatefulWidget {
  @override
  _ListPaginationState createState() => _ListPaginationState();
}

class _ListPaginationState extends State<ListPagination> {
  List<Product> productList =[
    Product(name: "Xbox360 Games", price: "13,000", image: "assets/games.jpg", username: "Sharjeel", contact: "0331-3919016", description: "It's a collection of games with over 100 different xbox 360 games pls buy i am broke"),
    Product(name: "PlayStation4", price: "33,000", image: "assets/playstation4.jpg"),
     Product(name: "Xbox360", price: "21,000", image: "assets/xbox.png"),
      Product(name: "Intel HD Graphics Card", price: "25,000", image: "assets/gpu.jpg"),
  ];
  
    List<Product> productList1 =[
    Product(name: "Xbox360 Games", price: "13,000", image: "assets/games.jpg",username: "Sharjeel", contact: "0331-3919016", description: "It's a collection of games with over 100 different xbox 360 games pls buy i am broke"),
    Product(name: "PlayStation4", price: "33,000", image: "assets/playstation4.jpg"),
     Product(name: "Xbox360", price: "21,000", image: "assets/xbox.png"),
      Product(name: "Intel HD Graphics Card", price: "25,000", image: "assets/gpu.jpg"),
  ];

List<String> products =
[
  "One", "Two", "Three", "Four", "Five"
];
   Widget showData(data)
   {
     return Card(
       child: Center(
       child: Row(
         children: [
              Image.asset(data.image, width: 160, height: 160),
              SizedBox(width: 10),
           Column(
            children:[
              SizedBox(height: 4,),
              Text(data.name),
              SizedBox(height: 4,),
              Text(data.price)
            ]
           ),
         ],
       )
       )
     );
   }

  bool isLoading = false;

  Future _loadData() async {
    // perform fetching data delay
    await new Future.delayed(new Duration(seconds: 2));

      print("load more");
          // update data and loading status
          setState(() {
              productList1.add(productList1[0]);
            isLoading = false;
          });
        }
           Future _removeData(int index) async {
          setState(() {
             productList1.remove(productList1[index]);
            isLoading = false;
          });
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
                 hintText: 'Enter Name', 
             ),
             onChanged: (string)
             {
                 setState(() {
                   productList1 = productList.where((element) => (element.name.toLowerCase().contains(string.toLowerCase()) || element.price.toLowerCase().contains(string.toLowerCase()))).toList();
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
            Expanded(
              child: NotificationListener<ScrollNotification>(
              // ignore: missing_return
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading && scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
                  _loadData();
                  // start loading data
                  setState(() {
                    isLoading = true;
                  });
                }
              },
             child: ListView.builder(
               itemCount: productList1.length,
               itemBuilder: (BuildContext context, int index)
               {
                 return Dismissible(
                  key: Key(productList1[index].toString()),
                  onDismissed: (direction)
                  {
                    if(productList1.contains(index))
                    {
                            _removeData(index);
                    }
                    productList1.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Ad Dismissed"),
                    ));
                  },
                  background: Container(color: Colors.red,),
                 
                  child: ListTile(
                    title: showData(productList1[index]),
                    onTap: (){
                                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowAdOnClick(),
                      )
                    );
                    },
                  ),
                 );
               }
             )
              ),
           ),
           Container(
            height: isLoading ? 50.0 : 0,
            color: Colors.transparent,
            child: Center(
              child: new CircularProgressIndicator(),
            ),
          ),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.arrow_back),
        onPressed: (){
           var route = MaterialPageRoute(builder: (BuildContext context) => ShowAdOnClick());
                 Navigator.of(context).push(route);}
    ),
    
       floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

       bottomNavigationBar: NavigationBar(),
    );
  }
}

class Product
{
  String name;
  String image;
  String price;
  String description;
  String username;
  String contact;

  Product({this.name, this.image, this.price, this.contact, this.username, this.description});
}