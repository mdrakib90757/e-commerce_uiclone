


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/products.dart';
import '../Provider/favorite_provider.dart';
import '../utils/color.dart';

class ProductCard extends StatefulWidget {
  final Products product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    print(widget.product);
    final Provider = FavoriteProvider.of(context);

    return Container(
      width: MediaQuery.of(context).size.width/2,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.1)
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                 onTap: ()=>Provider.toggleFavorite(widget.product),
                  child: Icon( Provider.isExist(widget.product)? Icons.favorite:
                  Icons.favorite_border_outlined,
                    color:AppColor.primaryColors
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 100,
              width: 100,
              child: Image.network(widget.product.image,
              fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5,),
            Text(widget.product.title,style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16
            ),),
            Text(widget.product.description,style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
              color:Colors.black,
              fontWeight: FontWeight.w500
            ),),
            Text("\$" "${widget.product.price} ",style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),

          ],
        ),
      ),
    );
  }
}
