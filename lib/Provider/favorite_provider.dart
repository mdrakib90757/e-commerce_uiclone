

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Models/products.dart';

class FavoriteProvider extends ChangeNotifier{
final List<Products> favorite=[];
List<Products>get favorites=>favorite;
 void toggleFavorite(Products product){

   if(favorites.contains(product)){
     favorites.remove(product);
   }else{
     favorites.add(product);
   }
   notifyListeners();
 }
 bool isExist(Products product){
   final isExist=favorites.contains(product);
   return isExist;
 }

  static FavoriteProvider of(
BuildContext context,{
bool listen=true
}){
return Provider.of<FavoriteProvider>(
context,
listen: listen
);
}

}