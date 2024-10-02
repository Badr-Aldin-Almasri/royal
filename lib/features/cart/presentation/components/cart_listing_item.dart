

import 'package:flutter/material.dart';
import 'package:royal/features/cart/model/cart_model.dart';

class CartListingItem extends StatelessWidget {
  final CartModel cartModel;
  const CartListingItem({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child:Container(
        padding: const EdgeInsets.all(8),
        height: 150,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            ClipRRect
              (borderRadius: BorderRadius.circular(15),
              child: SizedBox(width: 150,
              child:Image.network(cartModel.image, fit: BoxFit.cover),),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Text(cartModel.name,overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold),)),
                  Text(cartModel.price.toString()),
                  const Text(' AED'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
