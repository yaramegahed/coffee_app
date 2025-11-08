import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio=Dio();
  final baseUrl = "https://valentinos-coffee.herokuapp.com";


  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get("$baseUrl$endPoint");
    return response.data;
  }
}
