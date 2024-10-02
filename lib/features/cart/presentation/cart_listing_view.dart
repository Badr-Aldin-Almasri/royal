import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal/features/cart/cart_cubit/cart_cubit.dart';
import 'package:royal/features/cart/model/cart_model.dart';
import 'package:royal/features/cart/presentation/components/cart_listing_item.dart';

class CartListingView extends StatelessWidget {
  const CartListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: BlocBuilder<CartCubit,List<CartModel>>(
        builder: (context,state){
          if(state.isEmpty){
            return Center(child: Text("No item on cart"),);
          }
          return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context,index){
                final cartModel = state[index];
            return CartListingItem(cartModel: cartModel);
          });
        },
      ),
    );
  }
}
