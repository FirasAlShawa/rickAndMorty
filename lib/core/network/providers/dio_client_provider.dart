import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioClientProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api',
    ),
  )..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        responseHeader: false,
        error: false,
        compact: true,
        maxWidth: 90,
      ),
    ),
);
