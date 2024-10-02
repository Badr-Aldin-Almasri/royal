part of '../products.dart';

class ProductsApiServiceImpl implements ProductsApiService {
  ProductsApiServiceImpl({required this.dioConfig});

  final DioConfig dioConfig;

  @override
  Future<Map<String, ProductsModel>> fetchAllProducts() async {
    try {
      final client = dioConfig.client();
      final response = await client.get(ApiRoutes.products);
      if (response.data == null) {
        final error = 'Something went wrong';
        print('Error is: $error');
        throw ResponseError(errorStatus: error.toString());
      }
      if (response.data != null) {
        final rowData = response.data! as List;
        final Map<String, ProductsModel> parsedMap = Map.fromEntries(
            rowData.map((item) => MapEntry(item['id'].toString(),
                ProductsModel.fromJson(item as Map<String, dynamic>)))
                .toList());
        return parsedMap;
      }
      return <String, ProductsModel>{};
    } on DioException catch (e) {
      print('Error is: ${e.message}');
      throw ResponseError(errorStatus: e.message ?? "UNKNOWN ERROR");
    }
  }

}