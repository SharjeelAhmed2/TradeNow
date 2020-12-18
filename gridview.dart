import 'package:flutter/material.dart';
import 'package:lauda/grid/gridData.dart';

class Grud extends StatefulWidget {
  @override
  _GrudState createState() => _GrudState();
}

class _GrudState extends State<Grud> {
   List<Product21> productList =[
    Product21(name: "Xbox360 Games", price: "13,000", image: "assets/games.jpg", username: "Sharjeel"),
    Product21(name: "PlayStation4", price: "33,000", image: "assets/playstation4.jpg", username: "Sharjeel"),
     Product21(name: "Xbox360", price: "21,000", image: "assets/xbox.png", username: "Sharjeel"),
      Product21(name: "Intel HD Graphics Card", price: "25,000", image: "assets/gpu.jpg", username: "Sharjeel"),
  ];
    List<Product21> productList1 =[
    Product21(name: "Xbox360 Games", price: "13,000", image: "assets/games.jpg", username: "Sharjeel"),
    Product21(name: "PlayStation4", price: "33,000", image: "assets/playstation4.jpg", username: "Sharjeel"),
     Product21(name: "Xbox360", price: "21,000", image: "assets/xbox.png", username: "Sharjeel"),
      Product21(name: "Intel HD Graphics Card", price: "25,000", image: "assets/gpu.jpg", username: "Sharjeel"),
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
   bool isLoading = false;

  Future _loadData() async {
    // perform fetching data delay
    await new Future.delayed(new Duration(seconds: 2));

      print("load more");
          // update data and loading status
          setState(() {
              productList1.add(productList1[0]);
             productList1.add(productList1[1]);
            isLoading = false;
          });
        }
         Future _removeData(int index) async {
    // perform fetching data delay
    await new Future.delayed(new Duration(seconds: 2));

      print("load more");
          // update data and loading status
          setState(() {
             productList1.remove(productList1[index]);
            isLoading = false;
          });
        }

  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          child: Column(children: [
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
           SizedBox(height: 10),
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
           child: GridView.builder(
           gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
           itemCount: productList1.length,
          itemBuilder: (BuildContext context, int index)
          {
            return Dismissible(
                  key: Key(productList1[index].toString()),
                  onDismissed: (direction)
                  {
                    // productList1.removeAt(index);
                    _removeData(index);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Ad Dismissed"),
                    ));
                  },
                  background: Container(color: Colors.white,),
                 
         child:   InkResponse(
              child: showData(productList1[index]),
              onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GridData(product21: productList1[index],))
                  );},
         )
            );
          },
         ),
         )
         ),
         Container(
            height: isLoading ? 50.0 : 0,
            color: Colors.transparent,
            child: Center(
              child: new CircularProgressIndicator(),
            ),
          ),
          ]),
        ),
         floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add_shopping_cart),
        onPressed: (){
          Navigator.pushNamed(context, '/listPage');
        },
      )
    )
    );
  }
}

 class Product21
{
  String name;
  String image;
  String price;
  String username;

  Product21({this.name, this.image, this.price, this.username});
}

