import 'package:hive/hive.dart';
import '../model/products_model.dart';

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  CategoryModel read(BinaryReader reader) {
    final map = Map<String, dynamic>.from(reader.read() as Map);
    return CategoryModel.fromJson(map);
  }

  @override
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer.write(obj.toJson());
  }
}
