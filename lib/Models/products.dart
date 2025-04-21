
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'dart:ui';

class Products{
  final int id;
  final String title;
  final String category;
  final String image;
  final String description;
  final double price;
  int quantity;

  Products({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
    required this.quantity,

  });
  factory Products.fromJson(Map<String,dynamic>json){
    return Products(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        price: json["price"].toDouble(),
        description: json["description"],
        image: json["image"],
        quantity: json["Quantity"]??0);
  }
}

class ProductService{
  Future<List<Products>>fetchProduct()async{
    final response=await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(response.statusCode==200){
      List<dynamic> data = json.decode(response.body);
      return data.map((json)=>Products.fromJson(json)).toList();
    }else{
      throw Exception("Failed to load products${response.statusCode}");
    }
  }
}

