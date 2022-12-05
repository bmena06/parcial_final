import 'package:flutter_firebase/models/producto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<List<Product>> getAllProduct() async {
    final allProductUrl = Uri.parse("https://fakestoreapi.com/products/");
    final response = await http.get(allProductUrl);
    List<Product> allProducts = [];
    List body = json.decode(response.body);
    body.forEach((product) {
      allProducts.add(Product.fromJson(product));
    });
    //print(response.statusCode);
    // print(response.statusCode);
    // print(response.body);
    return allProducts;
  }

  Future getSingleProduct(int id) async {
    final singleProductUrl = Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await http.get(singleProductUrl);
    // print(response.statusCode);
    // print(response.body);
    var body = json.decode(response.body);
    return Product.fromJson(body);
  }

  Future getProductCategory() async{
    final allProductCategoryUrl = Uri.parse("https://fakestoreapi.com/products/categories");
    final response = await http.get(allProductCategoryUrl);

    //print(response.statusCode);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getProductByProductCategory(String id) async {
    final listOfProductByCategoryUrl =
        Uri.parse("https://fakestoreapi.com/products/category/$id");
    final response = await http.get(listOfProductByCategoryUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }


}
