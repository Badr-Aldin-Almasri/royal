library products;

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:royal/core/constants/api_routes.dart';
import 'package:royal/features/cart/cart_cubit/cart_cubit.dart';
import 'package:royal/features/products/model/products_model.dart';
import 'package:royal/features/products/presentation/components/product_list.dart';
import 'package:royal/features/products/presentation/components/product_tab.dart';
import 'package:royal/features/products/presentation/components/product_top.dart';
import 'package:royal/features/products/products_bloc/products_bloc.dart';
import 'package:royal/utils/dio_service/dio_config.dart';
import 'package:dartz/dartz.dart' show Either,Left,Right;
import 'package:royal/utils/hive_config/hive_config.dart';
import '../../core/platform/network_info.dart';
import '../../core/route/route_import.dart';
import '../../utils/response_error/response_error.dart';

part 'package:royal/features/products/presentation/product_details_screen.dart';
part 'package:royal/features/products/presentation/components/product_listing_item.dart';
part 'package:royal/features/products/presentation/products_listing_screen.dart';
part 'package:royal/features/products/service/products_api_service.dart';
part 'package:royal/features/products/service/products_api_service_impl.dart';
part 'package:royal/features/products/repositories/products_repository.dart';
part 'package:royal/features/products/repositories/products_repository_impl.dart';
