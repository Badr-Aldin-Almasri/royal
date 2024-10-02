import 'package:bloc/bloc.dart';
import 'package:royal/features/products/model/products_model.dart';
import 'package:royal/utils/hive_config/hive_config.dart';
import '../model/cart_model.dart';

class CartCubit extends Bloc<CartCubit, List<CartModel>> {
  final HiveConfig hiveConfig;
  CartCubit(this.hiveConfig) : super(hiveConfig.cartModelBox.values.toList());

  addToCart(ProductsModel productsModel) {
    final model = CartModel(
        image: productsModel.images.first,
        name: productsModel.title,
        price: productsModel.price.toString(),
        id: productsModel.id.toString());
    state.add(model);
    hiveConfig.cartModelBox.put(productsModel.id, model);
    emit(state);
  }
}
