import 'package:dio/dio.dart';

class DioHelber{
  static Dio dio = Dio();

  static init()
  {
    dio = Dio(
        BaseOptions(
            baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
        )
    );
  }
 static  Future<Response> GetData({
  required String url,
   Map<String,dynamic>? query,
    String Lang = 'en',
    String? Token
}) async {
    dio.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : Lang,
      'token' : Token
    };
   return await dio.get(
       url,
     queryParameters: query
   );
}

  static  Future<Response> PostData({
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data
  }) async {
    return await dio.post(
        url,
        queryParameters: query,
        data: data
    );
  }
}
