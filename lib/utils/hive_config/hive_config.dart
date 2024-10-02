
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import '../../features/cart/adapter/cart_model_adapter.dart';
import '../../features/cart/model/cart_model.dart';
import '../../features/products/adapter/category_model_adapter.dart';
import '../../features/products/adapter/products_model_adapter.dart';
import '../../features/products/model/products_model.dart';



class HiveConfig {
  late Box<ProductsModel> productModelBox;
  late Box<CartModel> cartModelBox;
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductsModelAdapter());
    Hive.registerAdapter(CartModelAdapter());

    productModelBox=await Hive.openBox<ProductsModel>("AllProduct");
    cartModelBox=await Hive.openBox<CartModel>("AllCart");

}

}
