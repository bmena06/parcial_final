import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/provider/product_provider.dart';
import 'package:flutter_firebase/models/producto.dart';

class ProductDetails extends StatelessWidget {
  final int id;

  ProductDetails(this.id);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descripción'),
      ),
      body:
      FutureBuilder(
          future: APIService().getSingleProduct(id),
          builder: (context, AsyncSnapshot snapShot) {
            if (snapShot.hasData) {
              Product product = snapShot.data;


                    return Container(
                      margin: EdgeInsets.all(10.0),
                      child: ListView(children: [
                        Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          
                          children: [

                            Center(child:
                            Text('Descripción Del Producto', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black,),),),
                            SizedBox(height: 30,),
                            Image.network(product.image),
                            Text("Descripión: \n"+product.description, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                            SizedBox(height: 30,),
                            Text(
                                "Precio ~ \$" + product.price.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Rating ~ " +
                                product.rating.rate.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Cantidad ~ " +
                                product.rating.count.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 30,),
                            Chip(label:
                            Text(product.category.name, style: TextStyle(color: Colors.white, fontSize: 15),),backgroundColor: Colors.red),
                          ],
                        ),
                      ],)
                    );

            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
