

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Models/products.dart';

class CartProvider extends ChangeNotifier{
  final List<Products> _Cart = [];
  List<Products> get cart => _Cart;

  void toggleProduct(Products product){
    if(_Cart.contains(product)){
      for(Products element in _Cart){
        element.quantity++;
      }
    }else{
      _Cart.add(product);
    }
  

}
incrementQuantity(int index)=>_Cart[index].quantity++;
  decrementQuantity(int index)=>_Cart[index].quantity--;

  getTotalPrice(){
    double total=0.0;
    for(Products element in _Cart){
      total += element.price*element.quantity;
    }
    return total;
  }
static CartProvider of(
    BuildContext context,{
      bool listen = true
  }){
    return Provider.of(
      context,
      listen: listen
    );
}
}
