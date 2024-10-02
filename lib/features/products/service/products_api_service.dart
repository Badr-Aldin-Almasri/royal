part of '../products.dart';

abstract class ProductsApiService {
  Future<Map<String, ProductsModel>> fetchAllProducts();
}