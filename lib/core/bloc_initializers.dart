
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:royal/features/cart/cart_cubit/cart_cubit.dart';
import 'package:royal/features/cart/model/cart_model.dart';
import 'package:royal/features/products/products_bloc/products_bloc.dart';


class BlocInitializers extends StatelessWidget {
   BlocInitializers({required this.child, super.key});
  final getIt = GetIt.instance;

  final Widget child;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers:  [
      BlocProvider(create: (context) => getIt<ProductsBloc>()..add(const ProductsEvent.getAllProducts()),),
      BlocProvider(create: (context) => getIt<CartCubit>()),
    ],
    child: child,
  );
}
