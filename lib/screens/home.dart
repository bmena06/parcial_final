
import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/producto.dart';
import 'package:flutter_firebase/screens/category.dart';
import 'package:flutter_firebase/screens/description.dart';

import 'package:flutter_firebase/provider/product_provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductCategory()));
          }, icon: Icon(Icons.view_list)),
        ],
      ),

      body: FutureBuilder(
          future: APIService().getAllProduct(),
          builder: (context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return  Center(child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    Product product = snapshot.data[index];
                    return ListTile(
                      title: Text(product.title, style: TextStyle(fontWeight: FontWeight.bold)),
                      leading: Image.network(product.image, height: 50, width: 30,),
                      subtitle: Text("Precio - \$${product.price.toString()}"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(product.id)));
                      },
                    );

                  }),);
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }),
    );
  }
}
