import 'package:get_it/get_it.dart';
import 'package:royal/features/cart/cart_cubit/cart_cubit.dart';
import 'package:royal/utils/hive_config/hive_config.dart';

import '../../features/products/products.dart';
import '../../features/products/products_bloc/products_bloc.dart';
import '../../utils/dio_service/dio_config.dart';
import '../platform/network_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

final di = GetIt.I;

Future<void> init(HiveConfig hiveConfig) async {
  final connectivity = Connectivity();

  try {
    di
      ..registerFactory(DioConfig.new)
      ..registerFactory(()=>hiveConfig)
      ..registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(networkConnectionCheck: connectivity))
      ..registerLazySingleton<ProductsApiService>(
          () => ProductsApiServiceImpl(dioConfig: di<DioConfig>()))
      ..registerLazySingleton<ProductsRepository>(() =>
          ProductsRepositoryImpl(di<ProductsApiService>(), di<NetworkInfo>(),di<HiveConfig>()))
      ..registerFactory(() => ProductsBloc(di<ProductsRepository>()))
      ..registerFactory(() => CartCubit(di<HiveConfig>()));
  } catch (e) {
    print('Error during dependency injection setup: $e');
  }
}
