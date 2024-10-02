import 'package:hive/hive.dart';

import '../model/cart_model.dart';

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  CartModel read(BinaryReader reader) {
    final map = Map<String, dynamic>.from(reader.read() as Map);
    return CartModel.fromJson(map);
  }

  @override
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer.write(obj.toJson());
  }
}
