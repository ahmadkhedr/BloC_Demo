import 'package:bloc_pattern/Constants/Strings.dart';
import 'package:bloc_pattern/Data_Layer/Models/CharcterModel.dart';
import 'package:dio/dio.dart';

class CharctersWebServices {
  late Dio dio;

  CharctersWebServices() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 20 * 1000, //20 Seconds
        receiveTimeout: 20 * 1000);

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharcters() async {
    try {
      Response response = await dio.get('characters');
      //print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
