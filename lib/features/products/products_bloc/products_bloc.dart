import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:royal/core/platform/transformers/throttle_duration.dart';
import 'package:royal/features/products/model/products_model.dart';
import 'package:royal/features/products/products.dart';

part 'products_bloc.freezed.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _userRepository;
  ProductsBloc(this._userRepository) : super(ProductsState.initial()) {
    on<_GetAllProducts>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
          final data = await _userRepository.getAllProducts();
          data.fold(
            (error) {
              return emit(state.copyWith(
                  errorMessage: error.errorStatus, isLoading: false));
            },
            (success) {
              return emit(state.copyWith(
                  productsData: success, errorMessage: null, isLoading: false));
            },
          );
      },
      transformer: throttleDroppable(throttleDuration),
    );
  }
}
