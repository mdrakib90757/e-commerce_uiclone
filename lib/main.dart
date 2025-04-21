import 'package:e_commarce_project/Provider/cart_provider.dart';
import 'package:e_commarce_project/Provider/favorite_provider.dart';
import 'package:e_commarce_project/nevigation_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) =>MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context)=>FavoriteProvider()),
        ChangeNotifierProvider(create: (BuildContext context)=>CartProvider())
      ],
  
  
  child: 
     MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: NevigationScreen()
    )
  );
  
}


