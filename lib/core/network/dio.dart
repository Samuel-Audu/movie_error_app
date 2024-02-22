import 'package:dio/dio.dart';
import 'package:movies_errors/core/env/env.dart';


class NetworkRequester {
  NetworkRequester({
    required this.dio,
  });

  final Dio dio;

  Future<dynamic> get(
    String endpoint, {
    bool isProtected = true,
    bool isFormData = false,
  }) async {
    Response response = await Dio().get(
      '${Env.baseUrl}$endpoint',
      options: Options(headers: {
        if (isProtected) 'Authorization': 'Bearer ${Env.apiKey}',
        'Content-Type': isFormData ? 'multipart/form-data' : 'application/json',
      }),
      queryParameters: {'api_key': Env.apiKey}
    );
    return response.data;
  }

  Future<dynamic> search(
    String endpoint,
    String query, {
    bool isProtected = true,
    bool isFormData = false,
  }) async {
    Response response = await Dio().get(
      '${Env.baseUrl}$endpoint',
      queryParameters: {
        'query':query,
        'include_adult': false,
        'language' : 'en-US'
      },
      options: Options(headers: {
        if (isProtected) 'Authorization': 'Bearer ${Env.apiKey}',
        'Content-Type': isFormData ? 'multipart/form-data' : 'application/json',
      }),
    );

    return response.data;
  }

}