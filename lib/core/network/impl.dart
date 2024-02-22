import 'package:dio/dio.dart';

class ImplFormatter{
  ImplFormatter();

  Future<dynamic> format(Function function) async{
    try {
      return await function.call();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.connectionTimeout) {
        return 'Connection has timed out';
      }

      if (e.response == null || e.response!.data == null) {
        return e.response?.data['message'] ?? e.message;
      }

      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        return e.response?.data['message'];
      }

      return e.message ?? '';
    } catch(e) {
      return e.toString();
    }
  } 
}