

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../Models/products.dart';
import '../Widgets/Product_Card.dart';
import '../Widgets/available_size.dart';
import '../utils/color.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;
  List<Products>allProducts=[];
  List<Products>electronics=[];
  List<Products>jewelery=[];
  bool isLoading=true;
  @override
  void initState() {
    super.initState();
    fetchProduct();
  }
  Future<void>fetchProduct()async{
    final productService=ProductService();
    print(productService);
    try{
      final productsmenu=await productService.fetchProduct();
      setState(() {
        allProducts=productsmenu;
        electronics=productsmenu.where((product)=>product.category=="electronics").toList();
        jewelery=productsmenu.where((product)=>product.category=="jewelery").toList();
        isLoading=false;
      });

    }catch(exception){
      print(exception);
      isLoading=false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Our Products",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 27,
            ),),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(index: 0,name: "AllProduct"),
              _buildProductCategory(index: 1,name: "electronics"),
              _buildProductCategory(index: 2,name: "jewelery")
            ],
          ),
          SizedBox(height: 20,),
          Expanded(
              child: isLoading?Center(child: CircularProgressIndicator(),):
              isSelected==0?
              _buildAllProduct():
              isSelected==1?
              _buildelectronics():
              _buildjewelery()
          ),
        ],
      ),
    );
  }
  _buildProductCategory({required int index,required String name})=>
      GestureDetector(
        onTap: () => setState(() =>isSelected=index),
        child: Container(
          height: 50,
          width: 100,
          margin: EdgeInsets.only(top: 10,right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected==index?AppColor.
              primaryColors:AppColor.primaryColors.withOpacity(.5),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Text(name,style: TextStyle(
            color: Colors.white,
          ),),
        ),
      );

  _buildAllProduct() =>SizedBox(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 170/220,
      ),
      scrollDirection: Axis.vertical,
      itemCount: allProducts.length,

      itemBuilder: (context, index) {
        final product=allProducts[index];
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:
                  (context) => DetailsScreen(product: product),));
            },

            child: ProductCard(product: product));
      },
    ),
  );

  _buildelectronics() {
    print("${electronics.length}");
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 160 / 200,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12
      ),
      itemCount: electronics.length,
      itemBuilder: (context, index) {
        final product = electronics[index];
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => DetailsScreen(product: product),
              ));
            },

            child: ProductCard(product: product));
      },
    );
  }

  _buildjewelery()=>GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        childAspectRatio: 160/200,
        mainAxisSpacing: 12
    ),
    itemCount:jewelery.length,
    itemBuilder: (context, index) {
      final product=jewelery[index];
      return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => DetailsScreen(product: product),
            ));
          },
          child: ProductCard(product: product));
    },
  );
}




