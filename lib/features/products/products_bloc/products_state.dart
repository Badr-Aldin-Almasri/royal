part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
   required Map<String, ProductsModel> productsData,
    required bool isLoading,
    String? errorMessage
  }) = _ProductsState;
   factory ProductsState.initial() => ProductsState(productsData:{},isLoading:false);
}
