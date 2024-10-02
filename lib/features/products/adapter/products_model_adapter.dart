import 'package:hive/hive.dart';

import '../model/products_model.dart';




class ProductsModelAdapter extends TypeAdapter<ProductsModel>{
  @override
  ProductsModel read(BinaryReader reader) {
    final map = Map<String, dynamic>.from(reader.read() as Map);
    return ProductsModel.fromJson(map);
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, ProductsModel obj) {
    writer.write(obj.toJson());
  }
}