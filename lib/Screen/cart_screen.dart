



import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../Provider/cart_provider.dart';
import '../utils/color.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  @override
  Widget build(BuildContext context) {
    final Provider=CartProvider.of(context);
    final finalList=Provider.cart;
    _buildProductQuantity(IconData icon,int index){
      return GestureDetector(
        onTap: () {
          setState(() {
            icon==Icons.add?
            Provider.incrementQuantity(index):
                Provider.decrementQuantity(index);
          });
        },
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primaryColors.withOpacity(.5)
          ),
          child: Icon(icon,size: 18,),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primaryColors,
        toolbarHeight: 70,
        title: Text("MyCart")   ,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child:
          ListView.builder(
            itemCount: finalList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(onPressed: (context) {
                            finalList[index].quantity=1;
                            finalList.removeAt(index);
                            setState((){
                            });
                          },
                          backgroundColor: AppColor.primaryColors,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: "Delete",
                          ),
                        ]
                    ),
                    child: ListTile(
                      title: Text(finalList[index].title,style:
                      const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),),

                      subtitle: Text("\$""${finalList[index].price}",
                      overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:NetworkImage(finalList[index].image),
                        backgroundColor: AppColor.primaryColors.withOpacity(.5),
                      ),
                      trailing: Column(
                        children: [
                          _buildProductQuantity(Icons.add, index),
                          Text(finalList[index].quantity.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          _buildProductQuantity(Icons.remove, index)
                        ],
                      ),
                      tileColor: Colors.white,
                    ),
                  ),
                );
              },
          ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            decoration:  BoxDecoration(
              color:AppColor.primaryColors ,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$ ${Provider.getTotalPrice()}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    iconColor: WidgetStatePropertyAll(
                      AppColor.primaryColors
                    ),
                    shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                    onPressed: () {
                    },
                    icon:Icon(Icons.add) ,
                    label: Text("Check out",
                    style: TextStyle(
                      color: AppColor.primaryColors
                    ),
                    ),
                )
              ],
            ),
          ),


        ],
      ),
    );
  }
}
