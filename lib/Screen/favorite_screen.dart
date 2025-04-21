
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../Provider/favorite_provider.dart';
import '../utils/color.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final  Provider = FavoriteProvider.of(context);
    final finalList=Provider.favorites;
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text("Favorites",style: TextStyle(
                  fontSize: 27,fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
          Expanded(child:
          ListView.builder(
            itemCount: finalList.length,
              itemBuilder: (context, index) {
                return Padding(padding: EdgeInsets.all(10),
                child: Slidable(
                  endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(onPressed: (context) {
                          finalList.removeAt(index);
                          setState(() {

                          });
                        },
                          backgroundColor: AppColor.primaryColors,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: "Delete",
                        )
                      ]
                  ),
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Card(
                      child: ListTile(
                        title: Text(finalList[index].title,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),),
                        subtitle: Text(finalList[index].description,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500
                        ),),
                        leading: CircleAvatar(
                         radius: 30,
                          backgroundImage: NetworkImage(finalList[index].image),
                          backgroundColor: AppColor.primaryColors.withOpacity(.5),
                        ),
                        trailing: Text("\$""${finalList[index].price}",style:
                          const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),

                      ),
                    ),
                  ),
                ),
                );
              },
          ))
        ],
      )

    );
  }
}