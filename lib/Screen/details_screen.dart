

import 'package:flutter/material.dart';

import '../Models/products.dart';
import '../Provider/cart_provider.dart';
import '../Widgets/available_size.dart';
import '../utils/color.dart';
import 'cart_screen.dart';


class DetailsScreen extends StatefulWidget {
  final Products product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Provider=CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => CartScreen(),));
          }, icon: Icon(Icons.add_shopping_cart,color: Colors.white,))
        ],

        title: const Text(
          "DetailsScreen",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        ),
        toolbarHeight: 70,
        backgroundColor: AppColor.primaryColors,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 36,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220,
                  height: 220,
                decoration: BoxDecoration(
                  color: AppColor.primaryColors.withOpacity(.5),
                  shape: BoxShape.circle
                ),
                child: Image.network(widget.product.image,fit: BoxFit.cover,)
              ),
            ],
          ),
           SizedBox(height: 36.0,),
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            //height: 400,
            decoration:  const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight:Radius.circular(40)
                )
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(widget.product.title.toUpperCase(),
                        style:  const TextStyle(
                          overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                        ),),
                    ),
                    Text("\$${widget.product.price},",
                      style:   TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        color: AppColor.primaryColors
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 14,),
                Text(widget.product.description,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                  fontSize: 18,
                ),),
                 const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Available Size",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),)
                  ],
                ),
                 const SizedBox(height: 10,),
                  const Row(
                  children: [
                    AvailableSize(size:"US 6"),
                    AvailableSize(size: "US 7"),
                    AvailableSize(size: "US 8"),
                    AvailableSize(size: "US 9"),
                  ],
                ),
                 SizedBox(height: 10,),
                 const Text("Available Colors",style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),
                 SizedBox(height: 5,),
                 const Row(
                  children: [

                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(width: 8.0,),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(width: 8.0,),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.yellow,
                    ),
                  ],
                )


              ],
            ),
          )
        ],
      ),
      bottomSheet: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child:Container(
         padding:  EdgeInsets.symmetric(horizontal:10),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height%50,
          decoration: BoxDecoration(
            color: AppColor.primaryColors,
            borderRadius: const BorderRadius.only(
              topLeft:Radius.circular(10),
              topRight: Radius.circular(10)
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$""${widget.product.price}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.white
              ),
              ),
              ElevatedButton.icon(

                style: ButtonStyle(
                  iconColor:WidgetStatePropertyAll(
                    AppColor.primaryColors
                  ),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))
                ),
                  onPressed: () {
                  Provider.toggleProduct(widget.product);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
                    }, icon: Icon(Icons.send),
              label: Text("Add to Cart",style: TextStyle(
                color: AppColor.primaryColors
              ),),


              )
            ],
          ),
        ),
      ),


    );
  }
}
