part of '../products.dart';


abstract class ProductsRepository {
  Future<Either<ResponseError,Map<String, ProductsModel>>> getAllProducts();
}