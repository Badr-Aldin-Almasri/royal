part of '../products.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  ProductsRepositoryImpl(this._apiService, this.networkInfo, this.hiveConfig);
  final ProductsApiService _apiService;
  final HiveConfig hiveConfig;
  final NetworkInfo networkInfo;

  @override
  Future<Either<ResponseError, Map<String, ProductsModel>>> getAllProducts() async {
    try {
      if (await networkInfo.isConnected) {
        final response = await _apiService.fetchAllProducts();
        await hiveConfig.productModelBox.putAll(response);
        return Right(response);
      } else {
        if(hiveConfig.productModelBox.toMap().isNotEmpty){
          final response = Map<String,ProductsModel>.from(hiveConfig.productModelBox.toMap());
          return Right(response);
        }
        throw ResponseError(errorStatus: 'Internet connection lost.');
      }
    } on ResponseError catch (e) {
      return Left(e);
    }
  }
}
