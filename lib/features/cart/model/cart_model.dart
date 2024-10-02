import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart'; // This file will be generated

@JsonSerializable()
class CartModel {
  late String image;
  late String name;
  late String price;
  late String id;

  CartModel({
    required this.image,
    required this.name,
    required this.price,
    required this.id,
  });

  // Factory method to create a CartModel from JSON
  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  // Method to convert CartModel to JSON
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
