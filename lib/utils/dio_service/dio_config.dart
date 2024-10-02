
import 'package:dio/dio.dart';

import '../../core/constants/app_secrets.dart';

class DioConfig{
  Dio client()=> Dio(
    BaseOptions(
      baseUrl: AppSecrets.apiURL
    )
  );
}
